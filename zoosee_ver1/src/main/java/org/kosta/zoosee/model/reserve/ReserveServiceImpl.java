package org.kosta.zoosee.model.reserve;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.board.BoardDAO;
import org.kosta.zoosee.model.calendar.PetCalendarDAO;
import org.kosta.zoosee.model.calendar.PetCalendarService;
import org.kosta.zoosee.model.member.MemberDAO;
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
public class ReserveServiceImpl implements ReserveService{
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

	@Override
	public MemberVO getMemberVO(String id) {
 		return memberDAO.getMemberVO(id);
	}

	@Override
	public void reserveRegister(ReserveVO reserveVO, PetsitterboardVO petsitterboardVO) {
		// petsitterboardVO 찾아서 setter 해주기
		PetsitterboardVO petsitterboardVO2 = boardDAO.getboardDetail(petsitterboardVO.getPetsitterboard_no());
		reserveVO.setPetsitterboardVO(petsitterboardVO2);
		
		// PetVO 가져오기 /* !! PetDAOImpl, pet.xml에 각각 추가 수정 */
		PetVO petVO = petDAO.getPetVO(reserveVO.getMemberVO().getId());
		reserveVO.setPetVO(petVO);
				
		// reserveVO에 reserve_recog=0으로 초기화
		reserveVO.setReserve_recog(0);
				
		reserveDAO.reserveRegister(reserveVO);
		
		String petsitterId = reserveVO.getPetsitterboardVO().getPetsitterVO().getMemberVO().getId();
		// 달력에 삽입준다.
		petCalendarService.registerCalendar(reserveVO, reserveVO.getReserve_no(), petsitterboardVO, petsitterId);
	}

	@Override
	public ReserveVO getReserveVO(int reserve_no) {
 		return reserveDAO.getReserveVO(reserve_no);
	}

	@Override
	public List<PetCalendarVO> getReserveDate(int reserve_no) {
 		return petCalendarDAO.getReserveDate(reserve_no);
	}

	// 예약 거절시 삭제하는
	@Override
	public int reserveCancle(int reserve_no) {
		int check1 = petCalendarDAO.deleteCanlendar(reserve_no);
		int check2 = reserveDAO.reserveCancle(reserve_no);
		
		if(check1 == 0 || check2 == 0){
			return 0;
		}else{
			return 1;
		}
	}

	@Override
	public List<ReserveVO> showMyReserveList(MemberVO memberVO, String petMasterSignal) {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		String id = memberVO.getId();
		
		PetVO petVO = petDAO.getPetVO(id);
		PetsitterVO petsitterVO = petsitterDAO.findPetsitterById(id);
		
		if(petVO == null){
			// 완전 PETSITTER
			list = reserveDAO.showPetsitterReserveList(id);
		}else if(petsitterVO == null){
			// 완전 PETMOM
			list = reserveDAO.showPetMomReserveList(id);
		}else{
			// PetMaster 중에서 변수가 1이면 맘 and 0이면 시터 입장
			if(petMasterSignal.equals("1")){
				list = reserveDAO.showPetMomReserveList(id);
			}else{
				list = reserveDAO.showPetsitterReserveList(id);
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
		
		if(rank.equals("petmom")){
			reserveVO = reserveDAO.getReserveVOById(id);
		}else if(rank.equals("petsitter")){
			reserveVO = reserveDAO.getReserveVOByPetsitterId(id);
		}else if(rank.equals("petmaster")){
			
		}
		
 		return reserveVO;
	}

	@Override
	public int getReserveRecog(String id) {
 		return reserveDAO.getReserveRecog(id);
	}

	@Override // 펫시터가 승인시 recog 1로 올려주는
	public void updateReserveRecog(int reserve_no) {
		reserveDAO.updateReserveRecog(reserve_no);
	}

	@Override
	public int getReserveIdCheck(String id) {
		return reserveDAO.getReserveIdCheck(id);
	}
}
