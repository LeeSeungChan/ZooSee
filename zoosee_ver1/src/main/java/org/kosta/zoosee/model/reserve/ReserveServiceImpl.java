package org.kosta.zoosee.model.reserve;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.board.BoardDAO;
import org.kosta.zoosee.model.calendar.PetCalendarDAO;
import org.kosta.zoosee.model.calendar.PetCalendarService;
import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.pet.PetDAO;
import org.kosta.zoosee.model.petsitter.PetsitterDAO;
import org.kosta.zoosee.model.tradeInfo.TradeInfoDAO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetCalendarVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImpl implements ReserveService {
	@Resource
	private ReserveDAO reserveDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private BoardDAO boardDAO;
	@Resource
	private PetDAO petDAO;
	@Resource
	private PetCalendarDAO petCalendarDAO;
	@Resource
	private TradeInfoDAO tradeInfoDAO;
	@Resource
	private PetsitterDAO petsitterDAO;
	@Resource
	private PetCalendarService petCalendarService;
	@Resource
	private MessageDAO messageDAO;
	@Resource
	private MessageService messageService;
	
	@Override
	public MemberVO getMemberVO(String id) {
		return memberDAO.getMemberVO(id);
	}

	@Override
	public void reserveRegister(ReserveVO reserveVO,
			PetsitterboardVO petsitterboardVO) {
		// petsitterboardVO 찾아서 setter 해주기
		PetsitterboardVO petsitterboardVO2 = boardDAO.getboardDetail(petsitterboardVO.getPetsitterboard_no());
		reserveVO.setPetsitterboardVO(petsitterboardVO2);

		// PetVO 가져오기 /* !! PetDAOImpl, pet.xml에 각각 추가 수정 */
		// 2016.07.06
		// PetVO 를 id로만 찾으려면 여러개 나와서
		// List 로 받고 0번째 PetVO를 set 해줌
		List<PetVO> petVOList = petDAO.getPetVOList(reserveVO.getMemberVO().getId());
		PetVO petVO = petVOList.get(0);
		reserveVO.setPetVO(petVO);

		// reserveVO에 reserve_recog=0으로 초기화
		reserveVO.setReserve_recog(0);

		int i = reserveDAO.reserveRegister(reserveVO);
		if (i == 1) {
			String petsitterId = reserveVO.getPetsitterboardVO().getPetsitterVO().getMemberVO().getId();
			// 달력에 삽입준다.
			petCalendarService.registerCalendar(reserveVO,reserveVO.getReserve_no(), petsitterboardVO, petsitterId);
			//메세지-예약자(펫맘)
			String petmomId=reserveVO.getMemberVO().getId();
			messageService.sendMessageOnServer(petmomId, 9);
			//메세지-펫시터
			messageService.sendMessageOnServer(petsitterId,10);
		}
	}

	@Override
	public ReserveVO getReserveVO(int reserve_no, int petNo) 
	{
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("reserve_no",reserve_no);
		map.put("petNo", petNo);
		return reserveDAO.getReserveVO(map);
	}

	@Override
	public List<PetCalendarVO> getReserveDate(int reserve_no) {
		return petCalendarDAO.getReserveDate(reserve_no);
	}

	// 예약 거절시 삭제하는
	@Override
	public int reserveCancle(int reserve_no, String petsitterId, String petmomId) {
		int check1 = petCalendarDAO.deleteCanlendar(reserve_no);
		int check2 = reserveDAO.reserveCancle(reserve_no);

		if (check1 == 0 || check2 == 0) {
			return 0;
		} else {
			//메세지-예약자(펫맘)
			messageService.sendMessageOnServer(petmomId, 11);
			//메세지-펫시터
			messageService.sendMessageOnServer(petsitterId, 12);
			return 1;
		}
	}

	// 2016.07.06
	// id로 예약 리스트 조회
	@Override
	public List<ReserveVO> showMyReserveList(MemberVO memberVO, String petMasterSignal) {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		String id = memberVO.getId();
		int petVOCount = petDAO.getPetCountById(id);
		PetsitterVO petsitterVO = petsitterDAO.findPetsitterById(id);
		if (petVOCount ==0) {
			// 완전 PETSITTER
			// petmomId
			list = reserveDAO.showPetsitterReserveList(id);
		} else if (petsitterVO == null) {
			// 완전 PETMOM
			// petsitterId
			list = reserveDAO.showPetMomReserveList(id);
		} else {
			// PetMaster 중에서 변수가 1이면 맘 and 0이면 시터 입장
			if (petMasterSignal.equals("1")) {
				list = reserveDAO.showPetMomReserveList(id);
			}else if(petMasterSignal.equals("0")){
				list = reserveDAO.showPetsitterReserveList(id);
			}else if(petMasterSignal.equals("2")){
				// list 2개 뽑아와서 합치기
				List<ReserveVO> list1 = reserveDAO.showPetMomReserveList(id);
				List<ReserveVO> list2 = reserveDAO.showPetsitterReserveList(id);
				
				if(list1.size() != 0 && list2.size() != 0){
				// 리스트 둘다 존재할 때
					list.addAll(0, list1);
					list.addAll(list.size()-1, list2);
				}else if(list1.size() == 0 && list2.size() != 0){
				// list2만 존재할 때
					list.addAll(0, list2);
				}else if(list1.size() != 0 && list2.size() == 0){
				// list1만 존재할 때
					list.addAll(0, list1);
				}else{
				// 리스트 존재 하지않을 때
					;
				}
			}
		}
		return list;
	}

	@Override
	public MemberVO showPetmomDetail(String id) {
		return memberDAO.getMemberVO(id);
	}

	@Override
	public PetVO getPetDetail(int petNo) {
		return petDAO.petDetail(petNo);
	}

	@Override
	public PetsitterboardVO getBoardVOByPetsitterId(String id) {
		return boardDAO.getBoardVOByPetsitterId(id);
	}

	@Override
	public ReserveVO getReserveVOById(String id, String rank) {
		ReserveVO reserveVO = new ReserveVO();

		if (rank.equals("petmom")) {
			reserveVO = reserveDAO.getReserveVOById(id);
		} else if (rank.equals("petsitter")) {
			reserveVO = reserveDAO.getReserveVOByPetsitterId(id);
		} else if (rank.equals("petmaster")) {

		}

		return reserveVO;
	}

	@Override
	public int getReserveRecog(String id) {
		return reserveDAO.getReserveRecog(id);
	}

	@Override
	// 펫시터가 승인시 recog 1로 올려주는
	public void updateReserveRecog(int reserve_no) {
		reserveDAO.updateReserveRecog(reserve_no);
	}

	@Override
	public int getReserveIdCheck(String id) {
		return reserveDAO.getReserveIdCheck(id);
	}
	
	@Override
	public ReserveVO popupPayment(int reserve_no) {
		return reserveDAO.popupPayment(reserve_no);
	}

	@Override
	public ReserveVO getReserveVO(int reserve_no) 
	{
		return reserveDAO.getReserveVO(reserve_no);
	}
}
