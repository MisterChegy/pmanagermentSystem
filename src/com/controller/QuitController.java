package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Quit;
import com.service.QuitService;

@Controller
@RequestMapping("/quit")
public class QuitController extends BaseController{
	@Autowired
	private QuitService quitService;
	@RequestMapping("/toQuitStaff")
	public String toQuitStaff(Model model) {
		return quitService.toQuitStaff(model);
	}
	@RequestMapping(value="/addQuitStaff",produces="text/html;charset=UTF-8;")//produces="text/html;charset=UTF-8;"∑¿÷π÷–Œƒ¬“¬Î
	@ResponseBody
	public String addQuitStaff(Model model, Quit quit) {
		return quitService.addQuitStaff(model,quit);
	}
	@RequestMapping("/selectQuitStaff")
	public String selectQuitStaff(Model model){
		return quitService.selectQuitStaff(model);
	}
	@RequestMapping("/selectQuitCon")
	public String selectQuitCon(Model model, Quit quit){
		return quitService.selectQuitCon(model,quit);
	}
	
}
