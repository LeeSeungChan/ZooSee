package org.kosta.zoosee.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.zoosee.model.pet.PetService;
import org.kosta.zoosee.model.vo.MemberVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetController {
	@Resource
	private PetService petService;
	@Resource(name="petUploadPath")
	private String petUploadPath;
	
	@RequestMapping(value="interceptor_registerPet.do", method=RequestMethod.POST)
	public ModelAndView write(PetVO pvo, MultipartFile petImg2, HttpSession session) {
		if(session==null||session.getAttribute("mvo")==null){
			return new ModelAndView("redirect:home.do");
		}
		pvo.setMemberVO((MemberVO)session.getAttribute("mvo"));
		String path = petUploadPath+petImg2.getOriginalFilename();
		if(petImg2.isEmpty()==false){	
			File uploadFile=new File(path);
			try {
				petImg2.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		path = path.substring(path.indexOf("upload\\"));
		pvo.setPetImg(path);
		petService.registerPet(pvo);
		return new ModelAndView("redirect:interceptor_pet_detail.do?petNo="+pvo.getPetNo());
	}
	@RequestMapping("interceptor_pet_detail.do")
		public ModelAndView petDetail(int petNo){
			PetVO pvo=petService.petDetail(petNo);
			return new ModelAndView("pet_detail","petVO",pvo);
	}
	@RequestMapping("interceptor_pet_list.do")
	public ModelAndView petList(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		List<PetVO> list=petService.petList(id);
		return new ModelAndView("pet_list","list",list);
	}
	@RequestMapping("interceptor_pet_update.do")
	public ModelAndView petUpdate(int petNo){
		return new ModelAndView("pet_update","pvo",petService.petDetail(petNo));
	}
	@RequestMapping(value="interceptor_pet_update_result.do", method=RequestMethod.POST)
	public String petUpadteResult(HttpServletRequest request,PetVO vo, MultipartFile petImg3){
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("mvo")!=null) {
			String path = petUploadPath+petImg3.getOriginalFilename();
			if(petImg3.isEmpty()==false){	
				File uploadFile=new File(path);
				path = path.substring(path.indexOf("upload\\"));
				vo.setPetImg(path);
				petService.petUpdateResult(vo);
				try {
					petImg3.transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}else{
				petService.updatePetNoImg(vo);
			}
			return "redirect:interceptor_pet_detail.do?petNo="+vo.getPetNo();
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("interceptor_pet_delete.do")
	public ModelAndView deletePet(HttpServletRequest request,int petNo) {
		HttpSession session=request.getSession(false);
		String id=((MemberVO)session.getAttribute("mvo")).getId();
		petService.deletePet(petNo);		
		return new ModelAndView("pet_list","list",petService.petList(id));
	}
}
