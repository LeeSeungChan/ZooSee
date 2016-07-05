package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.MemberVO;

public interface MemberDAO {

	public abstract int registerMember(MemberVO mvo);

	public abstract MemberVO loginMember(MemberVO mvo);

	public abstract int memberIdCheck(String id);

	public abstract int updateMember(MemberVO vo);

	public abstract List<MemberVO> memberList(HashMap<String,String> map);

	public abstract MemberVO getMemberVO(String id);

	public abstract int deleteMember(String id);

	public abstract String findRank(String id);

	public abstract void upgradeRank(HashMap<String, String> map);

	public abstract int memberListCount(String rank);

	public abstract String findIdByPetsitterNo(int petsitterNo);

	public abstract List<String> allMemberIdList();

	public abstract MemberVO findEmailByMemberVO(String email);

	public abstract MemberVO findPasswordByMemberVO(HashMap<String,String> map);

	public abstract void updateMemberPassword(HashMap<String, String> map);

	public abstract List<MemberVO> getPetmomList(int pageNo);

	public abstract int getPetmomListCount();

	public abstract MemberVO findInfoById(String id);

	public abstract List<MemberVO> findInfoByName(String name);

	public abstract int addAdmin(String id);

	public abstract int resign(String id);

}