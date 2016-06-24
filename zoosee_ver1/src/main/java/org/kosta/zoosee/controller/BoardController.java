package org.kosta.zoosee.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.board.ListVO;
import org.kosta.zoosee.model.board.PagingBean;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource
	private BoardService boardServie;
	@Resource
	private PetsitterService petsitterService;

	// 헤더에서 보드 등록 폼.JSP로 이동하는
	@RequestMapping("interceptor_petsitterboard_registerform.do")
	public ModelAndView registerBoard(String id) {
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		
		return new ModelAndView("petsitterboard_registerForm", "petsitterVO", petsitterVO);
	}

	// 펫시터보드 등록하는
	@RequestMapping(value="interceptor_petsitterboardRegister.do", method=RequestMethod.POST)
	public ModelAndView registerPetsitterboard(@ModelAttribute PetsitterboardVO petsitterboardVO, PetsitterVO petsitterVO) {
		boardServie.registerPetsitterboard(petsitterboardVO, petsitterVO);

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
		int total = boardServie.totalCount(service, petSize, petType);
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
		List<PetsitterboardVO> list = boardServie.getConditionList(map);
		for (int i = 0; i < list.size(); i++) {
			boardmap.put(i, list.get(i));
		}
		return boardmap;
	}

	// 펫시터보드 디테일 보기
	@RequestMapping("petsitterboardDetail.do")
	public ModelAndView getboardDetail(int petsitterboard_no) {
		ModelAndView mv = new ModelAndView("petsitterboard_detail");

		PetsitterboardVO petsitterboardVO = boardServie.getboardDetail(petsitterboard_no);
		List<String> list = boardServie.getPetCalendarDate(petsitterboard_no);

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

		return mv;
	}
}
