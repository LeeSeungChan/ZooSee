package org.kosta.zoosee.model.freeboard;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.FreeBoardReplyVO;
import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<FreeBoardVO> getFreeBoardList(int pageNo) {
		return template.selectList("freeboard.getFreeBoardList",pageNo);
	}

	@Override
	public FreeBoardVO getFreeBoardContent(int freeBoardNo) {
		return template.selectOne("freeboard.getFreeBoardContent",freeBoardNo);
	}

	@Override
	public void updateCount(int freeBoardNo) {
		template.update("freeboard.updateCount",freeBoardNo);
	}

	@Override
	public void FreeBoardContentDelete(int freeBoardNo) {
		template.update("freeboard.FreeBoardContentDelete",freeBoardNo);
		
	}

	@Override
	public void FreeBoardWriteContent(FreeBoardVO freeBoardVO) {
		template.insert("freeboard.FreeBoardWriteContent",freeBoardVO);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO) {
		template.update("freeboard.updateFreeBoard",freeBoardVO);
	}
	
	@Override
	public int totalContents() {
		return template.selectOne("freeboard.totalContents");
	}

	@Override
	public int getFreeBoardReplyNo() {
		return template.selectOne("freeboard.getFreeBoardReplyNo");
	}
	
	@Override
	public void writeReply(FreeBoardReplyVO freeBoardReplyVO) {
		template.insert("freeboard.writeReply",freeBoardReplyVO);
	}

	@Override
	public List<FreeBoardReplyVO> getReplyList(int freeBoardNo) {
		return template.selectList("freeboard.getReplyList",freeBoardNo);
	}

	@Override
	public void updateRestep(FreeBoardReplyVO freeBoardReplyVO) {
		template.update("freeboard.updateRestep",freeBoardReplyVO);
	}

	@Override
	public void writeReply2(FreeBoardReplyVO freeBoardReplyVO) {
		template.insert("freeboard.writeReply2",freeBoardReplyVO);
	}

	@Override
	public int findMaxLvl(int grp) {
		return template.selectOne("freeboard.findMaxLvl",grp);
	}

	@Override
	public void replaceReplyContet(FreeBoardReplyVO freeBoardReplyVO) {
		template.update("freeboard.replaceReplyContet",freeBoardReplyVO);
	}

	@Override
	public void deleteReply(FreeBoardReplyVO freeBoardReplyVO) {
		template.delete("freeboard.deleteReply",freeBoardReplyVO);
	}

	
	
}
