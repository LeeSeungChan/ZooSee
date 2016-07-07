package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.qnaboard.QNABoardService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QNABoardController {
	@Resource
	private QNABoardService qnaBoardService;
	/*  로그인 - Q&A 질문 등록	 */
	@RequestMapping("qna_registerQNA.do")
	public ModelAndView registerQNA(HttpServletRequest request,QNABoardVO qnaboardVO ){
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		MemberVO memberVO=new MemberVO();
		memberVO.setId(id);
		qnaboardVO.setMemberVO(memberVO);
		String result=qnaBoardService.registerQNA(qnaboardVO);
		return new ModelAndView("qna_register_result","result",result);
	}
	/* 로그인 - 자신의 Q&A 질문 목록	 */
	@RequestMapping("qna_list.do")
	public ModelAndView getQNAList(HttpServletRequest request){
		String id = ((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		String pageNo=request.getParameter("pageNo");
		ListVO list=qnaBoardService.getQNAList(id,pageNo);
		return new ModelAndView("qna_list","listVO",list);
	}
	/* 로그인 - 자신의 Q&A 질문상세보기	 */
	@RequestMapping("qna_content.do")
	public ModelAndView getContents(int boardNo){
		QNABoardVO qnaboardVO=qnaBoardService.getContent(boardNo);
		return new ModelAndView("qna_content_view","qnaBoardVO",qnaboardVO);
	}
	/* 로그인 - 자신의 Q&A 질문 수정	 */
	@RequestMapping("qna_update.do")
	public ModelAndView getContent(int boardNo){
		QNABoardVO qnaboardVO=qnaBoardService.getContent(boardNo);
		return new ModelAndView("qna_update","qnaBoardVO",qnaboardVO);
	}
	/* 로그인 - 자신의 Q&A 수정 결과	 */
	@RequestMapping("qna_update_result.do")
	public ModelAndView updateQNA(QNABoardVO qnaboardVO){
		String result=qnaBoardService.updateQNA(qnaboardVO);
		return new ModelAndView("qna_update_result","result",result);
	}
	/* 로그인 - 자신의 Q&A 질문 삭제	 */
	@RequestMapping("qna_delete.do")
	public ModelAndView deleteQNA(int boardNo){
		qnaBoardService.deleteQNA(boardNo);
		return new ModelAndView("redirect:qna_list.do");
	}
}
