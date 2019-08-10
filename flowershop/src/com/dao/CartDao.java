package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository("cartDao")
@Mapper
public interface CartDao {

	public List<Map<String,Object>> isAddCart(Map<String ,Object> map);
	public int addCart(Map<String ,Object>map);
	public int updateCart(Map<String,Object>map);
	public List<Map<String,Object>> selectCart(Integer id);
	public int deleteAGoods(Map<String ,Object>map);
	public int clearCart(Integer id);
}
