package org.kosta.zoosee.model.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.pet.PetDAO;
import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.qnaboard.QNABoardDAO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource
	private QNABoardDAO qnaBoardDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageDAO messageDAO;
	@Resource
	private MessageService messageService;
	@Resource
	private PetDAO petDAO;

	@Override
	public ListVO getQuestionList(String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		List<QNABoardVO> list = qnaBoardDAO.getQuestionList(Integer
				.parseInt(pageNo));
		int totalContents = qnaBoardDAO.getAllQuestionCount();
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public QNABoardVO showQuestion(int boardNo) {
		return qnaBoardDAO.getContent(boardNo);
	}

	@Override
	public void updateAnswer(QNABoardVO qnaBoardVO) {
		int i = qnaBoardDAO.updateAnswer(qnaBoardVO);
		if (i == 1) {
			messageService.sendMessageOnServer(
					qnaBoardVO.getMemberVO().getId(), 4);
		}
	}

	@Override
	public ListVO nonAnswerList(String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		List<QNABoardVO> list = qnaBoardDAO.nonAnswerList(Integer
				.parseInt(pageNo));
		int totalContents = qnaBoardDAO.getnonAnswerQuestionCount();
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public ListVO findByIdQnaList(String id, String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pageNo", pageNo);
		List<QNABoardVO> list = qnaBoardDAO.findByIdQnaList(map);
		int totalContents = qnaBoardDAO.getTotalQnaCountById(id);
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public void sendMessage(MessageVO messageVO) {
		String title = "[관리자]" + messageVO.getTitle();
		messageVO.setTitle(title);
		List<String> list = memberDAO.allMemberIdList();
		for (int i = 0; i < list.size(); i++) {
			String id = list.get(i);// 아이디
			messageVO.setId(id);
			messageDAO.insertMessage(messageVO);
		}
	}

	@Override
	public org.kosta.zoosee.model.message.ListVO messageList(String id,
			String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pageNo", pageNo);
		List<MessageVO> list = messageDAO.getMessageListAdmin(map);
		int totalContents = messageDAO.getMessageListAdminCount(id);
		org.kosta.zoosee.model.message.PagingBean pagingBean = new org.kosta.zoosee.model.message.PagingBean(
				totalContents, Integer.parseInt(pageNo));
		return new org.kosta.zoosee.model.message.ListVO(list, pagingBean);
	}

	@Override
	public org.kosta.zoosee.model.member.ListVO getPetmomList(String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		List<MemberVO> list = memberDAO.getPetmomList(Integer.parseInt(pageNo));
		int totalContents = memberDAO.getPetmomListCount();
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new org.kosta.zoosee.model.member.ListVO(list, pagingBean);
	}

	@Override
	public MemberVO getPetmomInfo(String id) {
		return memberDAO.getMemberVO(id);
	}

	@Override
	public List<PetVO> getPetListById(String id) {
		return petDAO.petList(id);
	}

	@Override
	public org.kosta.zoosee.model.member.ListVO adminList(String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("rank", "admin");
		map.put("pageNo", pageNo);
		List<MemberVO> list = memberDAO.memberList(map);
		int totalContents=memberDAO.memberListCount("admin");
		PagingBean pagingBean = new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new org.kosta.zoosee.model.member.ListVO(list, pagingBean);
	}

	@Override
	public MemberVO findInfoById(String id) {
		return memberDAO.findInfoById(id);
	}

	@Override
	public List<MemberVO> findInfoByName(String name) {
		return memberDAO.findInfoByName(name);
	}

	@Override
	public int addAdmin(String id) {
		return memberDAO.addAdmin(id);
	}

	@Override
	public int resign(String id) {
		return memberDAO.resign(id);
	}
}
