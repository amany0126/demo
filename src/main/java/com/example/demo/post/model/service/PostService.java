package com.example.demo.post.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.demo.pageInfo.vo.PageInfo;
import com.example.demo.post.model.mapper.PostMapper;
import com.example.demo.post.vo.Post;
import com.example.demo.post.vo.PostAttachment;

@Service
public class PostService {
	@Autowired
	private PostMapper postMapper;

	
	public int insertPost(Post p) {
		return postMapper.insertPost(p);

	}

	public int insertPostAttachment(PostAttachment file) {
		return postMapper.insertPostAttachment(file);

	}

	public Page<Post> paging(Pageable pageable) {
		int page = pageable.getPageNumber() - 1;
		int pageLimit = 10;

		Page<Post> PostEntities = postMapper
				.findAll(PageRequest.of(page, pageLimit, Sort.by(Sort.Direction.DESC, "PostNo")));

		Page<Post> posts = PostEntities.map(postEntity -> Post.builder().postNo(postEntity.getPostNo())
				.postTitle(postEntity.getPostTitle()).postContent(postEntity.getPostContent())
				.postDate(postEntity.getPostDate()).memberNo(postEntity.getMemberNo()).build());
		return posts;

	}

	public int selectListAllCount() {
		return postMapper.selectListAllCount(); 
		}

	public ArrayList<Post> selectAllList(PageInfo pi) { 
		int limit =  pi.getPostLimit();		
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit) ;
		
		return postMapper.selectAllList(rowBounds); 
		}

	public Post selectPosrt(int pno) {
		return postMapper.selectPosrt(pno); 
	}

	public ArrayList<PostAttachment> selectPostAttachment(int pno) {
		return postMapper.selectPostAttachment(pno); 
	}

	public int deletePost(int pno) {
		return postMapper.deletePost(pno); 
	}

	public int deletePostAttachment(int pno) {
		return postMapper.deletePostAttachment(pno); 
	}

	public int updatePost(Post p) {
		return postMapper.updatePost(p); 
	}

	public int updatePostAttachment(PostAttachment dpa) {
		return postMapper.updatePostAttachment(dpa);
	}

	public int checkPost(Post p) {
		return postMapper.checkPost(p); 
	}

	public int insertUpdatePostAttachment(PostAttachment file) {
		return postMapper.insertUpdatePostAttachment(file);
	}


}
