package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Post;
import com.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController extends BaseController{
	@Autowired
	private PostService postService;
	@RequestMapping("/toAdd")
	public String toAdd(Model model) {
		return postService.toAdd(model);
	}
	@RequestMapping("/addPost")
	@ResponseBody
	public String addPost(@ModelAttribute Post post) {
		return postService.addPost(post);
	}
	@RequestMapping("/selectPost")
	public String selectPost(Model model,String act) {
		return postService.selectPost(model,act);
	}
	@RequestMapping("/selectAPost")
	public String selectAPost(Model model, Integer id,  String act) {
		return postService.selectAPost(model,id, act);
	}
	@RequestMapping("/deletePost")
	@ResponseBody
	public String deletePost(Model model, @RequestBody Post post) {
		return postService.deletePost(model,post.getId());
	}
	@RequestMapping("/updatePost")
	@ResponseBody
	public String updatePost(@ModelAttribute Post post) {
		return postService.updatePost(post);
	}
	@RequestMapping("/selectPostCon")
	public String selectPostCon(@ModelAttribute Post post,Model model,String act) {
		return postService.selectPostCon(post,model,act);
	}
}
