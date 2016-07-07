package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.tradeInfo.TradeInfoServie;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.TradeInfoVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TradeInfoController {
	@Resource
	private TradeInfoServie tradeInfoService;
	@Resource
	private ReserveService reserveService;
	@Resource
	private PetService petService;
	@Resource
	private BoardService boardService;
	@Resource
	private PetsitterService petsitterService;
	
	// 버튼 누르면 초기값, 아이디 세션아이디.
	@RequestMapping("tradeInfo_getTradeMyList.do")
	public ModelAndView getTradeMyList(HttpServletRequest request){
		MemberVO memberVO = null;
		memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// id의 rank에 따라 다른 list를 찾는다.
		List<TradeInfoVO> list = tradeInfoService.getTradeMyList(memberVO.getId());
		ModelAndView mv = new ModelAndView("tradeInfo_tradeMyList", "tradeInfoList", list);
		return mv;
	}
	
	@RequestMapping("tradeInfo_tradeInfoCheck.do")
	public ModelAndView tradeInfo_tradeInfoCheck(HttpServletRequest request){
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId(); // 정보를 보고자하는 id를 받아온다.
		String rank = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getRank();
		ModelAndView mv= new ModelAndView();
		
		List<PetVO> petList = petService.detailPetAndMemberInfo(id);
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		
		if(petList.size() == 0){ 
		// pet정보가 없으므로 펫시터
			mv.setViewName("tradeInfo_tradeShowPetsitterDetail");
			mv.addObject("petsitterVO", petsitterVO);
			
			
		}else if(petsitterVO == null){
		// 펫시터 정보가 없으므로 펫맘
			PetVO petVO = petList.get(0);
			mv.setViewName("tradeInfo_tradeShowPetMomDetail");
			mv.addObject("petVO", petVO);
		}else{
		// 둘다 있으므로 펫마스터
			PetVO petVO = petList.get(0);
			mv.setViewName("tradeInfo_tradeShowPetMasterDetail");
			mv.addObject("petsitterVO", petsitterVO);
			mv.addObject("petVO", petVO);
		}
		
		mv.addObject("tradeInfoCheck", rank);
		mv.addObject("checkId", id);
		return mv;
	}

}
