package org.kosta.zoosee.model.admin;

import java.util.List;

import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.QNABoardVO;

public interface AdminService {

	ListVO getQuestionList(String pageNo);

	QNABoardVO showQuestion(int boardNo);

	void updateAnswer(QNABoardVO qnaBoardVO);

	ListVO nonAnswerList(String pageNo);

	ListVO findByIdQnaList(String id, String pageNo);

	void sendMessage(MessageVO messageVO);

	org.kosta.zoosee.model.message.ListVO messageList(String id, String pageNo);

	org.kosta.zoosee.model.member.ListVO getPetmomList(String pageNo);

	MemberVO getPetmomInfo(String id);

	List<PetVO> getPetListById(String id);

}
