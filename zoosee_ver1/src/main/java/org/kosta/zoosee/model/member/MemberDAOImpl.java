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
	public List<MemberVO> memberList(String rank) {
		return template.selectList("member.memberList",rank);
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
}
