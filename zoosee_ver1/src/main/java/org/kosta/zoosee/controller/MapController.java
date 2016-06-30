package org.kosta.zoosee.controller;

import javax.annotation.Resource;

import org.kosta.zoosee.model.map.MapService;
import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	@Resource
	private MapService mapService;
	@Resource
	private MemberService memberService;
	
	@RequestMapping("mapDetail.do")
	public ModelAndView mapDetail(String address, String id){
		//System.out.println(address + id);
		MemberVO memberVO = memberService.getMemberVO(id);
		
		return new ModelAndView("map/mapDetail", "memberVO", memberVO);
	}
}
