package com.service;

import org.springframework.ui.Model;

import com.po.Report;

public interface ReportService {
	public String reportSelect(Model model,Report report, String act);
}
