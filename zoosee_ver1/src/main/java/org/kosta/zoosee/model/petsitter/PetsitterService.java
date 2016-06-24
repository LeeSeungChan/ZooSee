package org.kosta.zoosee.model.petsitter;

import org.kosta.zoosee.model.vo.PetsitterVO;

public interface PetsitterService {

		public abstract void registerPetsitter(PetsitterVO petsitterVO);

		public abstract ListVO petsitterList(String value,String pageNo);
	
		public abstract void recognitionPetsitter(int petsitterNo, String id);
	
		public abstract PetsitterVO getPetsitterVO(int petsitterNo);
	
		public abstract void deletePetsitter(int petsitterNo);

		public abstract PetsitterVO findPetsitterById(String id);

		public abstract void update(PetsitterVO petsitterVO);

		public abstract void updateRank(String id);

}