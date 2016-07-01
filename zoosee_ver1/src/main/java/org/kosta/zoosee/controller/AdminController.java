package org.kosta.zoosee.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.admin.AdminService;
import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	/* 관리자 페이지 - 회원이 등록한 모든 Q&A게시물 보기 */
	@RequestMapping("interceptor_admin_qna_list.do")
	public ModelAndView getQuestionList(HttpServletRequest request){
		ListVO list=new ListVO();
		String when=request.getParameter("when");
		String pageNo=request.getParameter("pageNo");
		ModelAndView mv=new ModelAndView();
		if(when.equals("all")){
			list=adminService.getQuestionList(pageNo);//모든 회원 qna 리스트
		}else if(when.equals("nonAnswer")){
			list=adminService.nonAnswerList(pageNo);//답변이 없는 qna 리스트
		}
		mv.setViewName("admin_qna_list");
		mv.addObject("when", when);
		mv.addObject("listVO",list );
		return mv;
	}
	/* 관리자 페이지 -  회원이 등록한 해당 Q&A게시물 상세보기*/
	@RequestMapping("interceptor_admin_showQuestion.do")
	public ModelAndView showQuestion(int boardNo){
		return new ModelAndView("admin_showQuestion","qnaBoardVO",adminService.showQuestion(boardNo));
	}
	/* 관리자 페이지 -	답변등록하기 */
	@RequestMapping("interceptor_admin_update_answer.do")
	public ModelAndView updateAnswer(QNABoardVO qnaBoardVO){
		adminService.updateAnswer(qnaBoardVO);
		return new ModelAndView("redirect:interceptor_admin_showQuestion.do?boardNo="+qnaBoardVO.getBoardNo());
	}
	/*관리자 페이지 - 아이디로 Q&A 검색하기*/
	@RequestMapping("interceptor_admin_qna_find_view.do")
	public ModelAndView findByIdQNA(HttpServletRequest request){
		String pageNo=request.getParameter("pageNo");
		String id=request.getParameter("id");
		ListVO list=adminService.findByIdQnaList(id,pageNo);
		return new ModelAndView("admin_qna_find_view","listVO",list);
	}
	/*관리자 페이지 - 모든 회원에게 메세지 보내기*/
	@RequestMapping("interceptor_admin_sendMessage.do")
	public ModelAndView sendMessage(MessageVO messageVO,HttpServletRequest request){
		adminService.sendMessage(messageVO);
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		return new ModelAndView("redirect:interceptor_admin_MessageList.do?id="+id);
	}
	/*관리자 페이지 - 보낸 메세지 리스트*/
	@RequestMapping("interceptor_admin_MessageList.do")
	public ModelAndView messageList(HttpServletRequest request,String pageNo,String id){
		if(id==null){
			HttpSession session=request.getSession(false);
			id=((MemberVO)session.getAttribute("mvo")).getId();
		}
		org.kosta.zoosee.model.message.ListVO list=adminService.messageList(id,pageNo);
		return new ModelAndView("admin_message_list","listVO",list);
	}
	/*관리자 페이지 - 펫 맘 리스트*/
	@RequestMapping("interceptor_admin_petmomList.do")
	public ModelAndView  getPetmomList(String pageNo){
		org.kosta.zoosee.model.member.ListVO list=adminService.getPetmomList(pageNo);
		return new ModelAndView("admin_petmomlist","listVO",list);	
	}
}
