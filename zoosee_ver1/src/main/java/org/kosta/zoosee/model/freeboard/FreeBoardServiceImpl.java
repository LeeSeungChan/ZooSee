package org.kosta.zoosee.model.freeboard;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.FreeBoardReplyVO;
import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Resource
	private FreeBoardDAO freeBoardDAO;

	@Override
	public ListVO getFreeBoardList(String pageNo) {
		if(pageNo==null||pageNo==""){
			pageNo="1";
		}
		int pNo=Integer.parseInt(pageNo);
		List<FreeBoardVO> list=freeBoardDAO.getFreeBoardList(pNo);
		PagingBean pagingBean=new PagingBean(freeBoardDAO.totalContents(),pNo);
		return new ListVO(list,pagingBean);
	}

	@Override
	public FreeBoardVO showFreeBoardContentNoHit(int freeBoardNo) {
		return freeBoardDAO.getFreeBoardContent(freeBoardNo);
	}
	
	@Override
	public void updateCount(int freeBoardNo) {
		freeBoardDAO.updateCount(freeBoardNo);
	}

	@Override
	public void FreeBoardContentDelete(int freeBoardNo) {
		freeBoardDAO.FreeBoardContentDelete(freeBoardNo);
		
	}

	@Override
	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO) {
		freeBoardDAO.FreeBoardWriteContent(freeBoardVO);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO) {
		freeBoardDAO.updateFreeBoard(freeBoardVO);
	}

	@Override
	public void writeReply(FreeBoardReplyVO freeBoardReplyVO) {
		//시퀀스값을 받아와 reply_no와 grp에 넣음
		int reply_no = freeBoardDAO.getFreeBoardReplyNo();
		freeBoardReplyVO.setReply_no(reply_no);
		freeBoardReplyVO.setGrp(reply_no);
		//lvl 초기값을 1로 설정
		freeBoardReplyVO.setLvl(1);
	    freeBoardDAO.writeReply(freeBoardReplyVO);
	}

	@Override
	public List<FreeBoardReplyVO> getReplyList(int freeBoardNo) {
		return freeBoardDAO.getReplyList(freeBoardNo);
	}

	@Override
	public void updateRestep(FreeBoardReplyVO freeBoardReplyVO) {
//		freeBoardDAO.updateRestep(freeBoardReplyVO);
	}

	@Override
	public void writeReply2(FreeBoardReplyVO freeBoardReplyVO) {
		//같은 group 에 속하 댓글의 lvl를 가져와 +1해준다
		int grp = freeBoardReplyVO.getGrp();
		int result = freeBoardDAO.findMaxLvl(grp);
		int lvl = result+1;
		freeBoardReplyVO.setLvl(lvl);
		freeBoardDAO.writeReply2(freeBoardReplyVO);
	}

	@Override
	public void deleteReply(FreeBoardReplyVO freeBoardReplyVO) {
		//같은그룹의 lvl 최대값이 1보다 클경우 대댓글들이 달려있으므로 메세지를 삽입,컨디션 con값을 1로 변경해준다,
		int grp = freeBoardReplyVO.getGrp();
		int lvl = freeBoardDAO.findMaxLvl(grp);
		if(lvl>1){
			freeBoardReplyVO.setContent("삭제된 댓글입니다.");
			freeBoardReplyVO.setCon(1);
			freeBoardDAO.replaceReplyContet(freeBoardReplyVO);
		}else{
			freeBoardDAO.deleteReply(freeBoardReplyVO);
		}
		
	}
	
	
}
