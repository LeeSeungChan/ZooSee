package org.kosta.zoosee.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.zoosee.model.search.ListVO;
import org.kosta.zoosee.model.search.PagingBean;
import org.kosta.zoosee.model.search.SearchService;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	@Resource
	private SearchService service;

	// 주소로 검색 시 페이지 에 해당하는 보드리스트 갖고 오기
	@RequestMapping("findAllPetsitterList.do")
	public ModelAndView findAllPetsitterList(HttpServletRequest request) {
		// 페이지 번호
		String pageNo = request.getParameter("pageNo");
		// 주소
		String address = request.getParameter("address");
		ModelAndView mv = new ModelAndView();
		HashMap<Integer, PetsitterboardVO> map = new HashMap<Integer, PetsitterboardVO>();
		// 총 게시물 수를 가져옴
		int total = service.findAddressCount(address);
		int pn = 1;
		ListVO lvo = null;
		// 페이지 번호가 없고 주소값이 없을
		if (pageNo == null && address.equals(""))
		{
			// 리스트에 기본 값인 1을 넣음
			map = listInMap(pn, address);
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		// 페이지 번호가 널이고 주소가 있을때
		if(pageNo==null && !address.equals(""))
		{
			map = listInMap(pn, address);
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		// 페이지 번호가 잇고 주소가 있을때
		if(pageNo!=null && !address.equals("")) 
		{
			pn = Integer.parseInt(pageNo);
			map = listInMap(pn, address);
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		if(pageNo!=null && address.equals(""))
		{
			pn = Integer.parseInt(pageNo);
			map = listInMap(pn, address);
			lvo = new ListVO(map, new PagingBean(total, pn));
		}
		// list를 map으로 처리
		mv.addObject("lvo", lvo);
		if (address != null) 
		{
			mv.addObject("address", address);
		}
		mv.addObject("condition","search");
		mv.setViewName("petsitterboard_result");
		return mv;
	}
	public HashMap<Integer, PetsitterboardVO> listInMap(int pn, String address)
	{
		HashMap<Integer, PetsitterboardVO> map = new HashMap<Integer, PetsitterboardVO>();
		List<PetsitterboardVO> list = service.findAllPetsitterList(pn, address);
		for (int i = 0; i < list.size(); i++) {
			map.put(i, list.get(i));
		}
		return map;
	}
}
