package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.GoodsDao;
import com.po.Goods;

@Service
public class GoodsService {

	@Autowired
	GoodsDao goodsDao;
	public String search(Model model,String key) {
		List<Goods> list=goodsDao.selectGoodsByKey(key);
		model.addAttribute("searchList",list);
		return "searchResult";
	}
	
	public String toIndex(Model model) {
		List<Goods> list1=goodsDao.selectGoodsByType(1);
		List<Goods> list2=goodsDao.selectGoodsByType(2);
		List<Goods> list3=goodsDao.selectGoodsByType(3);
		model.addAttribute("list1",list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		return "index";
	}
	 
}
