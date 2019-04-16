package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Report;

@Repository("reportDao")
@Mapper
public interface ReportDao {
	public List<Map<String, Object>> reportSelectNew(Report report);
	public List<Map<String, Object>> reportSelectQuit(Report report);
	public List<Map<String, Object>> reportSelectTransfer(Report report);
}
