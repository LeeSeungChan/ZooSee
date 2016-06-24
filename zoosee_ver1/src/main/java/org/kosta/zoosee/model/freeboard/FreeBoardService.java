package org.kosta.zoosee.model.freeboard;

import java.util.List;

import org.kosta.zoosee.model.vo.FreeBoardReplyVO;
import org.kosta.zoosee.model.vo.FreeBoardVO;

public interface FreeBoardService {

	public ListVO getFreeBoardList(String pageNo);

	public FreeBoardVO showFreeBoardContentNoHit(int freeBoardNo);

	public void updateCount(int freeBoardNo);

	public void FreeBoardContentDelete(int freeBoardNo);

	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO);

	public void updateFreeBoard(FreeBoardVO freeBoardVO);

	public void writeReply(FreeBoardReplyVO freeBoardReplyVO);

	public List<FreeBoardReplyVO> getReplyList(int freeBoardNo);

	public void updateRestep(FreeBoardReplyVO freeBoardReplyVO);

	public void writeReply2(FreeBoardReplyVO freeBoardReplyVO);
	
	public void deleteReply(FreeBoardReplyVO freeBoardReplyVO);

}
