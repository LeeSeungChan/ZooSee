package org.kosta.zoosee.model.review;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Resource
	private SqlSessionTemplate template;
	
	
}
