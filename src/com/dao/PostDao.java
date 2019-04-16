package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Post;

@Repository("postDao")
@Mapper
public interface PostDao {
	public int addPost(Post post);
	public List<Post> selectAllPost();
	public Post selectAPost(Integer id);
	public List<Post> selectSubPost(Integer id);
	public int deletePost(Integer id);
	public int updatePost(Post post);
	public List<Post> selectPostCon(Post post);
}
