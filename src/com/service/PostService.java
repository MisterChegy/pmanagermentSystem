package com.service;

import org.springframework.ui.Model;

import com.po.Post;

public interface PostService {
	public String toAdd(Model model);
	public String addPost(Post post);
	public String selectPost(Model model,String act);
	public String selectAPost(Model model, Integer id, String act);
	public String deletePost(Model model, Integer id);
	public String updatePost(Post post);
	public String selectPostCon(Post post,Model model, String act);
}
