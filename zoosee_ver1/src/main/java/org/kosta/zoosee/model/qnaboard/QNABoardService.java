package org.kosta.zoosee.model.qnaboard;

import org.kosta.zoosee.model.vo.QNABoardVO;

public interface QNABoardService {

	String registerQNA(QNABoardVO qnaboardVO);

	ListVO getQNAList(String id, String pageNo);

	QNABoardVO getContent(int boardNo);

	String updateQNA(QNABoardVO qnaboardVO);

	void deleteQNA(int boardNo);

}
