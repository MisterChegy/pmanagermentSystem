package com.service;

import org.springframework.ui.Model;

import com.po.Transfer;

public interface TransferService {
	public String toTransferStaff(Model model);
	public String addTransferStaff(Model model,Transfer transfer);
	public String selectTransferStaff(Model model);
	public String selectTransferCon(Model model,Transfer transfer);
}
