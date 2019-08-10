package com.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Admin;
import com.po.Goods;
import com.po.GoodsType;
import com.po.Order;

import com.po.User;
import com.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController{

	 @Autowired
	 AdminService adminService;

	 //定位到商品管理页面
	 @RequestMapping("/goodsManage")
	 public String goodsManage(Model model,HttpSession session) {
		 return adminService.goodsManage(model,session);
	 }
	 
	 @RequestMapping("/getGoodsList")
	 @ResponseBody
	 public List<Goods> getGoodsList(){
		 return adminService.getGoodsList();
	 }
	 
	 @RequestMapping("/getUserList")
	 @ResponseBody
	 public List<User> getUserList(){
		 return adminService.getUserList();
	 }
	
	 
	//定位到类型管理页面
	 @RequestMapping("/typeManage")
	 public String typeManage(Model model,HttpSession session) {
		 return adminService.typeManage(model,session);
	 }
	 
	//定位到订单管理页面
	 @RequestMapping("/orderManage")
	 public String orderManage(Model model,HttpSession session) {
		 return adminService.orderManage(model,session);
	 }
	 
	//定位到用户管理页面
	 @RequestMapping("/userManage")
	 public String userManage(Model model,HttpSession session) {
		 return adminService.userManage(model,session);
	 }
	 
	 //定位到管理员登录页面
	 @RequestMapping("/toAdminLogin")
	 public String toAdminLogin() {
		 return "adminLogin";
	 }
	 
	 //管理员登录
	 @RequestMapping("/adminLogin")
	 public String adminLogin(@ModelAttribute Admin admin,Model model,HttpSession session) {
		 return adminService.adminLogin(admin,model,session);
	 }
	 
	 
	 //商品管理
	 //添加商品的业务逻辑
	 @RequestMapping("/addGoods")
	 public String addGoods(@ModelAttribute Goods goods,BindingResult result,Model model,HttpServletRequest request) {
		 return adminService.addGoods(goods,result,model,request);
	 }
	 
	 //添加商品的输入页面
	 @RequestMapping("/input")
	 public String input(Model model) {
		 model.addAttribute("goods", new Goods());
		 return "goodsmanage";
	 }
	 
	 //定位到添加商品页面
	 @RequestMapping("/toAddGoods")
	 public String toAddGoods(Model model) {
		 return adminService.toAddGoods(model);
	 }
	 
	 @RequestMapping("/language")
	 public String language(Locale locale) {
		 return adminService.language(locale);
	 }
	 
	 //更新商品的业务逻辑
	 @RequestMapping("/toUpdateGoods")
	 public String toUpdateGoods() {
		 return "updateGoods ";
	 }
	 
	 //删除商品
	 @RequestMapping("/deleteAGoods")
	 public String deleteAGoods(@RequestParam int id,Model model) {
		 return adminService.deleteAGoods(id,model);
	 }
	 
	 //定位到修改页面
	 @RequestMapping("/toUpdateAGoods")
	 public String toUpdateAGoods(@RequestParam int id,Model model) {
		 return adminService.toUpdateAGoods(id,model);
	 }
	 
	 //修改商品
	 @RequestMapping("/updateAGoods")
	 public String updateAGoods(Goods goods,Model model) {
		 return adminService.updateAGoods(goods,model);
	 }

	 
	 
	 //类型管理
	 
	 //定位到添加类型页面
	 @RequestMapping("/toAddType")
	 public String toAddType(Model model) {
		 return adminService.toAddType(model);
	 }
	 
	 @RequestMapping("/addType")
	 public String addType(@ModelAttribute GoodsType goodsType,Model model) {
		 return adminService.addType(goodsType,model);
	 }
	 
	 //定位到更新商品类型页面
	 @RequestMapping("/toUpdateType")
	 public String toUpdateType(@RequestParam int id,Model model) {
		 return adminService.toUpdateType(id, model);
	 }
	 
	 
	 //更新类型的业务逻辑
	 @RequestMapping("/updateAType")
	 public String updateAType(@ModelAttribute GoodsType goodsType,Model model) {
		 return adminService.updateAType(goodsType, model);
	 }
	 
	 //删除类型的业务逻辑
	 @RequestMapping("/deleteAType")
	 public String deleteAType(@RequestParam int id,Model model) {
		 return adminService.deleteAType(id, model);
	 }
	 
	 
	 //用户管理
	 //添加用户信息的业务逻辑
	 @RequestMapping("/addUser")
	 public String addUser(@ModelAttribute User user,Model model) {
		 return adminService.addUser(user,model);
	 }
	 //定位到添加用户信息的页面
	 @RequestMapping("/toAddUser")
	 public String toAddUser(Model model) {
		 return adminService.toAddUser(model);
	 }
	 //定位到更新用户信息页面
	 @RequestMapping("/toUpdateUser")
	 public String toUpdateUser(@RequestParam int id,Model model) {
		 return adminService.toUpdateUser(id, model);
	 }
	 
	 
	 //更新用户信息的业务逻辑
	 @RequestMapping("/updateAUser")
	 public String updateAUser(@ModelAttribute User user,Model model) {
		 return adminService.updateAUser(user, model);
	 }
	 
	 //删除用户的业务逻辑
	 @RequestMapping("/deleteAUser")
	 public String deleteAUser(@RequestParam int id,Model model) {
		 return adminService.deleteAUser(id, model);
	 }
	 
	 
	     //订单管理
		 //定位到更新订单信息页面
		 @RequestMapping("/toUpdateOrder")
		 public String toUpdateOrder(@RequestParam int id,Model model) {
			 return adminService.toUpdateOrder(id, model);
		 }
		 
		 
		 //更新订单信息的业务逻辑
		 @RequestMapping("/updateAOrder")
		 public String updateAOrder(@ModelAttribute Order order,Model model) {
			 return adminService.updateAOrder(order, model);
		 }
		 
		 //删除订单的业务逻辑
		 @RequestMapping("/deleteAOrder")
		 public String deleteAOrder(@RequestParam int id,Model model) {
			 return adminService.deleteAOrder(id, model);
		 }
		 
		 
		 //管理员退出登录
		 @RequestMapping("/loginOut")
		 public String loginOut(HttpSession session) {	
			 return adminService.loginOut(session);
		 }
		 
	
	 

	 
}
