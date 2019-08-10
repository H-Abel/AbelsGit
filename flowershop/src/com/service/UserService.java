package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.GoodsDao;
import com.dao.UserDao;
import com.po.Goods;
import com.po.User;

@Service
public class UserService {

	
	@Autowired
	private UserDao userDao;
	@Autowired
	private GoodsDao goodsDao;
	//��¼
	public String login(User user,Model model,HttpSession session){
		User u=new User();
		u=userDao.selectUserByName(user.getName());//ͨ���û��������ݿ��в�ѯ����
		if(u!=null) {//u��Ϊ�գ��û�����
			if(u.getPassword().equals(user.getPassword())) {//�ж��û����������ʹ����ݿ��л�ȡ�������Ƿ���ͬ
				session.setAttribute("loginUser", u);
				System.out.println(u.getId());
				//ͨ�����Ͳ�����Ʒ�������ѵ�¼�̳ǽ���������Ʒչʾ
				List<Goods> list1=goodsDao.selectGoodsByType(1);
				List<Goods> list2=goodsDao.selectGoodsByType(2);
				List<Goods> list3=goodsDao.selectGoodsByType(3);
				model.addAttribute("list1",list1);
				model.addAttribute("list2", list2);
				model.addAttribute("list3", list3);
				return "forward:/WEB-INF/jsp/loginedIndex.jsp";
			}else {//�������
				model.addAttribute("msg","�û������������");
				return "login";
			}
		}else {//uΪ���û�������
			model.addAttribute("msg","�û������ڣ�");
			return "login";
		}
	}
	//�˳���¼
	public String loginOut(HttpSession session) {
		session.removeAttribute("loginUser");
		return "login";
	}
	
	//ע��
	public String register(User user,Model model,HttpSession session) {
		int a=userDao.register(user);
		if(a>0) {
			System.out.println();
			return "login";
		}else {
			model.addAttribute("msg","ע��ʧ��");
			return "register";
		}
	}
	//�����������
	public String individual(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		List<Goods> g=goodsDao.selectAllGoods();
		model.addAttribute("list", g);
		model.addAttribute("user",u);
		return "individual";
	}
	
	//��������
	public String resetPassword(Model model,HttpSession session,String newpassword,String oldpassword) {
		User u=(User)session.getAttribute("loginUser");//��ȡ�ѵ�¼�û�
		if(!oldpassword.equals(u.getPassword())) {
			//model.addAttribute("msg", "���������");
			return "resetPassword";
		}else {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("uid", u.getId());
		map.put("upassword", newpassword);
		int sus=userDao.updatePassword(map);
		return "forward:user/toLogin";
		}
	}
	
	//������ҳ
	public String toIndex(HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		return "forward:/WEB-INF/jsp/loginedIndex.jsp";
	}
}
