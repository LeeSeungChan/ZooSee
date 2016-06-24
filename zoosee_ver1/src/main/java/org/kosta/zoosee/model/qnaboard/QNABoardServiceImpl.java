package org.kosta.zoosee.model.qnaboard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Service;
@Service
public class QNABoardServiceImpl implements QNABoardService {
	@Resource
	private QNABoardDAO qnaboardDAO;
	@Override
	public String registerQNA(QNABoardVO qnaboardVO) {
		int i=qnaboardDAO.registerQNA(qnaboardVO);
		String result="ok";
		if(i==0){
			result="fail";
		}
		return result;
	}
	@Override
	public ListVO getQNAList(String id,String pageNo) {	
		if(pageNo==null){
			pageNo="1";
		}
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pageNo",pageNo);
		List<QNABoardVO> list=qnaboardDAO.findByIdQNA(map);
		int totalContents=qnaboardDAO.getTotalQnaCountById(id);
		PagingBean pagingBean =new PagingBean(totalContents, Integer.parseInt(pageNo));
		 return  new ListVO(list, pagingBean);
	}
	@Override
	public QNABoardVO getContent(int boardNo) {
		return qnaboardDAO.getContent(boardNo);
	}
	@Override
	public String updateQNA(QNABoardVO qnaboardVO) {
		int i=qnaboardDAO.updateQNA(qnaboardVO);
		String result="ok";
		if(i==0){
			result="fail";
		}
		return result;
	}
	@Override
	public void deleteQNA(int boardNo) {
		qnaboardDAO.deleteQNA(boardNo);
	}

}
