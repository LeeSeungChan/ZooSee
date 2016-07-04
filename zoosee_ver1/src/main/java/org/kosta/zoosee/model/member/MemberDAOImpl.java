package org.kosta.zoosee.model.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

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
	@Override
	public int deleteMember(String id) {
		return template.delete("member.deleteMember",id);
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
	public void updateMemberPassword(int password) 
	{
		template.update("member.updateMemberPassword",password);
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
}
