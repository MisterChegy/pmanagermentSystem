package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Depart;
@Repository("departDao")
@Mapper
public interface DepartDao {
	public int addDepart(Depart depart);
	public List<Depart> selectAllDepart();
	public Depart selectADepart(Map<String, Integer> map);
	public List<Depart> selectSubDepart(Integer id);
	public int deleteDepart(Integer id);
	public int updateDepart(Depart depart);
	public List<Depart> selectDepartCon(Depart depart);
}
