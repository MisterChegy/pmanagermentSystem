package com.service;

import org.springframework.ui.Model;

import com.po.Depart;

public interface DepartService {
	public String toAdd(Model model);
	public String addDepart(Depart depart);
	public String selectDepart(Model model,String act);
	public String selectADepart(Model model, Integer id, Integer sid,String act);
	public String deleteDepart(Model model, Integer id);
	public String updateDepart(Depart depart);
	public String selectDepartCon(Depart depart,Model model, String act);
}
