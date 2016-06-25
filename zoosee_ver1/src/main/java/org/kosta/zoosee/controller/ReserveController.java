package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.calendar.PetCalendarService;
import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.tradeInfo.TradeInfoServie;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.kosta.zoosee.model.vo.TradeInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReserveController {
	@Resource
	private ReserveService reserveService;
	@Resource
	private TradeInfoServie tradeInfoServie;
	@Resource
	private MemberService memberService;
	@Resource
	private PetsitterService petsitterService;
	@Resource
	private BoardService boardService;
	@Resource
	private PetService petService;
	@Resource
	private PetCalendarService petCalendarService;
	
	// 예약 하기.
	@RequestMapping("interceptor_reserveRegister.do")
	public ModelAndView reserveRegister(HttpServletRequest request, ReserveVO reserveVO, PetsitterboardVO petsitterboardVO){
		// 멤버VO set해주기
		String id = request.getParameter("id");
		reserveVO.setMemberVO(reserveService.getMemberVO(id));
		
		// 예약요청하기
		reserveService.reserveRegister(reserveVO, petsitterboardVO);
		
		return new ModelAndView("redirect:reserveDetail.do?reserve_no="+reserveVO.getReserve_no());
	}
	// 예약 정보
	@RequestMapping("reserveDetail.do")
	public ModelAndView showReserve(int reserve_no){
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no);
		
		List<PetCalendarVO> list2 = reserveService.getReserveDate(reserve_no);
		ModelAndView mv = new ModelAndView("reserve_reserveDetail");
		
		mv.addObject("reserveDetail", reserveVO);
		mv.addObject("reserveSdate", list2.get(0));
		mv.addObject("reserveEdate", list2.get(list2.size()-1));
		
		return mv;
	}
	
	// 본인 예약된 or 예약한 리스트 보기
	@RequestMapping("interceptor_reserve_reserveMyList.do")
	public ModelAndView showMyReserveList(HttpServletRequest request){
		String petMasterSignal = request.getParameter("petMasterSignal");
		//System.out.println(petMasterSignal);
		if(petMasterSignal == null || petMasterSignal == ""){
			petMasterSignal = "";
		}
		
		HttpSession session = request.getSession(false);
		String id = null;
		if(session!=null){
			id = ((MemberVO)session.getAttribute("mvo")).getId();
		}
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = memberService.getMemberVO(id);
		List<ReserveVO> reserveList = reserveService.showMyReserveList(memberVO, petMasterSignal);
		mv.addObject("reserveList", reserveList);
		
		if(memberVO.getRank().equals("petsitter")){
			mv.setViewName("reserve_reserveMyList");
		// 신청한 사람이 예약된 펫시터 보드와 펫시터 정보를 받음.
		}else if(memberVO.getRank().equals("petmom")){
			mv.setViewName("reserve_reservePetMomList");
		}else{
			if(petMasterSignal.equals("1")){
				mv.setViewName("reserve_reservePetMomList");
			}else{
				mv.setViewName("reserve_reserveMyList");
			}
		}
		return mv;
	}
	
	// 본인한테 예약한 PetMom 정보 보기
	@RequestMapping("interceptor_reserve_showPetmomDetail.do")
	public ModelAndView showPetmomDetail(HttpServletRequest request){
		String id = request.getParameter("id");
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		MemberVO memberVO = reserveService.showPetmomDetail(id);
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no);
		
		ModelAndView mv = new ModelAndView("reserve_reservePetmomDetail");
		mv.addObject("memberVO", memberVO);
		mv.addObject("reserveVO", reserveVO);
		return mv;
	}
	
	// 
	@RequestMapping("interceptor_reserve_showPesitterDetail.do")
	public ModelAndView showPesitterDetail(HttpServletRequest request){
		String id = request.getParameter("id");
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		PetsitterboardVO petsitterboardVO = reserveService.getBoardVOByPetsitterId(id);
		petsitterboardVO.setPetsitterVO(petsitterVO);
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no);
		List<PetVO> petList = petService.petList(id);
		
		ModelAndView mv = new ModelAndView("reserve_reservePesitterDetail");
		mv.addObject("petsitterboardVO", petsitterboardVO);
		mv.addObject("reserveVO", reserveVO);
		mv.addObject("petList", petList);
		
		return mv;
	}
	
	// 예약을 승인을 할 때
	// 펫시터 기준
	@RequestMapping("interceptor_reserve_reserveAccept.do")
	public ModelAndView reserveAccept(HttpServletRequest request){
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no")); // reserve_no
		String id = request.getParameter("id"); // 신청자(PETMOM) 아이디
		String sessionId = null; // 본인(PETSITTER) 아이디 session에서 받아온다.
		HttpSession session = request.getSession(false);
		
		int checkId = reserveService.getReserveIdCheck(id);
		if(checkId == 0){
			return new ModelAndView("redirect:reserve_reserveAcceptFail.jsp");
		}
		
		if(session != null){
			sessionId = ((MemberVO)session.getAttribute("mvo")).getId();
		}
		
		// pet_Calendar의 pet_reserve를 no에서 yes로 업데이트
		petCalendarService.updatePetReserve(reserve_no);
		
		// reservce_reocg를 1로 올려준다.
		reserveService.updateReserveRecog(reserve_no);
		
		return new ModelAndView("redirect:interceptor_reserve_reserveMyList.do?id="+sessionId);
	}
	// 펫시터가 승낙까지 했고 펫맘이 거래하기 누르는
	// 펫마스터가 거래하기를 누르면 거래목록이 안나옴.
	@RequestMapping("interceptor_reserve_reserveDealAccept.do")
	public ModelAndView reserveDealAccept(HttpServletRequest request){
		String petsitterId = request.getParameter("petsitterId");
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		//int petsitterNo = Integer.parseInt(request.getParameter("petsitterNo"));
		String id = null; 
		// 본인(펫맘) 아이디 session에서 받아온다.
		HttpSession session = request.getSession(false);
		if(session != null){
			id = ((MemberVO)session.getAttribute("mvo")).getId();
		}
		
		// 거래내역에 삽입한다.
		TradeInfoVO tradeInfoVO = new TradeInfoVO();
		tradeInfoServie.registerTradeInfo(tradeInfoVO, reserve_no, id, petsitterId);
		
		// recog를 2로 올려준다
		reserveService.updateReserveRecog(reserve_no);
		
		return new ModelAndView("redirect:interceptor_tradeInfo_subgetTradeMyList.do");
	}
	// 위에서 redirect로 오는 것을 받는
	@RequestMapping("interceptor_tradeInfo_subgetTradeMyList.do")
	public ModelAndView subgetTradeMyList(){	
		return new ModelAndView("redirect:interceptor_tradeInfo_getTradeMyList.do");
	}
	
	// 펫시터가 예약 거절 or 펫맘이 거래 취소
	@RequestMapping("interceptor_reserve_reserveCancel.do")
	public ModelAndView reserveCancle(String reserve_no){
		int check = reserveService.reserveCancle(Integer.parseInt(reserve_no));

		return new ModelAndView("redirect:reserve_reserveDelete.do?check="+check);
	}
	@RequestMapping("reserve_reserveDelete.do")
	public ModelAndView reserveDeleteResult(int check){
		return new ModelAndView("reserve_reserveDeleteResult","check",check);
	}
	
	@RequestMapping("interceptor_reserve_reservePetDetail.do")
	public ModelAndView reservePetDetail(int petNo){
		PetVO petVO = reserveService.getPetDetail(petNo);
		
		return new ModelAndView("reserve_petDetail", "petVO", petVO);
	}
}
