package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		//if(û��¼�Ҳ��ǵ�¼ҳ������ת������¼ҳ) {//��Ϊ����Ա��Ȩ�޿��������ݿ����û����ֶ��������֣��ٴβ��������������й���Ա��¼����
		//String url=request.getRequestURI();
		//��url�д��ڸ��ַ��������ڵ���0.
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
//			request.setAttribute("msg", "�û�δ��¼");
//			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
//			return false;
//		}
		return true;
	}
}

