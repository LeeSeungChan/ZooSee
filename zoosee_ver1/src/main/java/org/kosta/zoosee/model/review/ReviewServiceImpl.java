package org.kosta.zoosee.model.review;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Resource
	private ReviewDAO reviewDAO;

	@Override
	public void inputReview(ReviewVO rvo) {
		reviewDAO.inputReview(rvo);
		
	}

	@Override
	public List<ReviewVO> getReviewVOById(String id) {
		return reviewDAO.getReviewVOById(id);
	}
	   @Override
	   public Double avg(String id) {
	      try{
	      Double result = reviewDAO.avg(id);
	      }catch(Exception e){
	         int result=0;
	      }
	      
	      return reviewDAO.avg(id);
	   }
	   

}
