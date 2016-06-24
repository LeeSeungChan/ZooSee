package org.kosta.zoosee.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter
{
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception 
	{
		System.out.println("인터셉터 동작");
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("mvo")==null)
		{
			System.out.println("로그인 문제 발생");
			// 메인으로 감. or alert 띄워주는 창으로 ㄱ
			response.sendRedirect("interceptSession.do");
			return false;
		}
		return true;
	}
	

}
