package com.service;

import org.springframework.ui.Model;

import com.po.Quit;

public interface QuitService {
	public String toQuitStaff(Model model);
	public String addQuitStaff(Model model,Quit quit);
	public String selectQuitStaff(Model model);
	public String selectQuitCon(Model model,Quit quit);
}
