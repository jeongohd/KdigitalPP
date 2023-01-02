package Interceptor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class MemberLoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {
		HttpSession sess = req.getSession();
		if (sess.getAttribute("loginInfo") == null) {
			res.setContentType("text/html;charset=utf-8"); //한글 깨짐 방지. 
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용가능합니다 : )');");
			out.println("location.href='/pp/member/login';");
			out.println("</script>");
			out.flush();
			return false;
		}
		return true;
	}

}
