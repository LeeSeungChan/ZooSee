package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.ReserveVO;

public interface MemberService {

	public abstract void registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

	public abstract String updateMember(MemberVO vo);

	public abstract MemberVO getMemberVO(String id);

	public abstract String deleteMember(String id);

	public abstract ListVO memberList(String rank, String pageNo);

	public abstract String findIdByPetsitterNo(int petsitterNo);

	public abstract MemberVO findEmailByMemberVO(String email);

	public abstract MemberVO findPasswordByMemberVO(String id, String email);

	public abstract void updateMemberPassword(int password);

	public abstract HashMap<String, List<ReserveVO>> showReserveList(
			List<ReserveVO> reserveList);

}