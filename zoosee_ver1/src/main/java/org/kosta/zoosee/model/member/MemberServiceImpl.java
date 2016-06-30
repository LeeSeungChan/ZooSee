package org.kosta.zoosee.model.member;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.MemberVO;
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
		List<MemberVO> list =memberDAO.memberList(rank);
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

}