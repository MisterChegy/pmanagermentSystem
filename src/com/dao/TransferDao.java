package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Transfer;
@Repository("transferDao")
@Mapper
public interface TransferDao {
	public Transfer  selectATransfer(Transfer transfer);
	public int addTransferStaff(Transfer transfer);
	public int updateStaff(Transfer transfer);
	public List<Transfer> selectTransferStaff();
	public List<Transfer> selectTransferCon(Transfer transfer);
}
