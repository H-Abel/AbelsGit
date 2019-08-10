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
	
	//ȷ�϶���
	public String orderConfirm(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");//��ȡ��¼�û���id�������ط�Ҳ�����
		List<Map<String,Object>> list=cartDao.selectCart(u.getId());//��ѯ���ҵĹ��ﳵ
		double sum=0;
		for(Map<String,Object> map:list) {//���㹺�ﳵ�е��ܼ�
			sum=sum+(double)map.get("smallsum");
		}
		model.addAttribute("total", sum);
		model.addAttribute("cartList", list);
		return "orderConfirm";
	}
	
	//�ύ����
	public String orderSubmit(Model model,HttpSession session,double amount) {
		User u=(User)session.getAttribute("loginUser");
		Order order=new Order();
		order.setAmount(amount);
		order.setUsertable_id(u.getId());
		//���ɶ���
		orderDao.addOrder(order);
		//���ɶ�������
		System.out.println(order.getId());
		System.out.println(order.getOrderdate());
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("ordersn",order.getId());//��Ϊ��ȡ��orderΪ 0.ǰ��û������id�����ﻹҪ����һ�����ݿ��ȡ�����ݿ��������order��id
		map.put("uid", u.getId()); 
		orderDao.addOrderDetail(map);
		//����ȡ�����������Ա��ڸ��¿�棬����ÿ��ֻ�ܼ�һ����Ʒ�����ﳵ���ڼ��빺�ﳵ�Ĳ������Ѿ�д����
		List<Map<String,Object>> list=orderDao.selectGoodsShop(u.getId());
		//���¿��
		for(Map<String,Object> map2:list) {
			orderDao.updateStore(map2);
		}
		//��չ��ﳵ
		orderDao.clearCart(u.getId());
		model.addAttribute("ordersn", order.getId());
		return "orderDone";

	}
	
	//֧��
	public String pay(int ordersn) {
		orderDao.updateStatus(ordersn);
		return "payDone";
	}
	
	//�鿴�ҵĶ���
	public String myOrders(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		List<Order> list=orderDao.myOrders(u.getId());
		model.addAttribute("myOrderList", list);
		return "myOrders";
	}
}
