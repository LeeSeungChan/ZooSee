package org.kosta.zoosee.model.calendar;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.reserve.ReserveDAO;
import org.kosta.zoosee.model.vo.MessageVO;
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
	@Resource
	private MessageDAO messageDAO;

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
			String index = null;
			if(i < 10){
				index = "0" + i;
			}else{
				index = String.valueOf(i);
			}
			
			petCalendarVO.setPet_calDate(array[0] + "-" + array[1] + "-" + index); 	
			petCalendarDAO.registerCalendar(petCalendarVO);
		}
	}

	@Override
	public void updatePetReserve(int reserve_no, String petmomId, String petsitterId) {
		int i=petCalendarDAO.updatePetReserve(reserve_no);
		if (i == 1) {
			//메세지-예약자(펫맘)
			String title = "[알람] 예약 요청 승인";
			StringBuilder content = new StringBuilder(" 신청하신 반려견 돌보미 예약을 돌보미가 승인하였습니다.");
			content.append(" 예약목록을 통해 내역을 확인하실 수 있습니다. 결제 후 돌보미의 정보를 추가로 확인 하실 수 있습니다.");
			content.append(" 이용해주셔서 감사합니다.");
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(petmomId);
			messageDAO.insertMessage(message);
			//메세지-펫시터
			String title2 = "[알람] 예약 승인 확인";
			StringBuilder content2 = new StringBuilder(" 회원님의 돌보미 글에 예약 요청을 승인하셨습니다.");
			content2.append(" 예약목록을 통해 내역을 확인하실 수 있습니다. 요청하신 회원님께서 결제하시면 거래가 성사됩니다.");
			content2.append( "결제가 완료되어야 거래가 완료됩니다. 감사합니다.");
			MessageVO message2 = new MessageVO();
			message2.setTitle(title2);
			message2.setContent(content2.toString());
			message2.setId(petsitterId);
			messageDAO.insertMessage(message2);
		}
	}
	
}
