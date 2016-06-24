package org.kosta.zoosee.model.member;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageDAO messageDAO;
	
	@Override
	public void registerMember(MemberVO mvo){
		// 메서드를 이용해서 등급 체크 및 업데이트
		mvo.setRank("normal");
		int i=memberDAO.registerMember(mvo);
		if(i==1){
			String title="[알람] 회원가입";
			StringBuilder content=new StringBuilder(" 저희 ZOOSEE에 가입하여주심을 감사합니다.");
			content.append("반려동물의 임시보호 중개 서비스는 인증된 돌보미를 중개해드립니다.");
			content.append("안심하시고 이용하세요. 감사합니다.");
			MessageVO message=new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(mvo.getId());
			messageDAO.insertMessage(message);
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
}