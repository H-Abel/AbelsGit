package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.CartDao;
import com.po.User;

@Service
public class CartService {

	@Autowired
	private CartDao cartDao;
//	public String toCart(Model model,HttpSession session) {
//		if(session.getAttribute("loginUser")!=null) {
//			return "forword:/WEB-INF/jsp/cartIndex.jsp";
//		}else {
//		return "login";
//		}
//	}
	
	public String addCart(Model model,Integer id,Integer shoppingnum,HttpSession session) {
		//查看购物车是否存在，若在，则数量加1，不在便添加
		 Map<String,Object> map=new HashMap<String, Object>();
		 User u=(User)session.getAttribute("loginUser");
		 if(u==null) {
			 return "login";
		 }else {
		 map.put("uid", u.getId());
		 map.put("gid", id);
		 map.put("shoppingnum", shoppingnum);
		 List<Map<String,Object>> list=cartDao.isAddCart(map);
		 if(list.size()>0) {
			 cartDao.updateCart(map);
		 }else {
			 cartDao.addCart(map);
		 }
		 return "forward:/cart/selectCart";
	}
	}
	
	public String selectCart(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		if(u==null) {
			return "login";
		}else {
		List<Map<String,Object>> list=cartDao.selectCart(u.getId()); 
		double sum=0;//购物车内所有商品总价
		int num=0;//购物车内所有商品数量
		for(Map<String ,Object> map:list) {
			  sum=sum+(double)map.get("smallsum");
			  num=num+(int)map.get("shoppingnum");
		}
		model.addAttribute("goodsnum",num);
		model.addAttribute("total", sum);
		model.addAttribute("cartList", list);
		return "shoppingCart";
		}
	}
	
	public String clearCart(HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		cartDao.clearCart(u.getId());
		return "forward:/cart/selectCart";
	}
	
	public String deleteAGoods(Integer id,HttpSession session) {
		Map<String,Object>map=new HashMap<String, Object>();
		User u=(User)session.getAttribute("loginUser");
		map.put("uid", u.getId());
		map.put("gid", id);
		cartDao.deleteAGoods(map);
		return "forward:/cart/selectCart ";
	}
	
	
}
