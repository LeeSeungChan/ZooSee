package org.kosta.zoosee.model.board;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;

public interface BoardDAO {

	List<PetsitterboardVO> getBoardList(String search);

	void registerPetsitterboard(PetsitterboardVO petsitterboardVO);

	void updatePetsitterVO(PetsitterVO petsitterVO);

	List<PetsitterboardVO> getConditionList(HashMap<String, String> map);

	int totalCount(HashMap<String, String> map);

	PetsitterboardVO getboardDetail(int petsitterboard_no);

	PetsitterboardVO getBoardVOByPetsitterId(String id);

}
