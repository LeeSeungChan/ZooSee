package org.kosta.zoosee.model.reserve;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.ReserveVO;

public interface ReserveDAO {

	int reserveRegister(ReserveVO reserveVO);

	// 2016.07.06
	// petNo 같이 넘겨줌
	ReserveVO getReserveVO(HashMap<String,Integer> map);
	
	// petNo 없이 함.
	ReserveVO getReserveVO(int reserve_no);

	int reserveCancle(int re_no);

	void updateReserveRecog(int i);

	List<ReserveVO> showPetMomReserveList(String id);

	List<ReserveVO> showPetsitterReserveList(String id);

	ReserveVO getReserveVOById(String id);

	ReserveVO getReserveVOByPetsitterId(String id);

	int getReserveRecog(String id);

	int getReserveIdCheck(String id);

	List<ReserveVO> showPetMasterReserveList(String id);
	
	ReserveVO popupPayment(int reserve_no);

	
}
