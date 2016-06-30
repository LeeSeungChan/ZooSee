package org.kosta.zoosee.controller;

import javax.annotation.Resource;

import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PopupController {
	@Resource
	private ReserveService reserveService;

	@RequestMapping("popup_payment.do")
	public ModelAndView popupPayment(int reserve_no){
		ReserveVO reserveVO=reserveService.popupPayment(reserve_no);
		return new ModelAndView("popup_payment","reserveVO",reserveVO);
	}
}
