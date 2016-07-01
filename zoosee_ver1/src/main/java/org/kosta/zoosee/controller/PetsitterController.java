package org.kosta.zoosee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.board.BoardService;
import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.petsitter.PetsitterService;
import org.kosta.zoosee.model.review.ReviewService;
import org.kosta.zoosee.model.vo.FileVO;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.kosta.zoosee.model.vo.PetsitterboardVO;
import org.kosta.zoosee.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetsitterController {

	@Resource
	private PetsitterService petsitterService;
	@Resource
	private MemberService memberService;
	@Resource
	private BoardService boardService;
	@Resource
	private ReviewService reviewService;

	@Resource(name = "petsitterUploadPath")
	private String uploadPath;

	@RequestMapping("interceptor_petsitter_register.do")
	public ModelAndView petsitterRegisterForm() {
		return new ModelAndView("petsitter_register");
	}

	@RequestMapping("interceptor_petsitter_registerPetsitter.do")
	public ModelAndView registerPetsitter(HttpServletRequest request,
			PetsitterVO petsitterVO, FileVO fileVO) {
		List<MultipartFile> list = fileVO.getFile();
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			String fileName = list.get(i).getOriginalFilename();
			String fileType = list.get(i).getName();
			String filePath = uploadPath + fileName;
			if (!fileName.equals("")) {
				try {
					list.get(i).transferTo(new File(filePath));
					nameList.add(fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			// house_img
			if (fileType.equals("file[0]")) {
				filePath = filePath.substring(filePath.indexOf("upload\\"));
				petsitterVO.setHouseImg(filePath);
			}
			// petsitter_img
			if (fileType.equals("file[1]")) {
				filePath = filePath.substring(filePath.indexOf("upload\\"));
				petsitterVO.setPetsitterImg(filePath);
			}
		}
		MemberVO mvo = (MemberVO) request.getSession(false).getAttribute("mvo");
		petsitterVO.setMemberVO(mvo);
		petsitterService.registerPetsitter(petsitterVO);
		return new ModelAndView("redirect:home.do");
	}

	// 팻시터 정보 수정폼
	@RequestMapping("interceptor_petsitter_updateform.do")
	public ModelAndView petsitter_updateForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(mvo
				.getId());
		return new ModelAndView("petsitter_updateform", "petsitterVO",
				petsitterVO);
	}

	// 팻시터 정보 수정
	@RequestMapping("interceptor_petsitter_update.do")
	public ModelAndView petsitter_update(PetsitterVO petsitterVO,
			FileVO fileVO, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		petsitterVO.setMemberVO(mvo);
		List<MultipartFile> list = fileVO.getFile();
		ArrayList<String> nameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			String fileName = list.get(i).getOriginalFilename();
			String fileType = list.get(i).getName();
			String filePath = uploadPath + fileName;
			if (!fileName.equals("")) {
				try {
					list.get(i).transferTo(new File(filePath));
					nameList.add(fileName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			// house_img
			if (fileType.equals("file[0]")) {
				filePath = filePath.substring(filePath.indexOf("upload\\"));
				petsitterVO.setHouseImg(filePath);
			}
			// petsitter_img
			if (fileType.equals("file[1]")) {
				filePath = filePath.substring(filePath.indexOf("upload\\"));
				petsitterVO.setPetsitterImg(filePath);
			}
		}
		petsitterService.update(petsitterVO);
		return new ModelAndView("redirect:home.do");
	}

	// 팻시터 정보페이지
	@RequestMapping("petsitter_detail.do")
	public ModelAndView petsitterDetailPage(int petsitterNo,
			int petsitterboard_no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petsitter_detail");
		PetsitterVO pvo = petsitterService.getPetsitterVO(petsitterNo);
		MemberVO mvo = memberService.getMemberVO(pvo.getMemberVO().getId());
		pvo.setMemberVO(mvo);
		mv.addObject("petsitterVO", pvo);

		// 후기 리스트 가져오기
		List<ReviewVO> reviewList = reviewService.getReviewVOById(pvo
				.getMemberVO().getId());
		System.out.println("asdfasdfasdfasdf:" + reviewList);
		mv.addObject("reviewList", reviewList);
		// 펫시터의 보드정보 가져오기
		PetsitterboardVO bvo = boardService.getboardDetail(petsitterboard_no);
		mv.addObject("petsitterboardVO", bvo);
		return mv;
	}

	// 펫시터 자기정보 보기
	@RequestMapping("interceptor_petsitter_info.do")
	public ModelAndView petsitter_info(String id) {
		PetsitterVO petsitterVO = petsitterService.findPetsitterById(id);
		return new ModelAndView("petsitter_info", "petsitterVO", petsitterVO);
	}

}
