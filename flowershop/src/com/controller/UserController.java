package com.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import com.po.User;
import com.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	private static final Log logger=LogFactory.getLog(UserController.class);
	
	@Autowired
	private UserService userService;
	//登录
	@RequestMapping("/login")
	public String login(@ModelAttribute User user,HttpSession session,Model model) {
		logger.info("lala");
		System.out.println("hah");
		return userService.login(user, model, session);
		
	}
	//退出登录
	@RequestMapping("loginOut")
	public String loginOut(HttpSession session) {
		return userService.loginOut(session);
	}
	//注册
	@RequestMapping("/register")
	public String register(@ModelAttribute User user,HttpSession session,Model model) {
		return userService.register(user,model,session);
	}
	
	//进入个人中心
	@RequestMapping("/individual")
	public String individual(Model model,HttpSession session) {
		return userService.individual(model,session);
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(@RequestParam String newpassword,@RequestParam String oldpassword,Model model,HttpSession session) {
		return userService.resetPassword(model,session ,newpassword,oldpassword);
	}
	
	//进入修改密码界面 
	@RequestMapping("toResetPassword")
	public String toResetPassword(HttpSession session) {
		return "resetPassword";
	}
	
	//返回首页
	@RequestMapping("/toIndex")
	public String toIndex(HttpSession session) {
		return userService.toIndex(session);
	}
	//index.jsp中登录链接的处理映射方法
	@RequestMapping("toLogin")
	public String indexLogin() {
		return "login";
	}
	//index.jsp中注册链接的处理映射方法
	@RequestMapping("toRegister")
	public String indexRegister() {
		return "register";
	}
}
