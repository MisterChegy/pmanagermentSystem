package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Staff;
@Repository("staffDao")
@Mapper
public interface StaffDao {
	public int addStaff(Staff staff);
	public int updateStaff(Staff staff);
	public List<Staff> selectAllStaff();
	public List<Staff> selectOkStaff();
	public List<Staff> selectPeriodStaff();
	public Staff selectAStaff(Integer id);
	public List<Staff> selectStaffCon(Staff staff);
	public List<Staff> staffOkSelectCon(Staff staff);
	public List<Staff> selectPeriodStaffCon(Staff staff);
	public int peroidOp(HashMap<String, Object> map);
}
