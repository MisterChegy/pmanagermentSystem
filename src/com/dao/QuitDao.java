package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Quit;

@Repository("quitDao")
@Mapper
public interface QuitDao {
	public int addQuitStaff(Quit quit);
	public List<Quit> selectQuitStaff();
	public List<Quit> selectQuitCon(Quit quit);
	public String selectAQuitName(Quit quit);
	public List<Quit> selectIsQuit(Quit quit);
}
