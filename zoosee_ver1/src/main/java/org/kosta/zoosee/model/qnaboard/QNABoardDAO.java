package org.kosta.zoosee.model.qnaboard;

import java.util.HashMap;
import java.util.List;

import org.kosta.zoosee.model.vo.QNABoardVO;

public interface QNABoardDAO {

	int registerQNA(QNABoardVO qnaboardVO);

	List<QNABoardVO> findByIdQNA(HashMap<String, String> map);

	QNABoardVO getContent(int boardNo);

	int updateQNA(QNABoardVO qnaboardVO);

	void deleteQNA(int boardNo);

	List<QNABoardVO> getQuestionList(int pageNo);

	int updateAnswer(QNABoardVO qnaBoardVO);

	List<QNABoardVO> nonAnswerList(int pageNo);

	int getTotalQnaCountById(String id);

	int getAllQuestionCount();

	int getnonAnswerQuestionCount();

	List<QNABoardVO> findByIdQnaList(HashMap<String, String> map);

}
