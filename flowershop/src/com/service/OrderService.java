package com.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.CartDao;
import com.dao.OrderDao;
import com.po.Order;
import com.po.User;
import com.util.MyUtil;
@Service
public class OrderService {

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private CartDao cartDao; 
	
	//确认订单
	public String orderConfirm(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");//获取登录用户的id，其他地方也会出现
		List<Map<String,Object>> list=cartDao.selectCart(u.getId());//查询出我的购物车
		double sum=0;
		for(Map<String,Object> map:list) {//计算购物车中的总价
			sum=sum+(double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartList", list);
		return "orderConfirm";
	}
	
	//提交订单
	public String orderSubmit(Model model,HttpSession session,double amount) {
		User u=(User)session.getAttribute("loginUser");
		Order order=new Order();
		order.setAmount(amount);
		order.setUsertable_id(u.getId());
		//生成订单
		orderDao.addOrder(order);
		//生成订单详情
		System.out.println(order.getId());
		System.out.println(order.getOrderdate());
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("ordersn",order.getId());//因为获取的order为 0.前面没有设置id，这里还要访问一次数据库获取到数据库自增后的order的id
		map.put("uid", u.getId()); 
		orderDao.addOrderDetail(map);
		//，获取购买数量，以便于更新库存，这里每次只能加一件商品进购物车，在加入购物车的操作里已经写死了
		List<Map<String,Object>> list=orderDao.selectGoodsShop(u.getId());
		//更新库存
		for(Map<String,Object> map2:list) {
			orderDao.updateStore(map2);
		}
		//清空购物车
		orderDao.clearCart(u.getId());
		model.addAttribute("ordersn", order.getId());
		return "orderDone";

	}
	
	//支付
	public String pay(int ordersn) {
		orderDao.updateStatus(ordersn);
		return "payDone";
	}
	
	//查看我的订单
	public String myOrders(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		List<Order> list=orderDao.myOrders(u.getId());
		model.addAttribute("myOrderList", list);
		return "myOrders";
	}
}
