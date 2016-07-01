package org.kosta.zoosee.model.review;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void inputReview(ReviewVO rvo) {
		template.insert("review.inputReview",rvo);
		
	}

	@Override
	public List<ReviewVO> getReviewVOById(String id) {
		return template.selectList("review.getReviewVOById",id);
	}
	   @Override
	   public Double avg(String id) {
	      Double result =template.selectOne("review.avg",id);

	      return template.selectOne("review.avg",id);
	   }
	
}
