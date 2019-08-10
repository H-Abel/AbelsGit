package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Order;

@Repository("orderDao")
@Mapper
public interface OrderDao {

	public List<Order> myOrders(int id);
	public int addOrder(Order order);
	public int addOrderDetail(Map<String ,Object> map);
	public List<Map<String,Object>> selectGoodsShop(int id);
	public int updateStore(Map<String,Object> map);
	public int clearCart(int id);
	public int updateStatus(int id);
	public List<Order> selectAllOrder();
	public Order selectAOrder(int id);
	public int deleteAOrder(int id);
	public int updateAOrder(Order order);
}
