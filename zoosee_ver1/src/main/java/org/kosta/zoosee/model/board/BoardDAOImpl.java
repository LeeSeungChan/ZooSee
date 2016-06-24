package org.kosta.zoosee.model.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<PetsitterboardVO> getBoardList(String search) {
 		return template.selectList("petsitterboard.getBoardList", search);
	}

	@Override
	// PETSITTERBOARD DB에 insert
	public void registerPetsitterboard(PetsitterboardVO petsitterboardVO) {
		template.insert("petsitterboard.registerPetsitterboard", petsitterboardVO);
	}

	@Override
	// 등록할 때 'PETSITTER'정보 변경사항이 있으면 update
	public void updatePetsitterVO(PetsitterVO petsitterVO) {
		template.update("petsitterboard.updatePetsitterVO", petsitterVO);
	}

	@Override
	public List<PetsitterboardVO> getConditionList(HashMap<String, String> map) {
		return template.selectList("petsitterboard.getConditionList", map);
	}

	@Override
	public int totalCount(HashMap<String, String> map) {
		List<Integer> list = template.selectList("petsitterboard.gettotalCount",map);
		int count = list.get(0);
		return count;
	}

	@Override
	public PetsitterboardVO getboardDetail(int petsitterNo) {
 		return template.selectOne("petsitterboard.getboardDetail", petsitterNo);
	}
	
	// Error 뜬다!! 펫시터가 여러 글을 등록해두면	 
	@Override	 
	public PetsitterboardVO getBoardVOByPetsitterId(String id) {	 
		return template.selectOne("petsitterboard.getBoardVOByPetsitterId", id);	 
	}
}
