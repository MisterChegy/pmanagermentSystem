package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Staff;
import com.service.StaffService;

@Controller
@RequestMapping("/staff")
public class StaffController extends BaseController{
	@Autowired
	private StaffService staffService;
	@RequestMapping("/toAdd")
	public String toAdd(Model model) {
		return staffService.toAdd(model);
	}
	@RequestMapping("/addStaff")
	@ResponseBody
	public String addStaff(@ModelAttribute Staff staff) {
		return staffService.addStaff(staff);
	}
	@RequestMapping("/selectStaff")
	public String selectStaff(Model model,String act) {
		return staffService.selectStaff(model,act);
	}
	@RequestMapping("/selectAStaff")
	public String selectAStaff(Model model, Integer id, String act) {
		return staffService.selectAStaff(model,id, act);
	}
	@RequestMapping("/updateStaff")
	@ResponseBody
	public String updateStaff(@ModelAttribute Staff staff) {
		return staffService.updateStaff(staff);
	}
	@RequestMapping("/selectStaffCon")
	public String selectStaffCon(@ModelAttribute Staff staff,Model model,String act) {
		return staffService.selectStaffCon(staff,model,act);
	}
	@RequestMapping("/peroidOp")
	@ResponseBody
	public String peroidOp(Model model, Integer id, String act) {
		return staffService.peroidOp(id, act);
	}
}
