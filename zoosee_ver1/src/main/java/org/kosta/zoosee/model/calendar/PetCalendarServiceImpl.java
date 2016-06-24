package org.kosta.zoosee.model.calendar;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.reserve.ReserveDAO;
import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.stereotype.Service;

@Service
public class PetCalendarServiceImpl implements PetCalendarService {
	@Resource
	private PetCalendarDAO petCalendarDAO;
	@Resource
	private ReserveDAO reserveDAO;

	@Override
	public List<String> getPetCalendarDate(int petsitterboard_no) {
 		return petCalendarDAO.getPetCalendarDate(petsitterboard_no);
	}

	// 처음날짜부터 마감날짜까지 각각 구해서 pet_Calendar에 insert
	@Override
	public void registerCalendar(ReserveVO reserveVO, int reserve_no, PetsitterboardVO petsitterboardVO, String petsitterId) {
		PetCalendarVO petCalendarVO = new PetCalendarVO(0, null, "no", reserveVO.getPetsitterboardVO(), reserveVO);
		
		String[] str = petsitterboardVO.getStartDay().split("-");
		String[] etr = petsitterboardVO.getEndDay().split("-");
		
		int sday = Integer.parseInt(str[2]);
		int eday = 0;
		
		if(str[1].equals(etr[1])){
			eday = Integer.parseInt(etr[2]);
			
			registerCalendar(sday, eday, str, petCalendarVO);
		}else{
			int month = Integer.parseInt(str[1]);
			switch(month){
				case 1: case 3: case 5: case 7: case 8: case 10: case 12:{
					eday = 31;
					break;
				}
				case 4: case 6: case 9: case 11: {
					eday = 30;
					break;
				}
				case 2:{
					eday = 28;
					break;
				}
			}
			
			registerCalendar(sday, eday, str, petCalendarVO);
			registerCalendar(1, Integer.parseInt(etr[2]), etr, petCalendarVO);
		}
	}
	private void registerCalendar(int sday, int eday, String[] array, PetCalendarVO petCalendarVO) {
		for(int i = sday; i <= eday; i++){
			petCalendarVO.setPet_calDate(array[0] + "-" + array[1] + "-" + i);
			petCalendarDAO.registerCalendar(petCalendarVO);
		}
	}

	@Override
	public void updatePetReserve(int reserve_no) {
		petCalendarDAO.updatePetReserve(reserve_no);
	}
	
}
