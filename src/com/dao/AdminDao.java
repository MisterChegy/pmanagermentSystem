package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Auser;

@Repository("userDao")
@Mapper
public interface AdminDao {
	public int register(Auser buser);
	public List<Auser> login(Auser buser);
	public int update(Auser buser);
}
