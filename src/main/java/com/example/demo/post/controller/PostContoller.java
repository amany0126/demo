package com.example.demo.post.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.member.vo.Member;
import com.example.demo.pageInfo.template.Pagination;
import com.example.demo.pageInfo.vo.PageInfo;
import com.example.demo.post.model.service.PostService;
import com.example.demo.post.vo.Post;
import com.example.demo.post.vo.PostAttachment;

@Controller
public class PostContoller {
	
	@Autowired
	PostService postService;
	
	@GetMapping(value = "/insertPage.po")
	public String insertPage() {
		return "post/write";
	}
	@ResponseBody
	@PostMapping(value = "insertPost.po", produces = "text/html; charset=UTF-8")
	public String insertPost(Post p, MultipartFile[] upfile,HttpSession session) {
		 
		 int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		 
		 p.setMemberNo(""+ memberNo); 
		 
		 int Result1 = 0;
		 int Result2 = 1;
		 
		 Result1 = postService.insertPost(p);
		 if (upfile == null && Result1 ==1) {
			 Result2 = 1;
		}else {
			 for (int i = 0; i < upfile.length; i++) {
				 PostAttachment file = new PostAttachment();
				file.setOriginName(upfile[i].getOriginalFilename());
				String changName = savePath(upfile[i], session);
				file.setChangName(changName);
				
				Result2 += postService.insertPostAttachment(file);
			}
		}
		 
		 return (Result1*Result2>0)? "NNNY":"NNNN";
	}
	
	// 파일명 변경 및 저장 경로 지정 메소드
	public String savePath(MultipartFile upfile, HttpSession session) {
		
		// 1.원본파일명 가져오기
		String originName = upfile.getOriginalFilename();
		
		// 2. 파일 등록시간 구하기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 추가 난수 구하기
		int ranNum = (int)(Math.random()*90000000+10000000);
		
		// 4. 파일 확장자 구하기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 2~4 값 합치기
		String changName = currentTime + ranNum + ext;
		
		// 6. 업로드 하고자 하는 파일 경로 지정
		String savePath = session.getServletContext().getRealPath("/resources/board_file/");
		
		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
		try {
			upfile.transferTo(new File(savePath+changName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changName;
		
	}
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	@ResponseBody
	@PostMapping(value = "/selectPost.po")
	public Map<String, Object> selectPost(int currentPage,  Model model, HttpSession session) {
		
		ArrayList<Post> list = null;
		PageInfo pi  = null;
		
		int listCount = postService.selectListAllCount();
		int pageLimit = 10;
		int boardLimit = 10;
		// PageInfo 객체 만들어 내기
	    pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		list = postService.selectAllList(pi);
        
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getPostTitle().length() >20) {
				list.get(i).setPostTitle(list.get(i).getPostTitle().substring(0, 19)+"......");
			}
		}
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		map.put("list",list);
		map.put("pi",pi);
		map.put("cPage",currentPage);
		
		
		return map;
	}
	
	@GetMapping(value = "/detail.po")
	public String detailPost(int Pno,Model model){
		
		Post p = postService.selectPosrt(Pno);
		ArrayList<PostAttachment> pa = postService.selectPostAttachment(Pno);
		p.setPostTitle(p.getPostTitle().replace("\r\n", "<br>"));
		p.setPostTitle(p.getPostTitle().replace(" ", "&nbsp"));
		p.setPostContent(p.getPostContent().replace("\r\n", "<br>"));
		p.setPostContent(p.getPostContent().replace(" ", "&nbsp"));
		
		model.addAttribute("p",p);
		model.addAttribute("pa",pa);
		
		return "post/detail";
	}
	@ResponseBody
	@PostMapping(value = "/delete.po")
	public String deletePost(int pno,String file){
		
		int Result1 = postService.deletePost(pno);
		
		int Result2 = 1;
		
		if(file != null && file !="") {
			
			Result2  = postService.deletePostAttachment(pno);
		}
		
		return (Result1*Result2>0)? "NNNY":"NNNN";
	}
	
	@GetMapping(value = "/upDatePage.po")
	public String upDatePage(int Pno,Model model){
		
		Post p = postService.selectPosrt(Pno);
		ArrayList<PostAttachment> pa = postService.selectPostAttachment(Pno);
		model.addAttribute("p",p);
		model.addAttribute("pa",pa);

		
		return "post/modify";
	}
	
	@ResponseBody
	@PostMapping(value = "upDatePost.po", produces = "text/html; charset=UTF-8")
	public String upDatePost(Post p, MultipartFile[] upfile, String[] DeleteOrignalfilesArr ,HttpSession session) {

		
		 int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		 p.setMemberNo(""+ memberNo); 
		 
		 int Result1 = postService.updatePost(p);
		 
		 int Result2 = 1;
		 
		 if(upfile != null && Result1 == 1) {
			 for (int i = 0; i < upfile.length; i++) {
					 
					 PostAttachment file = new PostAttachment();
					file.setOriginName(upfile[i].getOriginalFilename());
					String changName = savePath(upfile[i], session);
					file.setChangName(changName);
					file.setPostNo(""+p.getPostNo());
			Result2 = Result2+ postService.insertUpdatePostAttachment(file);
		 }
	} 
		 
		 if( DeleteOrignalfilesArr.length !=0) {
		 for (int i = 0; i < DeleteOrignalfilesArr.length; i++) {
			
				 String changName = DeleteOrignalfilesArr[i];
				 PostAttachment Dpa = new PostAttachment();
				Dpa.setChangName(changName);
				Dpa.setPostNo(""+p.getPostNo());
				 postService.updatePostAttachment(Dpa);
				    String path = "C:/01. one/demo/src/main/webapp/resources/board_file/";
					String realPath= path+changName;
					new File(realPath).delete();
				}
		}
		 return (Result1*Result2>0)? "NNNY":"NNNN";
		 }
	@GetMapping(value = "/NoPost")
	public String index() {
		
		return "post/blank";
	}
}
