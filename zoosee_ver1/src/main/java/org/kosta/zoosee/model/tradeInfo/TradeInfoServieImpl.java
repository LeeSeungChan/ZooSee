package org.kosta.zoosee.model.tradeInfo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.board.BoardDAO;
import org.kosta.zoosee.model.calendar.PetCalendarDAO;
import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.pet.PetDAO;
import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.petsitter.PetsitterDAO;
import org.kosta.zoosee.model.reserve.ReserveDAO;
import org.kosta.zoosee.model.reserve.ReserveService;
import org.kosta.zoosee.model.vo.MemberVO;
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
	@Resource
	private MessageService messageService;
	@Resource
	private PetService petService;
	@Resource
	private ReserveService reserveService;
	

	@Override
	public void registerTradeInfo(TradeInfoVO tradeInfoVO, int reserve_no, String petmomId, String petsitterId) {
 		MemberVO memberVO = memberDAO.getMemberVO(petmomId); // id로 펫맘 MemberVO 정보 받아오기
 		tradeInfoVO.setMemberVO(memberVO);

 		PetsitterVO petsitterVO = petsitterDAO.findPetsitterById(petsitterId); // petsitterId로 펫시터 정보 받아오기
 		tradeInfoVO.setPetsitterVO(petsitterVO);

 		PetsitterboardVO petsitterboardVO = boardDAO.getBoardVOByPetsitterId(petsitterId); // petsitterId로 펫보드 정보 받아오기
 		petsitterboardVO.setPetsitterVO(petsitterVO);

 		List<PetVO> petVOList = petDAO.getPetVOList(petmomId);
 		PetVO petVO = petVOList.get(0); // 펫맘 id로 펫정보 받아오기
 		petVO.setMemberVO(memberVO);
 		List<Integer> petNolist = petService.getPetNo(memberVO.getId());
		ReserveVO reserveVO = reserveService.getReserveVO(reserve_no,petNolist.get(0));
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

		if (i == 1) {
			//메세지-예약자(펫맘)
			messageService.sendMessageOnServer(petmomId, 13);
			//메세지-펫시터
			messageService.sendMessageOnServer(petsitterId, 14);
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
