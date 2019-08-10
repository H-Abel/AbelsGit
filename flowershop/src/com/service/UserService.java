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
	//登录
	public String login(User user,Model model,HttpSession session){
		User u=new User();
		u=userDao.selectUserByName(user.getName());//通过用户名从数据库中查询数据
		if(u!=null) {//u不为空，用户存在
			if(u.getPassword().equals(user.getPassword())) {//判断用户输入的密码和从数据库中获取的密码是否相同
				session.setAttribute("loginUser", u);
				System.out.println(u.getId());
				//通过类型查找商品，传到已登录商城界面用于商品展示
				List<Goods> list1=goodsDao.selectGoodsByType(1);
				List<Goods> list2=goodsDao.selectGoodsByType(2);
				List<Goods> list3=goodsDao.selectGoodsByType(3);
				model.addAttribute("list1",list1);
				model.addAttribute("list2", list2);
				model.addAttribute("list3", list3);
				return "forward:/WEB-INF/jsp/loginedIndex.jsp";
			}else {//密码错误
				model.addAttribute("msg","用户名或密码错误！");
				return "login";
			}
		}else {//u为空用户不存在
			model.addAttribute("msg","用户不存在！");
			return "login";
		}
	}
	//退出登录
	public String loginOut(HttpSession session) {
		session.removeAttribute("loginUser");
		return "login";
	}
	
	//注册
	public String register(User user,Model model,HttpSession session) {
		int a=userDao.register(user);
		if(a>0) {
			System.out.println();
			return "login";
		}else {
			model.addAttribute("msg","注册失败");
			return "register";
		}
	}
	//进入个人中心
	public String individual(Model model,HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		List<Goods> g=goodsDao.selectAllGoods();
		model.addAttribute("list", g);
		model.addAttribute("user",u);
		return "individual";
	}
	
	//重置密码
	public String resetPassword(Model model,HttpSession session,String newpassword,String oldpassword) {
		User u=(User)session.getAttribute("loginUser");//获取已登录用户
		if(!oldpassword.equals(u.getPassword())) {
			//model.addAttribute("msg", "旧密码错误");
			return "resetPassword";
		}else {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("uid", u.getId());
		map.put("upassword", newpassword);
		int sus=userDao.updatePassword(map);
		return "forward:user/toLogin";
		}
	}
	
	//返回首页
	public String toIndex(HttpSession session) {
		User u=(User)session.getAttribute("loginUser");
		return "forward:/WEB-INF/jsp/loginedIndex.jsp";
	}
}
