package org.kosta.zoosee.model.reserve;

import java.util.List;

import org.kosta.zoosee.model.vo.ReserveVO;

public interface ReserveDAO {

	void reserveRegister(ReserveVO reserveVO);

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

}
