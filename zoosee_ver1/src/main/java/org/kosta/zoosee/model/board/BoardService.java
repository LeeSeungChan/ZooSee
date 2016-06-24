package org.kosta.zoosee.model.board;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;

public interface BoardService {

	void registerPetsitterboard(PetsitterboardVO petsitterboardVO, PetsitterVO petsitterVO);

	List<PetsitterboardVO> getConditionList(HashMap<String, String> map);

	int totalCount(String service, String petSize, String petType);

	PetsitterboardVO getboardDetail(int petsitterboard_no);

	List<String> getPetCalendarDate(int petsitterboard_no);

}