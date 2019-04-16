package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.ReportDao;
import com.po.Report;
@Service("reportService")
@Transactional
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao reportDao;
	@Override
	public String reportSelect(Model model, Report report, String act) {
		model.addAttribute("report", report);
		if("new".equals(act)) {
			model.addAttribute("reportNewSatffs", reportDao.reportSelectNew(report));
			return "report/reportSelectNew";
		}else if("quit".equals(act)) {
			model.addAttribute("reportQuitSatffs", reportDao.reportSelectQuit(report));
			return "report/reportSelectQuit";
		}else if("transfer".equals(act)) {
			model.addAttribute("reportTransferSatffs", reportDao.reportSelectTransfer(report));
			return "report/reportSelectTransfer";
		}
		return null;
	}

}
