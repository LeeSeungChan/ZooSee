package org.kosta.zoosee.model.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.qnaboard.QNABoardDAO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private QNABoardDAO qnaBoardDAO;
	
	@Resource
	private MessageDAO messageDAO;

	@Override
	public ListVO getQuestionList(String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		List<QNABoardVO> list=qnaBoardDAO.getQuestionList(Integer.parseInt(pageNo));
		int totalContents=qnaBoardDAO.getAllQuestionCount();
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public QNABoardVO showQuestion(int boardNo) {
		return qnaBoardDAO.getContent(boardNo);
	}

	@Override
	public void updateAnswer(QNABoardVO qnaBoardVO) {
		int i=qnaBoardDAO.updateAnswer(qnaBoardVO);
		if(i==1){
			String title="[알람] Q&A 답변 등록";
			StringBuilder content=new StringBuilder(" 귀하가 등록하신 1:1 질문에 답변이 등록되었습니다.");
			content.append("이용해 주셔서 감사합니다.");
			MessageVO message=new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(qnaBoardVO.getMemberVO().getId());
			messageDAO.insertMessage(message);
		}
	}

	@Override
	public ListVO nonAnswerList(String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		List<QNABoardVO> list=qnaBoardDAO.nonAnswerList(Integer.parseInt(pageNo));
		int totalContents=qnaBoardDAO.getnonAnswerQuestionCount();
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public ListVO findByIdQnaList(String id,String pageNo) {
		if(pageNo==null){
			pageNo="1";
		}
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("id", id);
		map.put("pageNo", pageNo);
		List<QNABoardVO> list=qnaBoardDAO.findByIdQnaList(map);
		int totalContents=qnaBoardDAO.getTotalQnaCountById(id);
		PagingBean pagingBean=new PagingBean(totalContents, Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}
	
}
