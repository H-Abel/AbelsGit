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

	 //��λ����Ʒ����ҳ��
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
	
	 
	//��λ�����͹���ҳ��
	 @RequestMapping("/typeManage")
	 public String typeManage(Model model,HttpSession session) {
		 return adminService.typeManage(model,session);
	 }
	 
	//��λ����������ҳ��
	 @RequestMapping("/orderManage")
	 public String orderManage(Model model,HttpSession session) {
		 return adminService.orderManage(model,session);
	 }
	 
	//��λ���û�����ҳ��
	 @RequestMapping("/userManage")
	 public String userManage(Model model,HttpSession session) {
		 return adminService.userManage(model,session);
	 }
	 
	 //��λ������Ա��¼ҳ��
	 @RequestMapping("/toAdminLogin")
	 public String toAdminLogin() {
		 return "adminLogin";
	 }
	 
	 //����Ա��¼
	 @RequestMapping("/adminLogin")
	 public String adminLogin(@ModelAttribute Admin admin,Model model,HttpSession session) {
		 return adminService.adminLogin(admin,model,session);
	 }
	 
	 
	 //��Ʒ����
	 //�����Ʒ��ҵ���߼�
	 @RequestMapping("/addGoods")
	 public String addGoods(@ModelAttribute Goods goods,BindingResult result,Model model,HttpServletRequest request) {
		 return adminService.addGoods(goods,result,model,request);
	 }
	 
	 //�����Ʒ������ҳ��
	 @RequestMapping("/input")
	 public String input(Model model) {
		 model.addAttribute("goods", new Goods());
		 return "goodsmanage";
	 }
	 
	 //��λ�������Ʒҳ��
	 @RequestMapping("/toAddGoods")
	 public String toAddGoods(Model model) {
		 return adminService.toAddGoods(model);
	 }
	 
	 @RequestMapping("/language")
	 public String language(Locale locale) {
		 return adminService.language(locale);
	 }
	 
	 //������Ʒ��ҵ���߼�
	 @RequestMapping("/toUpdateGoods")
	 public String toUpdateGoods() {
		 return "updateGoods ";
	 }
	 
	 //ɾ����Ʒ
	 @RequestMapping("/deleteAGoods")
	 public String deleteAGoods(@RequestParam int id,Model model) {
		 return adminService.deleteAGoods(id,model);
	 }
	 
	 //��λ���޸�ҳ��
	 @RequestMapping("/toUpdateAGoods")
	 public String toUpdateAGoods(@RequestParam int id,Model model) {
		 return adminService.toUpdateAGoods(id,model);
	 }
	 
	 //�޸���Ʒ
	 @RequestMapping("/updateAGoods")
	 public String updateAGoods(Goods goods,Model model) {
		 return adminService.updateAGoods(goods,model);
	 }

	 
	 
	 //���͹���
	 
	 //��λ���������ҳ��
	 @RequestMapping("/toAddType")
	 public String toAddType(Model model) {
		 return adminService.toAddType(model);
	 }
	 
	 @RequestMapping("/addType")
	 public String addType(@ModelAttribute GoodsType goodsType,Model model) {
		 return adminService.addType(goodsType,model);
	 }
	 
	 //��λ��������Ʒ����ҳ��
	 @RequestMapping("/toUpdateType")
	 public String toUpdateType(@RequestParam int id,Model model) {
		 return adminService.toUpdateType(id, model);
	 }
	 
	 
	 //�������͵�ҵ���߼�
	 @RequestMapping("/updateAType")
	 public String updateAType(@ModelAttribute GoodsType goodsType,Model model) {
		 return adminService.updateAType(goodsType, model);
	 }
	 
	 //ɾ�����͵�ҵ���߼�
	 @RequestMapping("/deleteAType")
	 public String deleteAType(@RequestParam int id,Model model) {
		 return adminService.deleteAType(id, model);
	 }
	 
	 
	 //�û�����
	 //����û���Ϣ��ҵ���߼�
	 @RequestMapping("/addUser")
	 public String addUser(@ModelAttribute User user,Model model) {
		 return adminService.addUser(user,model);
	 }
	 //��λ������û���Ϣ��ҳ��
	 @RequestMapping("/toAddUser")
	 public String toAddUser(Model model) {
		 return adminService.toAddUser(model);
	 }
	 //��λ�������û���Ϣҳ��
	 @RequestMapping("/toUpdateUser")
	 public String toUpdateUser(@RequestParam int id,Model model) {
		 return adminService.toUpdateUser(id, model);
	 }
	 
	 
	 //�����û���Ϣ��ҵ���߼�
	 @RequestMapping("/updateAUser")
	 public String updateAUser(@ModelAttribute User user,Model model) {
		 return adminService.updateAUser(user, model);
	 }
	 
	 //ɾ���û���ҵ���߼�
	 @RequestMapping("/deleteAUser")
	 public String deleteAUser(@RequestParam int id,Model model) {
		 return adminService.deleteAUser(id, model);
	 }
	 
	 
	     //��������
		 //��λ�����¶�����Ϣҳ��
		 @RequestMapping("/toUpdateOrder")
		 public String toUpdateOrder(@RequestParam int id,Model model) {
			 return adminService.toUpdateOrder(id, model);
		 }
		 
		 
		 //���¶�����Ϣ��ҵ���߼�
		 @RequestMapping("/updateAOrder")
		 public String updateAOrder(@ModelAttribute Order order,Model model) {
			 return adminService.updateAOrder(order, model);
		 }
		 
		 //ɾ��������ҵ���߼�
		 @RequestMapping("/deleteAOrder")
		 public String deleteAOrder(@RequestParam int id,Model model) {
			 return adminService.deleteAOrder(id, model);
		 }
		 
		 
		 //����Ա�˳���¼
		 @RequestMapping("/loginOut")
		 public String loginOut(HttpSession session) {	
			 return adminService.loginOut(session);
		 }
		 
	
	 

	 
}
