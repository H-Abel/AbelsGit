package com.service;

import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.AdminDao;
import com.dao.GoodsDao;
import com.dao.OrderDao;
import com.dao.TypeDao;
import com.dao.UserDao;
import com.po.Admin;
import com.po.Goods;
import com.po.GoodsType;
import com.po.Order;
import com.po.User;
import com.util.MyUtil;

import validator.GoodsValidator;

@Service
public class AdminService {

	 @Autowired
	 AdminDao adminDao;
	 @Autowired
	 GoodsDao goodsDao;
	 @Autowired
	 OrderDao orderDao;
	 @Autowired
	 UserDao userDao;
	 @Autowired
	 TypeDao typeDao;
//	 @Resource
//	 private Validator validator;
	 GoodsValidator validator=new GoodsValidator();//验证器
	 
	 //定位到商品管理页面
	 public String goodsManage(Model model,HttpSession session) {
		// List<Goods> list=goodsDao.selectAllGoods();
		// model.addAttribute("list",list);
		 return "goodsmanage";
	 }
	 
	 public List<User> getUserList(){
		 List<User> list=userDao.selectAllUser();
		 System.out.println("执行了返回代码用户");
		 return list;
	 }
	 //bootstrap前端分页回传数据数据，已成功。
	 //前端分页只需传入相应数据，配置好前端页面的分页信息即可
	 public List<Goods> getGoodsList(){
		 List<Goods> list=goodsDao.selectAllGoods();
		 System.out.println("执行了返回代码");
		 return list;
	 }
	 
	 
//	 public PageHelper<Goods> getGoodsList(HttpServletRequest request){
//		 //获取前台传入的分页参数，	
//		 int pageSize=Integer.parseInt(request.getParameter("pageSize"));
//		 int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
//		 System.out.println(pageSize+pageIndex);
//		 PageHelper<Goods> ph=new PageHelper<Goods>();
//		 //根据分页条件查询数据库（数据库查询语句的写法？）
//		 List<Goods> list=goodsDao.selectGoodsServer(pageSize,pageIndex);
//		 //将要显示的数据和数据总数返回到前台
//		 int total=list.size();
//		 System.out.println(total);
//		 for(Goods g:list) {
//			 System.out.println(g);
//		 }
//		 ph.setTotal(total);
//		 ph.setRows(list);
//		 System.out.println("执行了返回代码");
//		 return ph;
//	 }
	 
	 //定位到类型管理页面
	 public String typeManage(Model model,HttpSession session) {
		 List<GoodsType> list=typeDao.selectAllType();
		 model.addAttribute("list",list);
		 return "typemanage";
	 }
	 
	 //定位到订单管理页面
	 public String orderManage(Model model,HttpSession session) {
		 List<Order> list=orderDao.selectAllOrder();
		 model.addAttribute("list",list);
		 return "ordermanage";
	 }
	 
	 //定位到用户管理页面
	 public String userManage(Model model,HttpSession session) {
		 List<User> list=userDao.selectAllUser();
		 model.addAttribute("list",list);
		 return "usermanage";
	 }
	 //管理员退出登录
	 public String loginOut(HttpSession session) {	
		session.removeAttribute("loginAdmin");
		return "redirect:/admin/toAdminLogin";
	 }
	 //管理员登录
	 public String adminLogin(Admin admin,Model model,HttpSession session){
		 Admin a=new Admin();
		 a=adminDao.selectAdminById(admin.getAdminId());
		 if(a!=null) {
			 if(a.getAdminPassword().equals(admin.getAdminPassword())) {
		           session.setAttribute("loginAdmin", a);
		           model.addAttribute("admin", a);
		           return "forward:/WEB-INF/jsp/admin.jsp";
			 }else {
				 model.addAttribute("msg", "用户名或密码错误");
				 return "adminLogin";
			 }
		 }else {
			 model.addAttribute("msg", "账号不存在");
			 return "adminLogin";
		 }
	 }
 
	 //添加商品的业务逻辑
	 public String addGoods(Goods goods,BindingResult result,Model model,HttpServletRequest request) {
		 this.validator.validate(goods, result);//添加验证器，用以验证添加的数据是否合法
		 if(result.hasErrors()) {
			 return "addGoods";//不合法，返回添加页面
		 }
		 
		 /*上传文件的保存位置"/logos"，该位置是指
			workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps，
			发布后使用*/
			//防止文件名重名
			String newFileName = "";
			String fileName = goods.getLogoImage().getOriginalFilename(); 
			//选择了文件
			if(fileName.length() > 0){
				String realpath = request.getServletContext().getRealPath("logos");
				//实现文件上传
				String fileType = fileName.substring(fileName.lastIndexOf('.'));
				//在文件名前加上时间防止文件名重名
				newFileName = MyUtil.getStringID() + fileType;
				goods.setGpic(newFileName);
				File targetFile = new File(realpath, newFileName); 
				if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        } 
				//上传 
		        try {   
		        	goods.getLogoImage().transferTo(targetFile);
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }  
			}
		 //将商品添加到数据库 
		 int a=goodsDao.addAGoods(goods);
		 if(a>0) {
			 model.addAttribute("msg", "添加成功");
		 }else {
			 model.addAttribute("msg", "添加失败");
		 }
		 return "forward:/admin/goodsManage";
	 }
	 //定位到添加商品页面
	 public String toAddGoods(Model model) {
		 model.addAttribute("goods", new Goods());
		// model.addAttribute("gname", gname);
		 return "addGoods";
	 }
	 
	 public String language(Locale locale) {
		 return "forward:/admin/goodsManage";
	 }
	 
	 //删除商品
	 public String deleteAGoods(int id,Model model) {
		 
		 int a=goodsDao.deleteAGoods(id);
		 System.out.println(id);
		 return "forward:/admin/goodsManage";
	 }
	 
	 //定位到修改商品信息页面
	 public String toUpdateAGoods(int id,Model model) {
		 Goods g=goodsDao.selectGoodsById(id);
		 model.addAttribute("aGoods",g);
		 return "updateGoods";
	 }
	 
	 //修改商品
	 public String updateAGoods(Goods goods,Model model) {
		 System.out.println(goods.getId());
		 System.out.println(goods.getGstore());
		
		int a=goodsDao.updateAGoods(goods);
		if(a>0) {
		 return "forward:/admin/goodsManage";
		 }else {
			 return "forward:/admin/toUpdateAGoods";
		 }
	 }
	 
	 
	 //类型管理的业务逻辑
	 //定位到添加类型的输入页面
	 public String toAddType(Model model) {
		 return "addType";
	 }
	 
	 //添加商品类型的业务逻辑
	 public String addType(GoodsType goodsType,Model model) {
		 typeDao.addAType(goodsType);
		 return "forward:/admin/typeManage";
	 }
	 
	 //定位到更新商品类型页面的业务逻辑
	 public String toUpdateType( int id,Model model) {
		 GoodsType gt=typeDao.selectTypeById(id);
		 model.addAttribute("aType", gt);
		 return "updateType";
	 }
	 
	 
	 //更新类型的业务逻辑	
	 public String updateAType(GoodsType goodsType,Model model) {
		
		 
		 int a=typeDao.updateAType(goodsType);
		 //a》0则添加成功
		if(a>0) {
			 return "forward:/admin/typeManage";
		 }else {
			 return "forward:/admin/toUpdateType";
		 }
	
	 }
	 
	 //删除类型的业务逻辑
	 public String deleteAType(int id,Model model) {
		typeDao.deleteAType(id);
		return "forward:/admin/typeManage";
	 }
	 
	 
	 //用户管理的业务逻辑
	 public String addUser(@ModelAttribute User user,Model model) {
		 userDao.addUser(user);
		 return "forward:/admin/userManage";
	 }
	 
	 //定位到添加用户的输入页面
	 public String toAddUser(Model model) {
		 return "addUser";
	 }
	 
	 
	 //定位到更新用户信息页面
	 public String toUpdateUser(int id,Model model) {
		User u=userDao.selectUserById(id);
		model.addAttribute("aUser", u);
		return "updateUser";
	 }
	 	 
	 //更新用户信息的业务逻辑
	 public String updateAUser(User user,Model model) {
		 System.out.println(user.getId());
		 System.out.println(user.getName());
		 int a=userDao.updateAUser(user);
		 return "forward:/admin/userManage";
	 }
	 
	 //删除用户的业务逻辑
	 public String deleteAUser(int id,Model model) {
		 userDao.deleteAUser(id);
		 return "forward:/admin/userManage";
	 }
	 
	 
	  //订单管理
	//定位到添加订单的输入页面
		 public String toAddOrder(Model model) {
			 return "addOrder";
		 }
	 
	 //定位到更新订单信息页面
	 public String toUpdateOrder(int id,Model model) {
		 Order o=orderDao.selectAOrder(id);
		 model.addAttribute("aOrder", o);
		 return "updateOrder";
	 }
	 
	 
	 //更新订单信息的业务逻辑
	 public String updateAOrder(Order order,Model model) {
		 orderDao.updateAOrder(order);
		 return  "forward:/admin/orderManage";
	 }
	 
	 //删除订单的业务逻辑
	 public String deleteAOrder(int id,Model model) {
		 orderDao.deleteAOrder(id);
		 return  "forward:/admin/orderManage";
	 }
}
