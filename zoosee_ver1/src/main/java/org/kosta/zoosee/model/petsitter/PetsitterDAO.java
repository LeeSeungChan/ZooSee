package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;

public interface PetsitterDAO {

	public abstract int registerPetsitter(PetsitterVO petsitterVO);

	public abstract List<PetsitterVO> petsitterList(HashMap<String, String> map);

	public abstract int recognitionPetsitter(int petsitterNo);

	public abstract PetsitterVO getPetsitterVO(int petsitterNo);

	public abstract void deletePetsitter(int petsitterNo);

	public abstract PetsitterVO findPetsitterById(String id);

	public abstract int update(PetsitterVO petsitterVO);

	public abstract int petsitterListCount(String value);

	public abstract void updateRank(String id);
}