package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.Authority;
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
	
	// 2016.07.05 추가
	// 시큐리티 권한 관련
	// 시큐리티 권한 확인
	public abstract List<Authority> selectAuthorityByUsername(String id);
	// 시큐리티 table Authority insert 부분.
	// ROLE_ 패턴
	// 일반회원 : ROLE_MEMBER
	// 돌보미 : ROLE_PETSITTER
	// 관리자 : ROLE_ADMIN
	// 펫마스터 : ROLE_PETMASTER
	public abstract void registerAuthorities(HashMap<String,String> map);
	// 권한 update
	public abstract int updateAuthoties(HashMap<String, String> map);

}