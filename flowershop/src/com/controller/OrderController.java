package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	//ȷ�϶���
	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model,HttpSession session) {
		return orderService.orderConfirm(model,session);
	}
	
	//�ύ����
	@RequestMapping("/orderSubmit")
	public String orderSubmit(Model model,HttpSession session,double amount) {
		return orderService.orderSubmit(model,session,amount);
	}
	
	//֧��
	@RequestMapping("/pay")
	public String pay(@RequestParam int ordersn) {
		return orderService.pay(ordersn);
	}
	
	//����������Ĳ鿴�ҵĶ���
	@RequestMapping("/myOrders")
	public String myOrders(Model model,HttpSession session) {
		return orderService.myOrders(model,session);
	}
}
