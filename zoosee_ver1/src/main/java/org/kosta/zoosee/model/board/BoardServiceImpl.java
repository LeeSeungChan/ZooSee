package org.kosta.zoosee.model.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.calendar.PetCalendarService;
import org.kosta.zoosee.model.petsitter.PetsitterDAO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private BoardDAO boardDAO;
	@Resource
	private PetsitterDAO petsitterDAO;
	@Resource
	private PetCalendarService petCalendarService;

	@Override
	public void registerPetsitterboard(PetsitterboardVO petsitterboardVO, PetsitterVO petsitterVO) {
		// 일단은 boardDAO에서 만든다 추후에 petsitterDAO으로 이동
		boardDAO.updatePetsitterVO(petsitterVO);
		
		PetsitterVO petsitterVO2 = petsitterDAO.getPetsitterVO(petsitterVO.getPetsitterNo()); 
		//petsitterNo에 해당하는 펫시터를 찾아서 펫보드VO에 setter 해주고
		petsitterboardVO.setPetsitterVO(petsitterVO2);
		
		// petsitterboardVO를 DB에 insert하기
		boardDAO.registerPetsitterboard(petsitterboardVO);
	}

	@Override
	public List<PetsitterboardVO> getConditionList(HashMap<String, String> map) {
		return boardDAO.getConditionList(map);
	}

	@Override
	public int totalCount(String service, String petSize, String petType){
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("service", service);
		map.put("petSize", petSize);
		map.put("petType", petType);
		return boardDAO.totalCount(map);
	}

	// petsitterNo에 해당하는 보드 디테일 받아오기
	@Override
	public PetsitterboardVO getboardDetail(int petsitterNo) {
 		return boardDAO.getboardDetail(petsitterNo);
	}

	// 펫시터보드에 해당하는 예약된 날짜 받아오기
	@Override
	public List<String> getPetCalendarDate(int petsitterboard_no) {
		return petCalendarService.getPetCalendarDate(petsitterboard_no);
	}
}
