package com.service;

import org.springframework.ui.Model;

import com.po.Staff;

public interface StaffService {
	public String toAdd(Model model);
	public String addStaff(Staff staff);
	public String updateStaff(Staff staff);
	public String selectStaff(Model model,String act);
	public String selectAStaff(Model model, Integer id, String act);
	public String selectStaffCon(Staff staff, Model model, String act);
	public String peroidOp(Integer id, String act);
}
