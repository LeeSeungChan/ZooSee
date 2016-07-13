package org.kosta.zoosee.model.reserve;

import java.util.List;

import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;

public interface ReserveService {

	MemberVO getMemberVO(String id);

	void reserveRegister(ReserveVO reserveVO, PetsitterboardVO petsitterboardVO);

	// 2016.07.06
	// petNo을 같이 넘겨줌
	ReserveVO getReserveVO(int reserve_no, int petNo);
	
	// petNo 를 안넘기고 함?
	ReserveVO getReserveVO(int reserve_no);

	List<PetCalendarVO> getReserveDate(int reserve_no);

	int reserveCancle(int re_no, String petsitterId, String petmomId);

	List<ReserveVO> showMyReserveList(MemberVO memberVO, String petMasterSignal);

	MemberVO showPetmomDetail(String id);

	PetVO getPetDetail(int petNo);

	PetsitterboardVO getBoardVOByPetsitterId(String id);

	ReserveVO getReserveVOById(String id, String rank);

	int getReserveRecog(String id);

	void updateReserveRecog(int reserve_no);

	int getReserveIdCheck(String id,String petsitterId);
	
	ReserveVO popupPayment(int reserve_no);

	void updateReserveRecogImpossible(int reserve_no);
}
 