package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PetsitterDAOImpl implements PetsitterDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public int registerPetsitter(PetsitterVO petsitterVO){
		return template.insert("petsitter.registerPetsitter",petsitterVO);
	}
	
	@Override
	public int petsitterListCount(String value) {
		return template.selectOne("petsitter.petsitterListCount",value);
	}

	@Override
	public List<PetsitterVO> petsitterList(HashMap<String,String> map) {
		return template.selectList("petsitter.petsitterList",map);
	}

	@Override
	public int recognitionPetsitter(int petsitterNo) {
		return template.update("petsitter.recognitionPetsitter",petsitterNo);
		
	}

	@Override
	public PetsitterVO getPetsitterVO(int petsitterNo) {
		return template.selectOne("petsitter.getPetsitterVO",petsitterNo);
	}

	@Override
	public void deletePetsitter(int petsitterNo) {
		template.selectOne("petsitter.deletePetsitter",petsitterNo);
	}

	@Override
	public void updateRank(String id) {
		template.update("petsitter.updateRank", id);
	}

	@Override
	public PetsitterVO findPetsitterById(String id) {
		return template.selectOne("petsitter.findPetsitterById",id);
	}

	@Override
	public int update(PetsitterVO petsitterVO) {
		return template.update("petsitter.update",petsitterVO);
	}
}
