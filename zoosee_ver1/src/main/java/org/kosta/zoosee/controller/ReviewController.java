package org.kosta.zoosee.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("interceptor_popup_reviewPopup.do")
	public ModelAndView reviewPopup(String id){
		PetsitterVO pvo=petsitterService.findPetsitterById(id);
		return new ModelAndView("popup_reviewPopup","petsitterVO",pvo);
	}
	
	@RequestMapping(value="interceptor_tradeInfo_inputReview.do",method=RequestMethod.POST)
	public void inputReview(ReviewVO rvo,HttpServletRequest request){
		System.out.println(1);
		HttpSession session=request.getSession(false);
		if(session!=null){
			rvo.setId(((MemberVO)session.getAttribute("mvo")).getId()); 
		}
		reviewService.inputReview(rvo);
		
	}
	
	
   @RequestMapping(value="avg_star_rate.do",method=RequestMethod.POST)
   @ResponseBody
   public Object avgStarRate(String id){
	   System.out.println("아이디@@@@@@@@@@"+id);
      Double avg = reviewService.avg(id);

      HashMap<String,Double> map = new HashMap<String,Double>();
      map.put("avg", avg);
      return map;
   }
	   
	
}
