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
	//��¼
	@RequestMapping("/login")
	public String login(@ModelAttribute User user,HttpSession session,Model model) {
		logger.info("lala");
		System.out.println("hah");
		return userService.login(user, model, session);
		
	}
	//�˳���¼
	@RequestMapping("loginOut")
	public String loginOut(HttpSession session) {
		return userService.loginOut(session);
	}
	//ע��
	@RequestMapping("/register")
	public String register(@ModelAttribute User user,HttpSession session,Model model) {
		return userService.register(user,model,session);
	}
	
	//�����������
	@RequestMapping("/individual")
	public String individual(Model model,HttpSession session) {
		return userService.individual(model,session);
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(@RequestParam String newpassword,@RequestParam String oldpassword,Model model,HttpSession session) {
		return userService.resetPassword(model,session ,newpassword,oldpassword);
	}
	
	//�����޸�������� 
	@RequestMapping("toResetPassword")
	public String toResetPassword(HttpSession session) {
		return "resetPassword";
	}
	
	//������ҳ
	@RequestMapping("/toIndex")
	public String toIndex(HttpSession session) {
		return userService.toIndex(session);
	}
	//index.jsp�е�¼���ӵĴ���ӳ�䷽��
	@RequestMapping("toLogin")
	public String indexLogin() {
		return "login";
	}
	//index.jsp��ע�����ӵĴ���ӳ�䷽��
	@RequestMapping("toRegister")
	public String indexRegister() {
		return "register";
	}
}
