package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.Authority;
import org.kosta.zoosee.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public int registerMember(MemberVO mvo){
		return template.insert("member.registerMember", mvo);
	}
	@Override
	public MemberVO loginMember(MemberVO mvo) {
		MemberVO m = template.selectOne("member.loginMember", mvo);
		return m;
	}
	@Override
	public int memberIdCheck(String id) {
		return template.selectOne("member.memberIdCheck",id);
	}
	@Override
	public int updateMember(MemberVO vo) {
		return template.update("member.updateMember",vo);
	}
	@Override
	public List<MemberVO> memberList(HashMap<String,String> map) {
		return template.selectList("member.memberList", map);
	}
	@Override
	public MemberVO getMemberVO(String id) {
		return template.selectOne("member.getMemberVO",id);
	}
	// 2016.07.05
	// delete 에서 update로 변경
	// enabeld 를 0으로
	@Override
	public int deleteMember(String id) {
		return template.update("member.deleteMember",id);
	}
	@Override
	public void upgradeRank(HashMap<String,String> map) {
		template.update("member.upgradeRank",map);
	}
	@Override
	public String findRank(String id) {
		return template.selectOne("member.findRank",id);
	}
	@Override
	public int memberListCount(String rank) {
		return template.selectOne("member.memberListCount",rank);
	}
	@Override
	public String findIdByPetsitterNo(int petsitterNo) {
		return template.selectOne("member.findIdByPetsitterNo",petsitterNo);
	}
	@Override
	public List<String> allMemberIdList() {
		return template.selectList("member.allMemberIdList");
	}
	@Override
	public MemberVO findEmailByMemberVO(String email) 
	{
		return template.selectOne("member.findEmailByMemberVO",email);
	}
	@Override
	public MemberVO findPasswordByMemberVO(HashMap<String,String> map) 
	{
		return template.selectOne("member.findPasswordByMemberVO",map);
	}
	@Override
	public void updateMemberPassword(HashMap<String, String> map) 
	{
		template.update("member.updateMemberPassword",map);
	}
	@Override
	public List<MemberVO> getPetmomList(int pageNo) {
		return template.selectList("member.getPetmomList",pageNo);
	}
	@Override
	public int getPetmomListCount() {
		return template.selectOne("member.getPetmomListCount");
	}
	@Override
	public MemberVO findInfoById(String id) {
		return template.selectOne("member.findInfoById",id);
	}
	@Override
	public List<MemberVO> findInfoByName(String name) {
		return template.selectList("member.findInfoByName",name);
	}
	@Override
	public int addAdmin(String id) {
		return template.update("member.addAdmin",id);
	}
	@Override
	public int resign(String id){
		return template.delete("member.resign",id);
	}
	/*
	 * 2016.07.03 추가 부분
	 * selectAuthorityByUsername(String id) 
	 * registerAuthorities(String id)
	 * 
	 */
	// 권한을 갖고 있는 멤버의 List
	@Override
	public List<Authority> selectAuthorityByUsername(String id) 
	{
		return template.selectList("member.selectAuthorityByUsername",id);
	}
	// 권한 insert 
	@Override
	public void registerAuthorities(HashMap<String,String> map)
	{
		template.insert("member.registerAuthorities",map);
	}
	// 권한 update 
	@Override
	public int updateAuthoties(HashMap<String, String> map) 
	{
		int i = template.update("member.updateAuthoties", map);
		return i;
	}
}
