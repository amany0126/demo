package com.example.demo.post.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.example.demo.post.vo.Post;
import com.example.demo.post.vo.PostAttachment;

@Mapper
public interface PostMapper {

	int insertPost(Post p);

	int insertPostAttachment(PostAttachment file);

	int selectListAllCount();

	Page<Post> findAll(PageRequest of);

	ArrayList<Post> selectAllList(RowBounds rowBounds);

	Post selectPosrt(int pno);

	ArrayList<PostAttachment> selectPostAttachment(int pno);

	int deletePost(int pno);

	int deletePostAttachment(int pno);

	int updatePost(Post p);

	int updatePostAttachment(PostAttachment dpa);

	int checkPost(Post p);

	int insertUpdatePostAttachment(PostAttachment file);


}
