package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Transfer;
import com.service.TransferService;

@Controller
@RequestMapping("/transfer")
public class TransferController extends BaseController{
	@Autowired
	private TransferService transferService;
	@RequestMapping("/toTransferStaff")
	public String toTransferStaff(Model model) {
		return transferService.toTransferStaff(model);
	}
	@RequestMapping(value="/addTransferStaff",produces="text/html;charset=UTF-8;")//produces="text/html;charset=UTF-8;"∑¿÷π÷–Œƒ¬“¬Î
	@ResponseBody
	public String addTransferStaff(Model model, Transfer transfer) {
		return transferService.addTransferStaff(model,transfer);
	}
	@RequestMapping("/selectTransferStaff")
	public String selectTransferStaff(Model model) {
		return transferService.selectTransferStaff(model);
	}
	@RequestMapping("/selectTransferCon")
	public String selectTransferCon(Model model, Transfer transfer) {
		return transferService.selectTransferCon(model,transfer);
	}
}
