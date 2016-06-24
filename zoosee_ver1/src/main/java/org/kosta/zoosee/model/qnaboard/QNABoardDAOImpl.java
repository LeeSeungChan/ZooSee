package org.kosta.zoosee.model.qnaboard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.QNABoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QNABoardDAOImpl implements QNABoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public int registerQNA(QNABoardVO qnaboardVO) {
		return template.insert("qna.registerQuestion", qnaboardVO);
	}

	@Override
	public List<QNABoardVO> findByIdQNA(HashMap<String, String> map) {
		return template.selectList("qna.findByIdQNA", map);
	}

	@Override
	public QNABoardVO getContent(int boardNo) {
		return template.selectOne("qna.getContent", boardNo);
	}

	@Override
	public int updateQNA(QNABoardVO qnaboardVO) {
		return template.update("qna.updateQNA", qnaboardVO);
	}

	@Override
	public void deleteQNA(int boardNo) {
		template.delete("qna.deleteQNA", boardNo);
	}

	@Override
	public List<QNABoardVO> getQuestionList(int pageNo) {
		return template.selectList("qna.getQuestionList", pageNo);
	}

	@Override
	public int updateAnswer(QNABoardVO qnaBoardVO) {
		return template.update("qna.updateAnswer", qnaBoardVO);
	}

	@Override
	public List<QNABoardVO> nonAnswerList(int pageNo) {
		return template.selectList("qna.nonAnswerList", pageNo);
	}

	@Override
	public int getTotalQnaCountById(String id) {
		return template.selectOne("qna.getTotalQnaCountById", id);
	}

	@Override
	public int getAllQuestionCount() {
		return template.selectOne("qna.getAllQuestionCount");
	}

	@Override
	public int getnonAnswerQuestionCount() {
		return template.selectOne("qna.getnonAnswerQuestionCount");
	}

	@Override
	public List<QNABoardVO> findByIdQnaList(HashMap<String, String> map) {
		return template.selectList("qna.findByIdQnaList", map);
	}

}
