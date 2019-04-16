package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Auser;
import com.service.AdminService;

@Controller
@RequestMapping("/user")   
public class AdminController {
	@Autowired
	private AdminService userService;
	
	@RequestMapping("/login")
	public String login(@ModelAttribute Auser buser,Model model, HttpSession session, String code) {
		return userService.login(buser, model, session, code);
	}
	/**
	 * ×ªµ½µÇÂ¼Ò³Ãæ
	 */
	@RequestMapping("/toLogin")
	public String toLogin(Model model) {
		return userService.toLogin(model);
	}
}
