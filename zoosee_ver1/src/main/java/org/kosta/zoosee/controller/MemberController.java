package org.kosta.zoosee.controller;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@Resource
	private ReserveService reserveService;
	
	/* Member 회원가입하는 메서드 */
	@RequestMapping(value="registerMember.do", method=RequestMethod.POST)
	public String registerMember(MemberVO mvo){
		memberService.registerMember(mvo);
		return "redirect:member_register_result.do";
	}
	/* Member 로그인 메서드 */
	@RequestMapping(value="loginMember.do", method=RequestMethod.POST)
	public ModelAndView loginMember(MemberVO mvo, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("home");
		
		MemberVO vo = memberService.loginMember(mvo);
		HttpSession session = request.getSession();
		if(vo != null){
			session.setAttribute("mvo", vo);
			
			String petMasterSignal = "";
			if(vo.getRank().equals("petmaster")){
				// showMyReserveList에서 petmaster의 전체 예약목록을 뽑아오기 위해 2로 설정
				petMasterSignal = "2";
			}
			List<ReserveVO> reserveList = reserveService.showMyReserveList(vo, petMasterSignal);
			HashMap<String, List<ReserveVO>> map = memberService.showReserveList(reserveList);
			mv.addObject("reserveTotalList", map);
			return mv;
		}else{
			return new ModelAndView("member_loginFail");
		}
	}
	/* Member 회원가입시 아이디 중복확인 메서드 */
	@RequestMapping(value="memberIdCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int memberIdCheck(String id){
		return memberService.memberIdCheck(id);
	}
	/* Member 정보수정 메서드 */
	@RequestMapping(value="interceptor_member_update_result.do",method=RequestMethod.POST)
	public ModelAndView updateMember(MemberVO vo,HttpServletRequest request){
		String message=memberService.updateMember(vo);
		ModelAndView mv=new ModelAndView();
		if(message=="fail"){
			mv.setViewName("redirect:member_update_fail.do");
		}else{
			HttpSession session=request.getSession(false);
			session.setAttribute("mvo", vo);
			mv.setViewName("redirect:interceptor_member_detail.do");
		}
		return mv;
	}
	
	//멤버 회원 탈퇴
	@RequestMapping("interceptor_member_delete.do")
	public ModelAndView deleteMember(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		String result=memberService.deleteMember(id);
		if(result=="ok"){
			session.invalidate();
		}
		return new ModelAndView("member_delete_result","result",result);
	}
	@RequestMapping("interceptor_member_detail.do")
	public ModelAndView memberDetail(){
		return new ModelAndView("member_detail");
	}
	
	//비밀번호 체크
	@RequestMapping(value="check.do", method=RequestMethod.POST)
	@ResponseBody
	public Object check(MemberVO mvo){
		HashMap<String,String> map = new HashMap<String, String>();
		MemberVO vo = memberService.loginMember(mvo);
		if(vo!=null){
			map.put("check","ok");
			return map;
		}else{
			map.put("check","fail");
			return map;
		}
	}

	
	
	
}
