package org.kosta.zoosee.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.member.MemberService;
import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.security.SecurityService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetController {
	@Resource
	private PetService petService;
	@Resource
	private MemberService memberService;
	@Resource
	private SecurityService securityService;
	
	@Resource(name="petUploadPath")
	private String petUploadPath;
	
	@RequestMapping(value="pet_registerPet.do", method=RequestMethod.POST)
	public ModelAndView write(PetVO pvo, MultipartFile petImg2, HttpSession session) {
		// 2016.07.05
		// 시큐리티 세션
		pvo.setMemberVO((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		String path = petUploadPath+petImg2.getOriginalFilename();
		if(petImg2.isEmpty()==false){	
			File uploadFile=new File(path);
			try {
				petImg2.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		path = path.substring(path.indexOf("upload\\"));
		pvo.setPetImg(path);
		petService.registerPet(pvo);
		MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(mvo.getRank().equals("petsitter"))
		{
			securityService.updateAuthoties(mvo.getId(),"ROLE_PETMASTER");
		}
		else if(mvo.getRank().equals("normal"))
		{
			securityService.updateAuthoties(mvo.getId(),"ROLE_PETMOM");
		}
		return new ModelAndView("redirect:pet_detail.do?petNo="+pvo.getPetNo());
	}
	@RequestMapping("pet_detail.do")
		public ModelAndView petDetail(int petNo){
			PetVO pvo=petService.petDetail(petNo);
			return new ModelAndView("pet_detail","petVO",pvo);
	}
	@RequestMapping("pet_list.do")
	public ModelAndView petList(HttpServletRequest request){
		//HttpSession session=request.getSession(false);
		// 2016.07.05
		// 시큐리티 세션
		String id=((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		List<PetVO> list=petService.petList(id);
		return new ModelAndView("pet_list","list",list);
	}
	@RequestMapping("pet_update.do")
	public ModelAndView petUpdate(int petNo){
		return new ModelAndView("pet_update","pvo",petService.petDetail(petNo));
	}
	@RequestMapping(value="pet_update_result.do", method=RequestMethod.POST)
	public String petUpadteResult(HttpServletRequest request,PetVO vo, MultipartFile petImg3){
		//HttpSession session = request.getSession(false);
		// 2016.07.05 
		// 시큐리티 세션
		MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (mvo!=null) {
			String path = petUploadPath+petImg3.getOriginalFilename();
			if(petImg3.isEmpty()==false){	
				File uploadFile=new File(path);
				path = path.substring(path.indexOf("upload\\"));
				vo.setPetImg(path);
				petService.petUpdateResult(vo);
				try {
					petImg3.transferTo(uploadFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				petService.updatePetNoImg(vo);
			}
			return "redirect:pet_detail.do?petNo="+vo.getPetNo();
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("pet_delete.do")
	public ModelAndView deletePet(HttpServletRequest request,int petNo) {
		// 2016.07.05
		// 시큐리티 세션
		String id=((MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
		petService.deletePet(petNo);
		List<PetVO> list = petService.petList(id);
		// 펫 목록이 0 이면 다 삭제 이므로 rank로 떨어져야됌.
		if(list.size()==0)
		{
			MemberVO mvo = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(mvo.getRank().equals("petmom"))
			{
				mvo.setRank("normal");
				securityService.updateAuthoties(id,"ROLE_MEMBER");
			}
			else if(mvo.getRank().equals("petmaster"))
			{
				mvo.setRank("petsitter");
				securityService.updateAuthoties(id,"ROLE_PETSITTER");
			}
			memberService.updateMember(mvo);
		}
		return new ModelAndView("pet_list","list",list);
	}
}
