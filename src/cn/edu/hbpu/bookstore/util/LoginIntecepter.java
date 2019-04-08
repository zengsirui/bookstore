package cn.edu.hbpu.bookstore.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
//登录拦截器
public class LoginIntecepter implements HandlerInterceptor {
     

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// 完成之后执行
		System.out.println("afterCompletion");
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// 处理完毕之后执行
		System.out.println("postHandle");
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		// 处理之前执行
		//判断Session里有没有用户登录的信息，判断访问的URI
		HttpSession session=request.getSession();
		Integer uid=(Integer) session.getAttribute("adminuser");
		String uri=request.getRequestURI();
		
		if (uri.endsWith("login.jsp")||uri.endsWith("login")
				||uri.endsWith("Login.htm")||uri.endsWith(".css")||uri.endsWith(".js")) {
			
			return true;//访问登录，直接访问
		} else if(uid!=null) {
			//已经登录
                return true;
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
		}
		return false;
	}
}

