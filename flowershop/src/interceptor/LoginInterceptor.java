package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		//if(没登录且不是登录页的请求转发到登录页) {//因为管理员的权限控制在数据库设计没设计字段用于区分，再次不便用拦截器进行管理员登录拦截
		//String url=request.getRequestURI();
		//在url中存在该字符串即大于等于0.
//		if(url.indexOf("/login")>=0||url.indexOf("/toLogin")>=0||url.indexOf("/toRegister")>=0||url.indexOf("/regiister")>=0) {
//			return true;
//		}
//		HttpSession session=request.getSession();
//		Object obj=session.getAttribute("loginUser");
//		Object oobj=session.getAttribute("loginAdmin");
//		if(obj!=null||oobj!=null) {
//			return true;
//		}
//		else{
//			request.setAttribute("msg", "用户未登录");
//			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//			return false;
//		}
		return true;
	}
}

