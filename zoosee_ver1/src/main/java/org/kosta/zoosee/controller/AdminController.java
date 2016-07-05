package org.kosta.zoosee.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.admin.AdminService;
import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.qnaboard.ListVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.QNABoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	@Resource
	private PetsitterService petsitterService;
	@Resource
	private MemberService memberService;

	/* 관리자 페이지 - 회원이 등록한 모든 Q&A게시물 보기 */
	@RequestMapping("interceptor_admin_qna_list.do")
	public ModelAndView getQuestionList(HttpServletRequest request) {
		ListVO list = new ListVO();
		String when = request.getParameter("when");
		String pageNo = request.getParameter("pageNo");
		ModelAndView mv = new ModelAndView();
		if (when.equals("all")) {
			list = adminService.getQuestionList(pageNo);// 모든 회원 qna 리스트
		} else if (when.equals("nonAnswer")) {
			list = adminService.nonAnswerList(pageNo);// 답변이 없는 qna 리스트
		}
		mv.setViewName("admin_qna_list");
		mv.addObject("when", when);
		mv.addObject("listVO", list);
		return mv;
	}

	/* 관리자 페이지 - 회원이 등록한 해당 Q&A게시물 상세보기 */
	@RequestMapping("interceptor_admin_showQuestion.do")
	public ModelAndView showQuestion(int boardNo) {
		return new ModelAndView("admin_showQuestion", "qnaBoardVO",
				adminService.showQuestion(boardNo));
	}

	/* 관리자 페이지 - 답변등록하기 */
	@RequestMapping("interceptor_admin_update_answer.do")
	public ModelAndView updateAnswer(QNABoardVO qnaBoardVO) {
		adminService.updateAnswer(qnaBoardVO);
		return new ModelAndView(
				"redirect:interceptor_admin_showQuestion.do?boardNo="
						+ qnaBoardVO.getBoardNo());
	}

	/* 관리자 페이지 - 아이디로 Q&A 검색하기 */
	@RequestMapping("interceptor_admin_qna_find_view.do")
	public ModelAndView findByIdQNA(HttpServletRequest request) {
		String pageNo = request.getParameter("pageNo");
		String id = request.getParameter("id");
		ListVO list = adminService.findByIdQnaList(id, pageNo);
		return new ModelAndView("admin_qna_find_view", "listVO", list);
	}

	/* 관리자 페이지 - 모든 회원에게 메세지 보내기 */
	@RequestMapping("interceptor_admin_sendMessage.do")
	public ModelAndView sendMessage(MessageVO messageVO,
			HttpServletRequest request) {
		adminService.sendMessage(messageVO);
		HttpSession session = request.getSession(false);
		String id = ((MemberVO) session.getAttribute("mvo")).getId();
		return new ModelAndView("redirect:interceptor_admin_MessageList.do?id="
				+ id);
	}

	/* 관리자 페이지 - 보낸 메세지 리스트 */
	@RequestMapping("interceptor_admin_MessageList.do")
	public ModelAndView messageList(HttpServletRequest request, String pageNo,
			String id) {
		if (id == null) {
			HttpSession session = request.getSession(false);
			id = ((MemberVO) session.getAttribute("mvo")).getId();
		}
		org.kosta.zoosee.model.message.ListVO list = adminService.messageList(
				id, pageNo);
		return new ModelAndView("admin_message_list", "listVO", list);
	}

	/* 관리자 페이지 - 펫 맘 리스트 */
	@RequestMapping("interceptor_admin_petmomList.do")
	public ModelAndView getPetmomList(String pageNo) {
		org.kosta.zoosee.model.member.ListVO list = adminService
				.getPetmomList(pageNo);
		return new ModelAndView("admin_petmomlist", "listVO", list);
	}

	/* 관리자 페이지 -펫맘 정보 */
	@RequestMapping("interceptor_admin_getPetmomInfo.do")
	public ModelAndView getPetmomInfo(String id) {
		MemberVO memberVO = adminService.getPetmomInfo(id);
		List<PetVO> list = adminService.getPetListById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberVO", memberVO);
		mv.addObject("petList", list);
		mv.setViewName("admin_petmomInfo");
		return mv;
	}

	/* 관리자 페이지 - 펫시터정보보기 */
	@RequestMapping("interceptor_admin_getPetsitterVO.do")
	public ModelAndView getPetsitterVO(int petsitterNo, String value) {
		PetsitterVO pvo = petsitterService.getPetsitterVO(petsitterNo);
		ModelAndView mv = new ModelAndView("admin_petsitterInfo");
		mv.addObject("pvo", pvo);
		mv.addObject("value", value);
		return mv;
	}

	/* 관리자 페이지 - 펫시터 리스트 */
	@RequestMapping("interceptor_admin_petsitterList.do")
	public ModelAndView petsitterList(String value, HttpServletRequest request) {
		String pageNo = request.getParameter("pageNo");
		ModelAndView mv = new ModelAndView();
		org.kosta.zoosee.model.petsitter.ListVO list = new org.kosta.zoosee.model.petsitter.ListVO();
		if (value.equals("recog")) {// value -> recog 이면 펫시터 리스트
			list = petsitterService.petsitterList(value, pageNo);
			mv.setViewName("admin_petsitterlist");
		} else {// value -> nonrecog 이면 펫시터 대기자 리스트
			list = petsitterService.petsitterList(value, pageNo);
			mv.setViewName("admin_petsitterwaitinglist");
		}
		mv.addObject("listVO", list);
		return mv;
	}

	/* 관리자 페이지 - 멤버 리스트 */
	@RequestMapping("interceptor_admin_memberlist.do")
	public ModelAndView memberList(String rank, HttpServletRequest requestion) {
		String pageNo = requestion.getParameter("pageNo");
		org.kosta.zoosee.model.member.ListVO list = memberService.memberList(
				rank, pageNo);
		return new ModelAndView("admin_memberlist", "listVO", list);
	}

	/* 관리자 페이지 - 멤버 추방 */
	@RequestMapping(value = "interceptor_admin_delete.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteMember(String id) {
		memberService.deleteMember(id);
	}

	/* 관리자 페이지 - 멤버정보보기 */
	@RequestMapping("interceptor_admin_getMemberVO.do")
	public ModelAndView getMemberVO(String id) {
		return new ModelAndView("admin_memberInfo", "memberVO",
				memberService.getMemberVO(id));
	}

	/* 관리자 페이지 - 펫시터 추방 */
	@RequestMapping(value = "interceptor_admin_deletePetsitter.do", method = RequestMethod.POST)
	@ResponseBody
	public void deletePetsitter(String id) {
		petsitterService.deletePetsitter(id);
	}

	/* 관리자 페이지 - 펫시터 인증 */
	@RequestMapping(value = "interceptor_admin_recognitionPetsitter.do", method = RequestMethod.POST)
	@ResponseBody
	public void recognitionPetsitter(int petsitterNo) {

		String id = memberService.findIdByPetsitterNo(petsitterNo);

		petsitterService.recognitionPetsitter(petsitterNo, id);
	}

	/* 관리자 페이지 - 직원 관리 */
	@RequestMapping("interceptor_admin_adminList.do")
	public ModelAndView adminList(String pageNo) {
		org.kosta.zoosee.model.member.ListVO list = adminService
				.adminList(pageNo);
		return new ModelAndView("admin_adminList", "listVO", list);
	}
	/* 관리자 페이지 - 관리자 권한 부여*/
	@RequestMapping("interceptor_admin_findInfoByValue.do")
	public ModelAndView findInfoByValue(String value,String how){
		ModelAndView mv=new ModelAndView();
		mv.addObject("how",how);
		System.out.println(how);
		mv.setViewName("admin_adminManage");
		if(how.equals("id")){
			MemberVO memberVO=adminService.findInfoById(value);
			System.out.println(memberVO);
			mv.addObject("memberVO",memberVO);
		}else if(how.equals("name")){
			List<MemberVO> list=adminService.findInfoByName(value);
			System.out.println(list);
			mv.addObject("list",list);
		}
		return mv;
	}
	@RequestMapping(value="interceptor_admin_addAdmin.do",method=RequestMethod.POST)
	@ResponseBody
	public String addAdmin(String id){
		String result="ok";
		int i=adminService.addAdmin(id);
		if(i==0){
			result="fail";
		}
		return result;
	}
	@RequestMapping(value="interceptor_admin_resign.do",method=RequestMethod.POST)
	@ResponseBody
	public String resign(String id){
		String result="ok";
		int i=adminService.resign(id);
		if(i==0){
			result="fail";
		}
		return result;
	}
}
