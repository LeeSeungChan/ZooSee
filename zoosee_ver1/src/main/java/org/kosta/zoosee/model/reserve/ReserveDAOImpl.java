package org.kosta.zoosee.model.reserve;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.ReserveVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDAOImpl implements ReserveDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int reserveRegister(ReserveVO reserveVO) {
		return template.insert("reserve.reserveRegister", reserveVO);
	}
	
	// 2016.07.06
	// 펫맘 예약 VO
	@Override
	public ReserveVO getReserveVO(HashMap<String,Integer> map) {
 		return template.selectOne("reserve.getReserveVO", map);
	}
	
	// 2016.07.06
	// 펫시터 예약 VO
	@Override
	public ReserveVO getReserveVO(int reserve_no) 
	{
		return template.selectOne("reserve.getReserveVOPetsitter",reserve_no);
	}

	// 예약 취소 시 테이블에서 delete
	@Override
	public int reserveCancle(int reserve_no) {
		return template.delete("reserve.deleteReserve", reserve_no);
	}

	// 펫시터가 거래 승낙시 RESERVE의 reserve_recog를 1로 없데이트
	@Override
	public void updateReserveRecog(int reserve_no) {
 		 template.update("reserve.updateReserveRecog", reserve_no);
	}

	// PetMom id로 reserveList 찾기
	@Override
	public List<ReserveVO> showPetMomReserveList(String id) {
		return template.selectList("reserve.showPetMomReserveList", id);
	}
	// Petsitter id로 reserveList 찾기
	@Override
	public List<ReserveVO> showPetsitterReserveList(String id) {
 		return template.selectList("reserve.showPetsitterReserveList", id);
	}
	// petmaster id로 reserveList 찾기
	@Override
	public List<ReserveVO> showPetMasterReserveList(String id) {
		return template.selectList("reserve.showPetMasterReserveList", id);
	}
		
	// PetMom id로 reserve_no찾기
	@Override
	public ReserveVO getReserveVOById(String id) {
 		return template.selectOne("reserve.getReserveVOById", id);
	}
	// Petsitter id로 reserve_no찾기
	@Override
	public ReserveVO getReserveVOByPetsitterId(String id) {
 		return template.selectOne("reserve.getReserveVOByPetsitterId", id);
	}
	
	// id로 reserve_recog 찾기
	@Override
	public int getReserveRecog(String id) {
 		return template.selectOne("reserve.getReserveRecog", id);
	}
	
	// id 로 reserve 테이블에 value값과 resrve테이블에 들어 있는 id랑 맞는지 검사.
	@Override
	public int getReserveIdCheck(String id) {
		return template.selectOne("reserve.getReserveIdCheck",id);
	}
	
	@Override
	public ReserveVO popupPayment(int reserve_no) {
		return template.selectOne("reserve.popupPayment", reserve_no);
	}

	@Override
	public void updateReserveRecogImpossible(int reserve_no) {
		template.update("reserve.updateReserveRecogImpossible", reserve_no);
	}
}
