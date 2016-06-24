package org.kosta.zoosee.model.pet;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.vo.MessageVO;
import org.kosta.zoosee.model.vo.PetVO;
import org.springframework.stereotype.Service;

@Service				
public class PetServiceImpl implements PetService {
	@Resource
	private PetDAO petDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageDAO messageDAO;
	
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
			}else if(rank.equals("petsitter")){
				map.put("rank", "petmaster");
			}else if(rank.equals("pre_petsitter")){
				map.put("rank", "pre_petmaster");
			}
			memberDAO.upgradeRank(map); 
			//메세지 보내기
			String title="[알람] 펫 등록 ";
			StringBuilder content=new StringBuilder(pvo.getPetName()+"을 펫으로 등록하셨습니다.");
			content.append("펫의 정보를 수정하실 때는 펫 관리 페이지를 이용하세요.");
			content.append("ZOOSEE 의 예약을 이용하실 수 있습니다. 감사합니다.");
			MessageVO message=new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(id);
			messageDAO.insertMessage(message);
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
	public PetVO detailPetAndMemberInfo(String id) {
		return petDAO.detailPetAndMemberInfo(id);
	}
}
