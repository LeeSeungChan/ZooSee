package org.kosta.zoosee.model.member;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberService {

	public abstract void registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

	public abstract String updateMember(MemberVO vo);

	public abstract MemberVO getMemberVO(String id);

	public abstract String deleteMember(String id);

	public abstract ListVO memberList(String rank, String pageNo);

}