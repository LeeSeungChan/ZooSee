package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.security.core.context.SecurityContextHolder;
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
	@RequestMapping("reserveRegister.do")
	public ModelAndView reserveRegister(HttpServletRequest request, ReserveVO reserveVO, PetsitterboardVO petsitterboardVO){
		// 멤버VO set해주기
		String id = request.getParameter("id"); //예약자 id
		reserveVO.setMemberVO(reserveService.getMemberVO(id));
		// 예약요청하기
		reserveService.reserveRegister(reserveVO, petsitterboardVO);
		
		return new ModelAndView("redirect:reserve_reserveMyList.do?petMasterSignal=1");
	}
	
	// 본인 예약된 or 예약한 리스트 보기
	@RequestMapping("reserve_reserveMyList.do")
	public ModelAndView showMyReserveList(HttpServletRequest request){
		String petMasterSignal = request.getParameter("petMasterSignal");
		if(petMasterSignal == null || petMasterSignal == ""){
			petMasterSignal = "";
		}
		
		// 시큐리티 세션
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		MemberVO memberVO = memberService.getMemberVO(id);
		
		List<ReserveVO> reserveList = reserveService.showMyReserveList(memberVO, petMasterSignal);
		
		ModelAndView mv = new ModelAndView();
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
	@RequestMapping("reserve_showPetmomDetail.do")
	public ModelAndView showPetmomDetail(HttpServletRequest request){
		String id = request.getParameter("id");
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		MemberVO memberVO = reserveService.showPetmomDetail(id);
		List<Integer> petNolist = petService.getPetNo(id);
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no,petNolist.get(0));
		
		ModelAndView mv = new ModelAndView("reserve_reservePetmomDetail");
		mv.addObject("memberVO", memberVO);
		mv.addObject("reserveVO", reserveVO);
		return mv;
	}
	
	// 
	@RequestMapping("reserve_showPesitterDetail.do")
	public ModelAndView showPesitterDetail(HttpServletRequest request){
		// 펫시터 아이디
		String id = request.getParameter("id");
		String petmomId = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		int reserve_no = Integer.parseInt(request.getParameter("reserve_no"));
		
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		PetsitterboardVO petsitterboardVO = reserveService.getBoardVOByPetsitterId(id);
		petsitterboardVO.setPetsitterVO(petsitterVO);
		// 2016.07.06
		// petNo 을 넘겨주고 reserve 를 갖고옴
		List<Integer> petNolist = petService.getPetNo(petmomId);
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no,petNolist.get(0));
		
		ModelAndView mv = new ModelAndView("reserve_reservePesitterDetail");
		List<PetCalendarVO> list2 = reserveService.getReserveDate(reserve_no);
		mv.addObject("reserveSdate", list2.get(0));
		mv.addObject("reserveEdate", list2.get(list2.size()-1));
		mv.addObject("petsitterboardVO", petsitterboardVO);
		mv.addObject("reserveVO", reserveVO);
		return mv;
	}
	
	// 예약을 승인을 할 때
	// 펫시터 기준
	@RequestMapping("reserve_reserveAccept.do")
	public ModelAndView reserveAccept(HttpServletRequest request,int reserve_no,String id){
		String petsitterId = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		
		int checkId = reserveService.getReserveIdCheck(id); // 신청자(PETMOM) 아이디
		if(checkId == 0){
			return new ModelAndView("redirect:reserve_reserveAcceptFail.jsp");
		}
		
		// reservce_reocg를 1로 올려준다.
		reserveService.updateReserveRecog(reserve_no);
		
		return new ModelAndView("redirect:reserve_reserveMyList.do?id="+petsitterId);
	}
	// 펫시터가 승낙까지 했고 펫맘이 거래하기
	@RequestMapping("reserve_reserveDealAccept.do")
	public ModelAndView reserveDealAccept(HttpServletRequest request,String petsitterId,int reserve_no){
		String petmomId = null; 
		// 본인(펫맘) 아이디 session에서 받아온다.
		petmomId = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		PetsitterVO pvo = petsitterService.findPetsitterById(petsitterId);
		
		if(pvo.getMemberVO().getRank().equals("normal")){
			reserveService.updateReserveRecogImpossible(reserve_no);
			return new ModelAndView("redirect:reserve_reserveMyList.do?id="+petsitterId);
		}else{
			// pet_Calendar의 pet_reserve를 no에서 yes로 업데이트
			petCalendarService.updatePetReserve(reserve_no,petmomId,petsitterId);
			
			// 거래내역에 삽입한다.
			TradeInfoVO tradeInfoVO = new TradeInfoVO();
			tradeInfoServie.registerTradeInfo(tradeInfoVO, reserve_no, petmomId, petsitterId);
			// recog를 2로 올려준다
			reserveService.updateReserveRecog(reserve_no);
			
			return new ModelAndView("redirect:tradeInfo_subgetTradeMyList.do");
		}
	}
	// 위에서 redirect로 오는 것을 받는
	@RequestMapping("tradeInfo_subgetTradeMyList.do")
	public ModelAndView subgetTradeMyList(){	
		return new ModelAndView("redirect:tradeInfo_getTradeMyList.do");
	}
	
	// 펫시터가 예약 거절 or 펫맘이 거래 취소
	@RequestMapping("reserve_reserveCancel.do")
	public ModelAndView reserveCancle(String reserve_no,String petsitterId,String petmomId){
		int check = reserveService.reserveCancle(Integer.parseInt(reserve_no),petsitterId,petmomId);

		return new ModelAndView("redirect:reserve_reserveDelete.do?check="+check);
	}
	@RequestMapping("reserve_reserveDelete.do")
	public ModelAndView reserveDeleteResult(int check){
		return new ModelAndView("reserve_reserveDeleteResult","check",check);
	}
	
	@RequestMapping("reserve_reservePetDetail.do")
	public ModelAndView reservePetDetail(int petNo){
		PetVO petVO = reserveService.getPetDetail(petNo);
		return new ModelAndView("reserve_petDetail", "petVO", petVO);
	}
}
