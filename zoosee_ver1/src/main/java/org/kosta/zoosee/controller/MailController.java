package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.mail.MailSenderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {
	@Resource
	MailSenderService mailservice;

	// 아이디 찾기 팝업창
	@RequestMapping("popup_findId.do")
	public ModelAndView popup_findId() {
		return new ModelAndView("mail_IdSubmit");
	}

	// 비밀번호 찾기 팝업창
	@RequestMapping("popup_findPassword.do")
	public ModelAndView popup_findPassword() {
		return new ModelAndView("mail_PasswordSubmit");
	}

	// 메일로 아이디 찾기
	@RequestMapping("findidMail.do")
	public ModelAndView findIdMail(HttpServletRequest request) {
		String email = request.getParameter("email");
		if (email.equals("") || !email.contains("@")) {
			return new ModelAndView("mail_IdFail");
		} else {
			mailservice.send(email);
			return new ModelAndView("mail_IdResult");
		}
	}

	// 패스워드 찾기. ( 이메일과 아이디로 찾음.)
	@RequestMapping("findPasswordMail.do")
	public ModelAndView findPasswordMail(HttpServletRequest request) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String check = mailservice.send(id, email);
		if (check.equals("fail")) {
			return new ModelAndView("mail_PasswordFail");
		} else {
			return new ModelAndView("mail_PasswordResult");
		}
	}

}
