package org.kosta.zoosee.model.pet;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository		
public class PetDAOImpl implements PetDAO {
	@Resource
	private SqlSessionTemplate template;	
	
	@Override
	public int registerPet(PetVO pvo) {
		return template.insert("pet.registerPet",pvo);			
	}

	@Override
	public PetVO petDetail(int petNo) {
		return template.selectOne("pet.detail",petNo);
	}

	@Override
	public List<PetVO> petList(String id) {
		return template.selectList("pet.petList",id);
	}

	@Override
	public void petUpdateResult(PetVO vo) {
		template.update("pet.update", vo);
	}
	@Override
	public void updatePetNoImg(PetVO pvo) {
		template.update("pet.updatePetNoImg",pvo);
	}

	@Override
	public void deletePet(int petNo) {
		template.delete("pet.delete", petNo);
	}

	/*@Override
	public PetVO getPetVO(String id) {
 		return template.selectOne("pet.getPetVO", id);
	}*/

	@Override
	public List<PetVO> detailPetAndMemberInfo(String id) {
		return template.selectList("pet.detailPetAndMemberInfo",id);
	}

	@Override
	public int getPetCountById(String id) 
	{
		return template.selectOne("pet.getPetCountById",id);
	}

	@Override
	public List<PetVO> getPetVOList(String id) 
	{
		return template.selectList("pet.petList",id);
	}

	// 2016.07.06
	// petNo 갖고오기
	@Override
	public List<Integer> getPetNo(String id) 
	{
		return template.selectList("pet.getPetNo",id);
	}
}
