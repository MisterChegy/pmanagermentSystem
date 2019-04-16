package com.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Auser;

public interface AdminService {
	public String login(Auser buser,Model model, HttpSession session, String code);
	public String toLogin(Model model);
	
}
    