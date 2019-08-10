package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController  {

	@Autowired
	private CartService cartService;
//	@RequestMapping("/toCart")
//	public String toCart(Model model,HttpSession session) {
//		return cartService.toCart(model,session);
//	}
	
	@RequestMapping(value="/addCart/{id}/{shoppingnum}",method=RequestMethod.GET)
	public String addCart(Model model,@PathVariable Integer id,@PathVariable Integer shoppingnum,HttpSession session) {
		return cartService.addCart(model,id,shoppingnum,session);
	}
	
	@RequestMapping("/selectCart")
	public String selectCart(Model model,HttpSession session) {
		return cartService.selectCart(model, session);
	}
	
	@RequestMapping(value="/deleteAGoods/{id}",method=RequestMethod.GET)
	public String deleteAGoods(Integer id,HttpSession session) {
		return cartService.deleteAGoods(id, session);
		
	}
	
	@RequestMapping("/clearCart")
	public String clearCart(Integer id,HttpSession session) {
		return cartService.clearCart(session);
	}
}

