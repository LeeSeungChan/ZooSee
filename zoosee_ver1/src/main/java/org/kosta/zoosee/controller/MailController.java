package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.mail.MailSenderService;
import org.kosta.zoosee.model.member.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController 
{
	@Resource
	MailSenderService mailservice;
	
	// 아이디 찾기 팝업창
	@RequestMapping("popup_findId.do")
	public String popup_findId()
	{
		return "mail/findIdByMail";
	}
	
	// 비밀번호 찾기 팝업창
	@RequestMapping("popup_findPassword.do")
	public String popup_findPassword()
	{
		return "mail/findPasswordMail";
	}
	
	// 메일로 아이디 찾기
	@RequestMapping("findidMail.do")
	public ModelAndView findIdMail(HttpServletRequest request)
	{
		String email = request.getParameter("email");
		if(email.equals("") || !email.contains("@"))
		{
			return new ModelAndView("mail/findIdByMail_fail");
		}
		else
		{
			mailservice.send(email);
			return new ModelAndView("mail/findIdByMail_result");
		}
	}
	// 패스워드 찾기. ( 이메일과 아이디로 찾음.)
	@RequestMapping("findPasswordMail.do")
	public ModelAndView findPasswordMail(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String check = mailservice.send(id,email);
		if(check.equals("fail"))
		{
			return new ModelAndView("mail/findPasswordMail_fail");
		}
		else
		{
			return new ModelAndView("mail/findPasswordMail_result");
		}
	}
	
}
