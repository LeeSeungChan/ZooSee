package org.kosta.zoosee.model.calendar;

import java.util.List;

import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;

public interface PetCalendarService {

	List<String> getPetCalendarDate(int petsitterboard_no);

	void registerCalendar(ReserveVO reserveVO, int reserve_no, PetsitterboardVO petsitterboardVO, String petsitterId);

	void updatePetReserve(int reserve_no);

}
 