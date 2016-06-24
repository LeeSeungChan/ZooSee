package org.kosta.zoosee.model.review;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Resource
	private ReviewDAO reviewDAO;
	

}
