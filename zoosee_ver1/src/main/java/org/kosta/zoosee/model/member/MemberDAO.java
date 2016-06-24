package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberDAO {

	public abstract int registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

	public abstract int updateMember(MemberVO vo);

	public abstract List<MemberVO> memberList(String rank);

	public abstract MemberVO getMemberVO(String id);

	public abstract int deleteMember(String id);

	public abstract String findRank(String id);

	public abstract void upgradeRank(HashMap<String, String> map);

	public abstract int memberListCount(String rank);

}