package org.kosta.zoosee.model.review;

import java.util.List;

import org.kosta.zoosee.model.vo.ReviewVO;

public interface ReviewService {

	void inputReview(ReviewVO rvo);

	List<ReviewVO> getReviewVOById(String id);
	public Double avg(String id);
}
