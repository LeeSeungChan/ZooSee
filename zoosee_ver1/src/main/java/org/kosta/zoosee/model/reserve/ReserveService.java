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

	ReserveVO getReserveVO(int reserve_no);

	List<PetCalendarVO> getReserveDate(int reserve_no);

	int reserveCancle(int re_no);

	List<ReserveVO> showMyReserveList(MemberVO memberVO, String petMasterSignal);

	MemberVO showPetmomDetail(String id);

	PetVO getPetDetail(int petNo);

	PetsitterboardVO getBoardVOByPetsitterId(String id);

	ReserveVO getReserveVOById(String id, String rank);

	int getReserveRecog(String id);

	void updateReserveRecog(int reserve_no);

	int getReserveIdCheck(String id);
}
 