package org.kosta.zoosee.model.pet;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.security.SecurityService;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Service;

@Service				
public class PetServiceImpl implements PetService {
	@Resource
	private PetDAO petDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageService messageService;
	@Resource
	private SecurityService securityService;
	
	/*펫 등록*/
	@Override
	public void registerPet(PetVO pvo){
		int i=petDAO.registerPet(pvo);
		if(i==1){
			String id=pvo.getMemberVO().getId();
			//멤버 등급 바꾸기
			String rank=memberDAO.findRank(id);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			if(rank.equals("normal")||rank.equals("petmom")){
				map.put("rank", "petmom");
				securityService.updateAuthoties(id,"ROLE_PETMOM");
			}else if(rank.equals("petsitter")){
				map.put("rank", "petmaster");
			}else if(rank.equals("pre_petsitter")){
				map.put("rank", "pre_petmaster");
			}else if(rank.equals("petmaster")){
				map.put("rank", "petmaster");
				securityService.updateAuthoties(id,"ROLE_PETMASTER");
			}
			memberDAO.upgradeRank(map); 
			//메세지 보내기
			messageService.sendMessageOnServer(id, 5);
		}
	}

	@Override
	public PetVO petDetail(int petNo) {
		return petDAO.petDetail(petNo);
	}

	@Override
	public List<PetVO> petList(String id) {
		return petDAO.petList(id);
	}

	@Override
	public void petUpdateResult(PetVO vo) {
		petDAO.petUpdateResult(vo);
	}

	@Override
	public void updatePetNoImg(PetVO pvo) {
		petDAO.updatePetNoImg(pvo);
	}
	
	@Override
	public void deletePet(int petNo) {
		petDAO.deletePet(petNo);
	}
	
	@Override
	public List<PetVO> detailPetAndMemberInfo(String id) {
		return petDAO.detailPetAndMemberInfo(id);
	}

	@Override
	public List<Integer> getPetNo(String id) 
	{
		return petDAO.getPetNo(id);
	}
}
