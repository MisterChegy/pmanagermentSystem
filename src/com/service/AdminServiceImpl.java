package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminDao;
import com.po.Auser;

@Service("userService")
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao userDao;
	@Override
	public String login(Auser buser, Model model, HttpSession session, String code) {
		Auser ruser = null;
		List<Auser> list = userDao.login(buser);
		if(list.size() > 0) {
			ruser = list.get(0);
		}
		if(ruser != null) {
			session.setAttribute("auser", ruser);
			return "main";
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return "login";
		}
	}
	@Override
	public String toLogin(Model model) {
		model.addAttribute("auser", new Auser());
		return "login";
	}
	

}
