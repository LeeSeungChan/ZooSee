package org.kosta.zoosee.model.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.ReserveVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageDAO messageDAO;
	@Resource
	private MessageService messageService;
	
	
	@Override
	public void registerMember(MemberVO mvo){
		// 메서드를 이용해서 등급 체크 및 업데이트
		mvo.setRank("normal");
		int i=memberDAO.registerMember(mvo);
		if(i==1){
			messageService.sendMessageOnServer(mvo.getId(),1);
		}
	}

	@Override
	public MemberVO loginMember(MemberVO mvo) {
		return memberDAO.loginMember(mvo);
	}
	@Override
	public int memberIdCheck(String id) {
		return memberDAO.memberIdCheck(id);
	}
	@Override
	public String updateMember(MemberVO vo) {
		int i=memberDAO.updateMember(vo);
		String message="ok";
		if(i==0){
			message="fail";
		}
		return message;
	}

	@Override
	public ListVO memberList(String rank,String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("rank", rank);
		map.put("pageNo", pageNo);
		List<MemberVO> list =memberDAO.memberList(map);
		int totalContents=memberDAO.memberListCount(rank);
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public MemberVO getMemberVO(String id) {
		return memberDAO.getMemberVO(id);
	}

	@Override
	public String deleteMember(String id) {
		int i=memberDAO.deleteMember(id);
		String result="ok";
		if(i==0){
			result="fail";
		}
		return result;
	}

	@Override
	public String findIdByPetsitterNo(int petsitterNo) {
		return memberDAO.findIdByPetsitterNo(petsitterNo);
	}
	
	// 아이디 찾기
	@Override
	public MemberVO findEmailByMemberVO(String email) {
		return memberDAO.findEmailByMemberVO(email);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO findPasswordByMemberVO(String id, String email) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("email",email);
		return memberDAO.findPasswordByMemberVO(map);
	}

	// 임시 비밀번호를 update
	@Override
	public void updateMemberPassword(int password) {
		memberDAO.updateMemberPassword(password);
	}
	
	@Override
	public HashMap<String, List<ReserveVO>> showReserveList(List<ReserveVO> reserveList) {
		HashMap<String, List<ReserveVO>> map = new HashMap<String, List<ReserveVO>>();
		
		// 예약 신청(reserve_recog=0)인 리스트 뽑기
		List<ReserveVO> reserveRequestList = new ArrayList<ReserveVO>();
		for (int i = 0; i < reserveList.size(); i++) {
			if (reserveList.get(i).getReserve_recog() == 0) {
				reserveRequestList.add(reserveList.get(i));
			}
		}
		// 예약 완료(reserve_recog=1)인 리스트 뽑기
		List<ReserveVO> reserveCompleteList = new ArrayList<ReserveVO>();
		for (int i = 0; i < reserveList.size(); i++) {
			if (reserveList.get(i).getReserve_recog() == 1) {
				reserveCompleteList.add(reserveList.get(i));
			}
		}
		// 거래 중(reserve_recog=2)인 리스트 뽑기
		List<ReserveVO> reserveDealList = new ArrayList<ReserveVO>();
		for (int i = 0; i < reserveList.size(); i++) {
			if (reserveList.get(i).getReserve_recog() == 2) {
				reserveDealList.add(reserveList.get(i));
			}
		}
		
		map.put("reserveRequestList", reserveRequestList);
		map.put("reserveCompleteList", reserveCompleteList);
		map.put("reserveDealList", reserveDealList);
		return map;
	}
}