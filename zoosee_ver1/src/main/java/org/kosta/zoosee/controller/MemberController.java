package org.kosta.zoosee.controller;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.security.core.context.SecurityContextHolder;
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
	@Resource
	private BoardService boardService;
	
	/* Member 회원가입하는 메서드 */
	@RequestMapping(value="registerMember.do", method=RequestMethod.POST)
	public String registerMember(MemberVO mvo){
		memberService.registerMember(mvo);
		return "redirect:member_register_result.do";
	}
	/* Member 로그인 메서드 */
	/*@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView loginMember(HttpServletRequest request){
		
		
		MemberVO mvo = new MemberVO();
		mvo.setId(request.getParameter("id"));
		mvo.setPassword(request.getParameter("password"));
		
		ModelAndView mv = new ModelAndView("home");
		MemberVO vo = memberService.loginMember(mvo);
		if(vo != null){
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
			return new ModelAndView("loginfail.do");
		}
	}*/
	@RequestMapping("loginSuccess.do")
	public ModelAndView loginMemberSuccess(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("member_loginSuccess");
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		String password = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getPassword();
		String rank = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getRank();
		
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPassword(password);
		MemberVO vo = memberService.loginMember(mvo);
		
		String petMasterSignal = "";
		if(rank.equals("petmaster")){
			// showMyReserveList에서 petmaster의 전체 예약목록을 뽑아오기 위해 2로 설정
			petMasterSignal = "2";
		}
		List<ReserveVO> reserveList = reserveService.showMyReserveList(vo, petMasterSignal);
		HashMap<String, List<ReserveVO>> map = memberService.showReserveList(reserveList);
		mv.addObject("reserveTotalList", map);
		return mv;
	}
	
	// 2016.07.05 추가
	// fail 추가.
	@RequestMapping("loginfail.do")
	public String loginMemberFail()
	{
		return "member_loginFail";
	}
	
	/* Member 회원가입시 아이디 중복확인 메서드 */
	@RequestMapping(value="memberIdCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int memberIdCheck(String id){
		return memberService.memberIdCheck(id);
	}
	/* Member 정보수정 메서드 */
	@RequestMapping(value="m_member_update_result.do", method=RequestMethod.POST)
	public ModelAndView updateMember(MemberVO vo,HttpServletRequest request){
		String message = memberService.updateMember(vo);
		MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		SetSpringSessionMemberVO(mvo, vo);
		ModelAndView mv=new ModelAndView();
		if(message=="fail"){
			mv.setViewName("redirect:member_update_fail.do");
		}else{
			mv.setViewName("redirect:member_detail.do");
		}
		return mv;
	}
	private void SetSpringSessionMemberVO(MemberVO mvo, MemberVO vo)
	{
		mvo.setPassword(vo.getPassword());
		mvo.setName(vo.getName());
		mvo.setAddress(vo.getAddress());
		mvo.setAddressCode(vo.getAddressCode());
		mvo.setDetailAddress(vo.getDetailAddress());
		mvo.setEmail(vo.getEmail());
		mvo.setGender(vo.getGender());
		mvo.setJob(vo.getJob());
		mvo.setTel(vo.getTel());
		mvo.setRank(vo.getRank());
		mvo.setExistence(vo.getExistence());
	}
	
	
	//멤버 회원 탈퇴
	@RequestMapping("m_member_delete.do")
	public ModelAndView deleteMember(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		// 2016.07.06
		// 세션 아이디 설정
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		String result = memberService.deleteMember(id);
		if(result.equals("ok") && session!=null){
			session.invalidate();
		}
		return new ModelAndView("member/delete_result","result",result);
	}
	
	@RequestMapping("m_member_detail.do")
	public ModelAndView memberDetail(HttpServletRequest request)
	{
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		try
		{
			int i = boardService.myPetsitterboard(id);
			request.setAttribute("boardInfo","ok");
		}
		catch(NullPointerException e)
		{
			request.setAttribute("boardInfo","no");
		}
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
	
	@RequestMapping("m_member_update.do")
	public ModelAndView updateForm(HttpServletRequest request)
	{
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		ModelAndView mv = new ModelAndView("member_update");
		MemberVO memberVO = memberService.getMemberVO(id);
		mv.addObject("memberVO", memberVO);
		try
		{
			int i = boardService.myPetsitterboard(id);
			mv.addObject("boardInfo","ok");
		}
		catch(NullPointerException e)
		{
			mv.addObject("boardInfo","no");
		}
		return mv;
	}
}
