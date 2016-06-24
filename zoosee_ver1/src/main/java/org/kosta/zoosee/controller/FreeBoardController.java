package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.freeboard.FreeBoardService;
import org.kosta.zoosee.model.freeboard.ListVO;
import org.kosta.zoosee.model.vo.FreeBoardReplyVO;
import org.kosta.zoosee.model.vo.FreeBoardVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeBoardController {
	@Resource
	private FreeBoardService freeBoardService;
	
	//자유게시판 리스트 가져오기
	@RequestMapping("interceptor_freeBoard_list.do")
	public ModelAndView getFreeBoardList(String pageNo){
		ListVO listVO=freeBoardService.getFreeBoardList(pageNo);
		return new ModelAndView("freeBoard_list","listVO",listVO);
	}
	
	//상세보기 조회수 업데이트
	@RequestMapping("interceptor_freeBoard_showFreeBoardContent.do")
	public ModelAndView showFreeBoardContent(int freeBoardNo) {		
		freeBoardService.updateCount(freeBoardNo);	
		return new ModelAndView("redirect:interceptor_freeBoard_showFreeBoardContentNoHit.do?freeBoardNo="+freeBoardNo);
	}
	
	//노히트 상세보기
	@RequestMapping("interceptor_freeBoard_showFreeBoardContentNoHit.do")
	public ModelAndView showFreeBoardContentNoHit(int freeBoardNo){
		
		//게시글 VO
		FreeBoardVO freeBoardVO = freeBoardService.showFreeBoardContentNoHit(freeBoardNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("freeBoard_showcontent");
		mv.addObject("freeBoardVO", freeBoardVO);
		
		//댓글vo List
		List<FreeBoardReplyVO> list = freeBoardService.getReplyList(freeBoardNo);
		mv.addObject("replyList", list);
		return  mv;
	}
	
	//게시물 삭제하기
	@RequestMapping("interceptor_freeBoard_contentDelete.do")
	public String FreeBoardContentDelete(int freeBoardNo){
		freeBoardService.FreeBoardContentDelete(freeBoardNo);
		return "redirect:interceptor_freeBoard_list.do";
	}
	
	//글 등록
	@RequestMapping(value="interceptor_freeBoard_contentWrite.do",method=RequestMethod.POST)
	public ModelAndView FreeBoardWriteContent(HttpServletRequest request, FreeBoardVO freeBoardVO){
		HttpSession session=request.getSession(false);
		if(session!=null){
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			if(mvo!=null){
				freeBoardVO.setMemberVO(mvo);
			}
		}		
		freeBoardService.FreeBoardWriteContent(freeBoardVO);
		return new ModelAndView("redirect:interceptor_freeBoard_list.do");
	}
	
	//게시물 업데이트
	@RequestMapping("interceptor_freeBoard_updateFreeBoard.do")
	public ModelAndView updateFreeBoard(FreeBoardVO freeBoardVO) {
		System.out.println(freeBoardVO);
		freeBoardService.updateFreeBoard(freeBoardVO);
		
		return new ModelAndView("freeBoard_showcontent","freeBoardVO",freeBoardService.showFreeBoardContentNoHit(freeBoardVO.getFreeBoardNo()));
	}
	
	//게시물 view
	@RequestMapping("interceptor_freeBoard_updateView.do")
	public ModelAndView updateView(int freeBoardNo) {
		return new ModelAndView("freeBoard_update","freeBoardVO",freeBoardService.showFreeBoardContentNoHit(freeBoardNo));
	}
	
	//댓글 write
	@RequestMapping("interceptor_freeBoard_writeReply.do")
	public ModelAndView writeReply(FreeBoardReplyVO freeBoardReplyVO){
		freeBoardService.writeReply(freeBoardReplyVO);
		return new ModelAndView("redirect:interceptor_freeBoard_showFreeBoardContent.do?freeBoardNo="+freeBoardReplyVO.getRef());
	}
	
	//대댓글 write
	@RequestMapping("interceptor_freeBoard_writeReply2.do")
	public ModelAndView writeReply2(FreeBoardReplyVO freeBoardReplyVO){
		freeBoardService.writeReply2(freeBoardReplyVO);
		return new ModelAndView("redirect:interceptor_freeBoard_showFreeBoardContent.do?freeBoardNo="+freeBoardReplyVO.getRef());
	}
	
	//댓글 delete
	@RequestMapping("interceptor_freeBoard_deleteReply.do")
	public ModelAndView deleteReply(FreeBoardReplyVO freeBoardReplyVO){
		freeBoardService.deleteReply(freeBoardReplyVO);
		return new ModelAndView("redirect:interceptor_freeBoard_showFreeBoardContent.do?freeBoardNo="+freeBoardReplyVO.getRef());
	}

}
