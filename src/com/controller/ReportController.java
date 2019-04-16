package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Report;
import com.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController{
	@Autowired
	private  ReportService reportService;
	@RequestMapping("/reportSelect")
	public String reportSelect(Model model, Report report,String act) {
		return reportService.reportSelect(model,report, act);
	}
}
