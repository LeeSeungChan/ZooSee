package org.kosta.zoosee.model.tradeInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.board.BoardDAO;
import org.kosta.zoosee.model.calendar.PetCalendarDAO;
import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.pet.PetDAO;
import org.kosta.zoosee.model.petsitter.PetsitterDAO;
import org.kosta.zoosee.model.reserve.ReserveDAO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.kosta.zoosee.model.vo.TradeInfoVO;
import org.springframework.stereotype.Service;

@Service
public class TradeInfoServieImpl implements TradeInfoServie{
	@Resource
	private TradeInfoDAO tradeInfoDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private PetDAO petDAO;
	@Resource
	private PetsitterDAO petsitterDAO;
	@Resource
	private ReserveDAO reserveDAO;
	@Resource
	private PetCalendarDAO petCalendarDAO;
	@Resource
	private BoardDAO boardDAO;
	@Resource
	private MessageDAO messageDAO;

	@Override
	public void registerTradeInfo(TradeInfoVO tradeInfoVO, int reserve_no, String petmomId, String petsitterId) {
 		MemberVO memberVO = memberDAO.getMemberVO(petmomId); // id로 펫맘 MemberVO 정보 받아오기
 		tradeInfoVO.setMemberVO(memberVO);

 		PetsitterVO petsitterVO = petsitterDAO.findPetsitterById(petsitterId); // petsitterId로 펫시터 정보 받아오기
 		tradeInfoVO.setPetsitterVO(petsitterVO);

 		PetsitterboardVO petsitterboardVO = boardDAO.getBoardVOByPetsitterId(petsitterId); // petsitterId로 펫보드 정보 받아오기
 		petsitterboardVO.setPetsitterVO(petsitterVO);

 		PetVO petVO = petDAO.getPetVO(petmomId); // 펫맘 id로 펫정보 받아오기
 		petVO.setMemberVO(memberVO);

 		ReserveVO reserveVO = reserveDAO.getReserveVO(reserve_no); // reserve_no로 예약정보 받아오기
 		reserveVO.setMemberVO(memberVO);
 		reserveVO.setPetVO(petVO);
 		reserveVO.setPetsitterboardVO(petsitterboardVO);

 		List<PetCalendarVO> petCalendarList = petCalendarDAO.getReserveDate(reserve_no); // reserve_no로 예약 날짜(달력) 정보

 		tradeInfoVO.setTradeSdate(petCalendarList.get(0).getPet_calDate());
 		tradeInfoVO.setTradeEdate(petCalendarList.get(petCalendarList.size()-1).getPet_calDate());
 		tradeInfoVO.setTradePrice(reserveVO.getReserve_price());
 		tradeInfoVO.setPetsitterboardVO(petsitterboardVO);
 		
 		//System.out.println(tradeInfoVO.toString());
 		int i=tradeInfoDAO.registerTradeInfo(tradeInfoVO);
 		
 		// 펫시터가 거래 승낙시 RESERVE의 reserve_recog를 1로 없데이트
 		//System.out.println(reserveVO.getReserve_no());
 		//reserveDAO.updateReserveRecog(reserveVO.getReserve_no());
		if (i == 1) {
			//메세지-예약자(펫맘)
			String title = "[알람] 예약 입금 확인";
			StringBuilder content = new StringBuilder(" 돌보미 예약에 입금하셨습니다.");
			content.append(" 거래가 성사되었습니다. 거래목록을 통해 내역을 확인하실 수 있습니다.");
			content.append(" 이용해주셔서 감사합니다.");
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(petmomId);
			messageDAO.insertMessage(message);
			//메세지-펫시터
			String title2 = "[알람] 펫맘 입금 확인";
			StringBuilder content2 = new StringBuilder(" 예약 입금되셨습니다.");
			content2.append(" 거래가 성사되었습니다. 거래목록을 통해 내역을 확인하실 수 있습니다.");
			content2.append(" 감사합니다.");
			MessageVO message2 = new MessageVO();
			message2.setTitle(title2);
			message2.setContent(content2.toString());
			message2.setId(petsitterId);
			messageDAO.insertMessage(message2);
		}
	}

	@Override
	public List<TradeInfoVO> getTradeMyList(String id) {
		List<TradeInfoVO> list = new ArrayList<TradeInfoVO>();
		MemberVO memberVO = memberDAO.getMemberVO(id);
		String rank = memberVO.getRank();
		
		if(rank.equals("petmom")){
			list = tradeInfoDAO.getTradeVOPetMomList(id);
		}else if(rank.equals("petsitter")){
			list = tradeInfoDAO.getTradeVOPetsitterList(id);
		}else{
			List<TradeInfoVO> list1 = tradeInfoDAO.getTradeVOPetsitterList(id);
			List<TradeInfoVO> list2 = tradeInfoDAO.getTradeVOPetMomList(id);
			List<TradeInfoVO> list3 = new ArrayList<TradeInfoVO>();
			list3.addAll(list1);
			list3.addAll(list2);

			// Collection의 sort를 이용해 tradeInfo_no를 내림차순으로
			Collections.sort(list3, new TradeInfo_No_Desc());

			list = list3;
		}
 		return list;
	}

}
