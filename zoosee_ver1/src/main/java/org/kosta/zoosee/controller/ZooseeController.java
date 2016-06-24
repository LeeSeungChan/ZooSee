package org.kosta.zoosee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZooseeController {
	
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		System.out.println("@PathVariable : "+viewId);
		if(viewId.contains("interceptor_")){
			viewId=viewId.substring(12);
		}
		return viewId;
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		
		if(session != null){
			session.invalidate();
		}
		
		return "home";
	}
	
	@RequestMapping("interceptSession.do")
	public String interceptorSession()
	{
		return "interceptor/interceptSession";
	}
}
