package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Admin;
import com.po.Goods;

@Repository("adminDao")
@Mapper
public interface AdminDao {

	public List<Goods> selectAllGoods();
	public Admin selectAdminById(Integer adminId);
}
