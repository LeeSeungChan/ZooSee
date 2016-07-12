package org.kosta.zoosee.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.board.ListVO;
import org.kosta.zoosee.model.board.PagingBean;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.review.ReviewService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReviewVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;
	@Resource
	private PetsitterService petsitterService;
	@Resource
	private ReserveService reserveService;																																							
	@Resource
	private ReviewService reviewService;
	// 헤더에서 보드 등록 폼.JSP로 이동하는
	@RequestMapping("psboard_petsitterboard_registerform.do")
	public ModelAndView registerBoard(HttpServletRequest request) {
		// 2016.07.05
		// 시큐리티 세션
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		PetsitterboardVO pbVO = reserveService.getBoardVOByPetsitterId(id);
		String flag = "false";
		if(pbVO != null){
			flag = "true";
		}
		
		ModelAndView mv = new ModelAndView("petsitterboard_registerForm");
		mv.addObject("petsitterVO", petsitterVO);
		mv.addObject("flag", flag);
		
		return mv;
	}

	// 펫시터보드 등록하는
	@RequestMapping(value="psboard_petsitterboardRegister.do", method=RequestMethod.POST)
	public ModelAndView registerPetsitterboard(@ModelAttribute PetsitterboardVO petsitterboardVO, PetsitterVO petsitterVO) {
		boardService.registerPetsitterboard(petsitterboardVO, petsitterVO);
		return new ModelAndView("redirect:home.do");
	}

	// 조건에 따른 리스트 검색
	// 페이징 처리도 해줌
	@RequestMapping("getConditionList.do")
	public ModelAndView conditionBoard(HttpServletRequest request) {
		String service = request.getParameter("service");
		String petSize = request.getParameter("petSize");
		String petType = request.getParameter("petType");
		String pageNo = request.getParameter("pageNo");
		ModelAndView mv = new ModelAndView();
		ListVO lvo = null;
		int pn = 1;
		HashMap<Integer, PetsitterboardVO> map = new HashMap<Integer, PetsitterboardVO>();
		int total = boardService.totalCount(service, petSize, petType);
		if (pageNo == null) {
			map = listInMap(pn, service, petSize, petType);
			// total
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		if (pageNo != null) {
			pn = Integer.parseInt(pageNo);
			map = listInMap(pn, service, petSize, petType);
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		mv.addObject("lvo", lvo);
		if (service != null && petSize != null && petType != null) {
			mv.addObject("service", service);
			mv.addObject("petSize", petSize);
			mv.addObject("petType", petType);
		}
		mv.setViewName("petsitterboard_result");
		return mv;
	}
	public HashMap<Integer, PetsitterboardVO> listInMap(int pn, String service, String petSize, String petType) {
		HashMap<Integer, PetsitterboardVO> boardmap = new HashMap<Integer, PetsitterboardVO>();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pageNo", String.valueOf(pn));
		map.put("service", service);
		map.put("petSize", petSize);
		map.put("petType", petType);
		List<PetsitterboardVO> list = boardService.getConditionList(map);
		for (int i = 0; i < list.size(); i++) {
			boardmap.put(i, list.get(i));
		}
		return boardmap;
	}

	// 펫시터보드 디테일 보기
	@RequestMapping("petsitterboardDetail.do")
	public ModelAndView getboardDetail(int petsitterboard_no, HttpServletRequest request) 
	{
		System.out.println();
		ModelAndView mv = new ModelAndView();
		// 비회원이 볼때.   
		if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof MemberVO)
		{
			mv.setViewName("petsitterboard_detail");
		}
		else
		{
			mv.setViewName("petsitterboard_unMemberdetail");
		}
		PetsitterboardVO petsitterboardVO = boardService.getboardDetail(petsitterboard_no);
		List<String> list = boardService.getPetCalendarDate(petsitterboard_no);
		// 날짜 포맷 바꾸는([2016-06-01]을 [2016-6-1]로) insert할 때 바꿔야 한다.
		for (int i = 0; i < list.size(); i++) {
			String[] ab = list.get(i).split("-");
			String str = "";

			for (int j = 0; j < ab.length; j++) {
				if (ab[j].startsWith("0")) {
					String b = ab[j].substring(1);
					ab[j] = b;
				}
				str += ab[j] + "-";
			}
			String str2 = str.substring(0, str.length() - 1);
			list.set(i, str2);
		}

		mv.addObject("petsitterboardVO", petsitterboardVO);
		mv.addObject("calendarList", list);
		List<ReviewVO> reviewList=reviewService.getReviewVOById(petsitterboardVO.getPetsitterVO().getMemberVO().getId());
		mv.addObject("reviewList", reviewList);

		return mv;
	}

	@RequestMapping("psboard_petsitterboard_myPetsitterBoard.do")
	public ModelAndView myPetsitterboard(HttpServletRequest request) {
		//HttpSession session = request.getSession(false);
		// 2016.07.05
		// 시큐리티 세션 
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		int petsitterboard_no=0;
		try
		{
			petsitterboard_no = boardService.myPetsitterboard(id);
		}
		catch(Exception e)
		{
			return new ModelAndView("redirect:petsitterboard_error.do");
		}
		return new ModelAndView("redirect:petsitterboardDetail.do?petsitterboard_no="+ petsitterboard_no);
	}
	
	@RequestMapping("petsitterboard_error.do")
	public String petsitterboardErrorView()
	{
		return "error/petsitterboard_error";
	}
	
	//게시글 수정 뷰
	@RequestMapping("psboard_petsitterboard_myPetsitterBoardUpdateView.do")
	public ModelAndView myPetsitterboardUpdateView(int petsitterboard_no) {
		ModelAndView mv = new ModelAndView("petsitterboard_updateForm");
		List<String> list = boardService.getPetCalendarDate(petsitterboard_no);

		// 날짜 포맷 바꾸는([2016-06-01]을 [2016-6-1]로) insert할 때 바꿔야 한다.
		for (int i = 0; i < list.size(); i++) {
			String[] ab = list.get(i).split("-");
			String str = "";

			for (int j = 0; j < ab.length; j++) {
				if (ab[j].startsWith("0")) {
					String b = ab[j].substring(1);
					ab[j] = b;
				}
				str += ab[j] + "-";
			}
			String str2 = str.substring(0, str.length() - 1);
			list.set(i, str2);
		}
		mv.addObject("calendarList", list);
		PetsitterboardVO petsitterboardVO = boardService.getboardDetail(petsitterboard_no);
		mv.addObject("petsitterboardVO", petsitterboardVO);
		return mv;
	}
		
	//게시글 수정
	@RequestMapping("psboard_petsitterboardUpdate.do")
	public ModelAndView myPetsitterboardUpdate(PetsitterboardVO petsitterboardVO,PetsitterVO petsitterVO){            
		boardService.myPetsitterboardUpdate(petsitterboardVO,petsitterVO);
		return new ModelAndView("redirect:psboard_petsitterboard_myPetsitterBoard.do");
	}
	
	//게시글삭제
	@RequestMapping("psboard_petsitterboard_myPetsitterBoardDelete.do")
	public ModelAndView myPetsitterBoardDelete(int petsitterboard_no){
		boardService.myPetsitterBoardDelete(petsitterboard_no);
		return new ModelAndView("redirect:home.do");
	}
}
