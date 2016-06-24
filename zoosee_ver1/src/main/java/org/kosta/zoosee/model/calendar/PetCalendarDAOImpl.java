package org.kosta.zoosee.model.calendar;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PetCalendarDAOImpl implements PetCalendarDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void registerCalendar(PetCalendarVO petCalendarVO) {
 		template.insert("petCalendar.registerCalendar", petCalendarVO);
	}

	@Override
	public List<PetCalendarVO> getReserveDate(int reserve_no) {
 		return template.selectList("petCalendar.getReserveDate", reserve_no);
	}

	@Override
	public int deleteCanlendar(int reserve_no) {
 		return template.delete("petCalendar.deleteCanlendar", reserve_no);
	}

	@Override
	public List<String> getPetCalendarDate(int petsitterboard_no) {
 		return template.selectList("petCalendar.getPetCalendarDate", petsitterboard_no);
	}

	@Override
	public void updatePetReserve(int reserve_no) {
		template.update("petCalendar.updatePetReserve", reserve_no);
	}

}
