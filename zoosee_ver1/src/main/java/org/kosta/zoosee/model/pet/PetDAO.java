package org.kosta.zoosee.model.pet;

import java.util.List;

import org.kosta.zoosee.model.vo.PetVO;

public interface PetDAO {

	public abstract int registerPet(PetVO pvo);

	public abstract PetVO petDetail(int petNo);

	public abstract List<PetVO> petList(String id);

	public abstract void petUpdateResult(PetVO vo);

	public abstract void updatePetNoImg(PetVO pvo);

	public abstract void deletePet(int petNo);

	public abstract PetVO getPetVO(String id);
	
	public abstract PetVO detailPetAndMemberInfo(String id);
}