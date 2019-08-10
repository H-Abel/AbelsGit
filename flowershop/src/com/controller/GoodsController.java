package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.GoodsDao;
import com.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@RequestMapping("/search")
	public String search(Model model,@RequestParam String key) {
		return goodsService.search(model,key);
	}
	
	@RequestMapping("/toIndex")
	public String toIndex(Model model) {
		return goodsService.toIndex(model);
	}
}
