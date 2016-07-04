package org.kosta.zoosee.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.review.ReviewService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	@Resource
	private PetsitterService petsitterService;
	@Resource
	private BoardService boardService;
	
	
	@RequestMapping("popup_reviewPopup.do")
	public ModelAndView reviewPopup(String id){
		return new ModelAndView("popup_reviewPopup","id",id);
	}
	
	//리뷰 등록
	@RequestMapping("interceptor_tradeInfo_inputReview.do")
	public ModelAndView inputReview(ReviewVO rvo,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null){
			rvo.setId(((MemberVO)session.getAttribute("mvo")).getId()); 
		}
		reviewService.inputReview(rvo);
		int petsitterboard_no=boardService.myPetsitterboard(rvo.getRef_id());
		return new ModelAndView("redirect:petsitterboardDetail.do","petsitterboard_no",petsitterboard_no);
		
	}
	
	
   @RequestMapping(value="avg_star_rate.do",method=RequestMethod.POST)
   @ResponseBody
   public Object avgStarRate(String id){
      Double avg = reviewService.avg(id);

      HashMap<String,Double> map = new HashMap<String,Double>();
      map.put("avg", avg);
      return map;
   }
	   
	
}
