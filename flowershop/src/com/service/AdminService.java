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
	 GoodsValidator validator=new GoodsValidator();//��֤��
	 
	 //��λ����Ʒ����ҳ��
	 public String goodsManage(Model model,HttpSession session) {
		// List<Goods> list=goodsDao.selectAllGoods();
		// model.addAttribute("list",list);
		 return "goodsmanage";
	 }
	 
	 public List<User> getUserList(){
		 List<User> list=userDao.selectAllUser();
		 System.out.println("ִ���˷��ش����û�");
		 return list;
	 }
	 //bootstrapǰ�˷�ҳ�ش��������ݣ��ѳɹ���
	 //ǰ�˷�ҳֻ�贫����Ӧ���ݣ����ú�ǰ��ҳ��ķ�ҳ��Ϣ����
	 public List<Goods> getGoodsList(){
		 List<Goods> list=goodsDao.selectAllGoods();
		 System.out.println("ִ���˷��ش���");
		 return list;
	 }
	 
	 
//	 public PageHelper<Goods> getGoodsList(HttpServletRequest request){
//		 //��ȡǰ̨����ķ�ҳ������	
//		 int pageSize=Integer.parseInt(request.getParameter("pageSize"));
//		 int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
//		 System.out.println(pageSize+pageIndex);
//		 PageHelper<Goods> ph=new PageHelper<Goods>();
//		 //���ݷ�ҳ������ѯ���ݿ⣨���ݿ��ѯ����д������
//		 List<Goods> list=goodsDao.selectGoodsServer(pageSize,pageIndex);
//		 //��Ҫ��ʾ�����ݺ������������ص�ǰ̨
//		 int total=list.size();
//		 System.out.println(total);
//		 for(Goods g:list) {
//			 System.out.println(g);
//		 }
//		 ph.setTotal(total);
//		 ph.setRows(list);
//		 System.out.println("ִ���˷��ش���");
//		 return ph;
//	 }
	 
	 //��λ�����͹���ҳ��
	 public String typeManage(Model model,HttpSession session) {
		 List<GoodsType> list=typeDao.selectAllType();
		 model.addAttribute("list",list);
		 return "typemanage";
	 }
	 
	 //��λ����������ҳ��
	 public String orderManage(Model model,HttpSession session) {
		 List<Order> list=orderDao.selectAllOrder();
		 model.addAttribute("list",list);
		 return "ordermanage";
	 }
	 
	 //��λ���û�����ҳ��
	 public String userManage(Model model,HttpSession session) {
		 List<User> list=userDao.selectAllUser();
		 model.addAttribute("list",list);
		 return "usermanage";
	 }
	 //����Ա�˳���¼
	 public String loginOut(HttpSession session) {	
		session.removeAttribute("loginAdmin");
		return "redirect:/admin/toAdminLogin";
	 }
	 //����Ա��¼
	 public String adminLogin(Admin admin,Model model,HttpSession session){
		 Admin a=new Admin();
		 a=adminDao.selectAdminById(admin.getAdminId());
		 if(a!=null) {
			 if(a.getAdminPassword().equals(admin.getAdminPassword())) {
		           session.setAttribute("loginAdmin", a);
		           model.addAttribute("admin", a);
		           return "forward:/WEB-INF/jsp/admin.jsp";
			 }else {
				 model.addAttribute("msg", "�û������������");
				 return "adminLogin";
			 }
		 }else {
			 model.addAttribute("msg", "�˺Ų�����");
			 return "adminLogin";
		 }
	 }
 
	 //�����Ʒ��ҵ���߼�
	 public String addGoods(Goods goods,BindingResult result,Model model,HttpServletRequest request) {
		 this.validator.validate(goods, result);//�����֤����������֤��ӵ������Ƿ�Ϸ�
		 if(result.hasErrors()) {
			 return "addGoods";//���Ϸ����������ҳ��
		 }
		 
		 /*�ϴ��ļ��ı���λ��"/logos"����λ����ָ
			workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps��
			������ʹ��*/
			//��ֹ�ļ�������
			String newFileName = "";
			String fileName = goods.getLogoImage().getOriginalFilename(); 
			//ѡ�����ļ�
			if(fileName.length() > 0){
				String realpath = request.getServletContext().getRealPath("logos");
				//ʵ���ļ��ϴ�
				String fileType = fileName.substring(fileName.lastIndexOf('.'));
				//���ļ���ǰ����ʱ���ֹ�ļ�������
				newFileName = MyUtil.getStringID() + fileType;
				goods.setGpic(newFileName);
				File targetFile = new File(realpath, newFileName); 
				if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        } 
				//�ϴ� 
		        try {   
		        	goods.getLogoImage().transferTo(targetFile);
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }  
			}
		 //����Ʒ��ӵ����ݿ� 
		 int a=goodsDao.addAGoods(goods);
		 if(a>0) {
			 model.addAttribute("msg", "��ӳɹ�");
		 }else {
			 model.addAttribute("msg", "���ʧ��");
		 }
		 return "forward:/admin/goodsManage";
	 }
	 //��λ�������Ʒҳ��
	 public String toAddGoods(Model model) {
		 model.addAttribute("goods", new Goods());
		// model.addAttribute("gname", gname);
		 return "addGoods";
	 }
	 
	 public String language(Locale locale) {
		 return "forward:/admin/goodsManage";
	 }
	 
	 //ɾ����Ʒ
	 public String deleteAGoods(int id,Model model) {
		 
		 int a=goodsDao.deleteAGoods(id);
		 System.out.println(id);
		 return "forward:/admin/goodsManage";
	 }
	 
	 //��λ���޸���Ʒ��Ϣҳ��
	 public String toUpdateAGoods(int id,Model model) {
		 Goods g=goodsDao.selectGoodsById(id);
		 model.addAttribute("aGoods",g);
		 return "updateGoods";
	 }
	 
	 //�޸���Ʒ
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
	 
	 
	 //���͹����ҵ���߼�
	 //��λ��������͵�����ҳ��
	 public String toAddType(Model model) {
		 return "addType";
	 }
	 
	 //�����Ʒ���͵�ҵ���߼�
	 public String addType(GoodsType goodsType,Model model) {
		 typeDao.addAType(goodsType);
		 return "forward:/admin/typeManage";
	 }
	 
	 //��λ��������Ʒ����ҳ���ҵ���߼�
	 public String toUpdateType( int id,Model model) {
		 GoodsType gt=typeDao.selectTypeById(id);
		 model.addAttribute("aType", gt);
		 return "updateType";
	 }
	 
	 
	 //�������͵�ҵ���߼�	
	 public String updateAType(GoodsType goodsType,Model model) {
		
		 
		 int a=typeDao.updateAType(goodsType);
		 //a��0����ӳɹ�
		if(a>0) {
			 return "forward:/admin/typeManage";
		 }else {
			 return "forward:/admin/toUpdateType";
		 }
	
	 }
	 
	 //ɾ�����͵�ҵ���߼�
	 public String deleteAType(int id,Model model) {
		typeDao.deleteAType(id);
		return "forward:/admin/typeManage";
	 }
	 
	 
	 //�û������ҵ���߼�
	 public String addUser(@ModelAttribute User user,Model model) {
		 userDao.addUser(user);
		 return "forward:/admin/userManage";
	 }
	 
	 //��λ������û�������ҳ��
	 public String toAddUser(Model model) {
		 return "addUser";
	 }
	 
	 
	 //��λ�������û���Ϣҳ��
	 public String toUpdateUser(int id,Model model) {
		User u=userDao.selectUserById(id);
		model.addAttribute("aUser", u);
		return "updateUser";
	 }
	 	 
	 //�����û���Ϣ��ҵ���߼�
	 public String updateAUser(User user,Model model) {
		 System.out.println(user.getId());
		 System.out.println(user.getName());
		 int a=userDao.updateAUser(user);
		 return "forward:/admin/userManage";
	 }
	 
	 //ɾ���û���ҵ���߼�
	 public String deleteAUser(int id,Model model) {
		 userDao.deleteAUser(id);
		 return "forward:/admin/userManage";
	 }
	 
	 
	  //��������
	//��λ����Ӷ���������ҳ��
		 public String toAddOrder(Model model) {
			 return "addOrder";
		 }
	 
	 //��λ�����¶�����Ϣҳ��
	 public String toUpdateOrder(int id,Model model) {
		 Order o=orderDao.selectAOrder(id);
		 model.addAttribute("aOrder", o);
		 return "updateOrder";
	 }
	 
	 
	 //���¶�����Ϣ��ҵ���߼�
	 public String updateAOrder(Order order,Model model) {
		 orderDao.updateAOrder(order);
		 return  "forward:/admin/orderManage";
	 }
	 
	 //ɾ��������ҵ���߼�
	 public String deleteAOrder(int id,Model model) {
		 orderDao.deleteAOrder(id);
		 return  "forward:/admin/orderManage";
	 }
}
