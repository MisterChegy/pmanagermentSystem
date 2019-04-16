package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Depart;
import com.service.DepartService;

@Controller
@RequestMapping("/depart")
public class DepartController extends BaseController{
	@Autowired
	private DepartService departService;
	@RequestMapping("/toAdd")
	public String toAdd(Model model) {
		return departService.toAdd(model);
	}
	@RequestMapping("/addDepart")
	@ResponseBody
	/**
	 * @ResponseBody返回JSON
	 */
	public String addDepart(@ModelAttribute Depart depart) {
		return departService.addDepart(depart);
	}
	@RequestMapping("/selectDepart")
	public String selectDepart(Model model,String act) {
		return departService.selectDepart(model,act);
	}
	@RequestMapping("/selectADepart")
	public String selectADepart(Model model, Integer id, Integer sid, String act) {
		return departService.selectADepart(model,id, sid, act);
	}
	@RequestMapping("/deleteDepart")
	@ResponseBody
	public String deleteDepart(Model model, @RequestBody Depart depart) {// @RequestBody接收前台JSON数据
		return departService.deleteDepart(model,depart.getId());
	}
	@RequestMapping("/updateDepart")
	@ResponseBody
	public String updateDepart(@ModelAttribute Depart depart) {
		return departService.updateDepart(depart);
	}
	@RequestMapping("/selectDepartCon")
	public String selectDepartCon(@ModelAttribute Depart depart,Model model,String act) {
		return departService.selectDepartCon(depart,model,act);
	}
}
