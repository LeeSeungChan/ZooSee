package org.kosta.zoosee.model.calendar;

import java.util.List;

import org.kosta.zoosee.model.vo.PetCalendarVO;

public interface PetCalendarDAO {

	void registerCalendar(PetCalendarVO petCalendarVO);

	List<PetCalendarVO> getReserveDate(int reserve_no);

	int deleteCanlendar(int reserve_no);

	List<String> getPetCalendarDate(int petsitterboard_no);

	void updatePetReserve(int reserve_no);

}
