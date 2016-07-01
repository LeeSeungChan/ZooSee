package org.kosta.zoosee.model.admin;

import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.vo.MessageVO;
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

}
