package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.message.MessageService;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.security.SecurityService;
import org.kosta.zoosee.model.vo.PetsitterVO;
import org.springframework.stereotype.Service;

@Service
public class PetsitterServiceImpl implements PetsitterService {

	@Resource
	private PetsitterDAO petsitterDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private MessageDAO messageDAO;
	@Resource
	private MessageService messageService;
	@Resource
	private SecurityService securityService;

	@Override
	public void registerPetsitter(PetsitterVO petsitterVO) {
		String id = petsitterVO.getMemberVO().getId();
		int i = petsitterDAO.registerPetsitter(petsitterVO);
		if (i == 1) {// petsitter신청이 완료되었을때
			// 멤버 등급 조정
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			String rank = memberDAO.findRank(id);
			String inputRank = "rank";
			if (rank.equals("normal")) {
				inputRank = "pre_petsitter";
			} else if (rank.equals("petmom")) {
				inputRank = "pre_petmaster";
			}
			map.put("rank", inputRank);
			memberDAO.upgradeRank(map);
			// 메세지 보내기
			messageService.sendMessageOnServer(id, 6);
		}
	}

	@Override
	public ListVO petsitterList(String value, String pageNo) {
		if (pageNo == null) {
			pageNo = "1";
		}
		int totalContents = petsitterDAO.petsitterListCount(value);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("value", value);
		map.put("pageNo", pageNo);
		List<PetsitterVO> list = petsitterDAO.petsitterList(map);
		PagingBean pagingBean = new PagingBean(totalContents,
				Integer.parseInt(pageNo));
		return new ListVO(list, pagingBean);
	}

	@Override
	public void recognitionPetsitter(int petsitterNo, String id) {
		int i = petsitterDAO.recognitionPetsitter(petsitterNo);
		if (i == 1) {
			// 멤버 등급
			String rank = memberDAO.findRank(id);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			if (rank.equals("pre_petsitter")) {// 멤버의 rank가 prepetsitter 이면 petsitter로 update
				map.put("rank", "petsitter");
				
				securityService.updateAuthoties(id,"ROLE_PETSITTER");
			} else if (rank.equals("pre_petmaster")) {// 멤버의 rank가 petmom이면 petmaster로 update
				map.put("rank", "petmaster");
				securityService.updateAuthoties(id,"ROLE_PETMASTER");
			}
			memberDAO.upgradeRank(map);
			// 메세지 보내기
			messageService.sendMessageOnServer(id, 7);
		}
	}
	
		
		
	@Override
	public PetsitterVO getPetsitterVO(int petsitterNo) {
		return petsitterDAO.getPetsitterVO(petsitterNo);
	}

	@Override
	public void deletePetsitter(String id) {
		petsitterDAO.deletePetsitter(id);
		// 멤버 등급
				String rank = memberDAO.findRank(id);
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id", id);
				String inputRank = "rank";
				if (rank.equals("petsitter")) {// 멤버의 rank가 petsitter 이면
													// normal로 update
					inputRank = "normal";
					securityService.updateAuthoties(id,"ROLE_MEMBER");
				} else if (rank.equals("petmaster")) {// 멤버의 rank가 petmaster이면
															// petmom로 update
					inputRank = "petmom";
					securityService.updateAuthoties(id,"ROLE_PETMOM");
				}
				map.put("rank", inputRank);
				memberDAO.upgradeRank(map);
	}

	@Override
	public PetsitterVO findPetsitterById(String id) {
		return petsitterDAO.findPetsitterById(id);
	}

	@Override
	public void update(PetsitterVO petsitterVO) {
		petsitterVO.setAdminRecog("nonrecog");
		String houseImg=petsitterVO.getHouseImg();
		String petsitterImg=petsitterVO.getPetsitterImg();
		if(houseImg.length()==19){
			petsitterVO.setHouseImg(petsitterVO.getOrgHouseImg());
		}
		if(petsitterImg.length()==19){
			petsitterVO.setPetsitterImg(petsitterVO.getOrgPetsitterImg());
		}
	
		int i = petsitterDAO.update(petsitterVO);
		if (i == 1) {
			// 메세지 보내기
			messageService.sendMessageOnServer(petsitterVO.getMemberVO().getId(), 8);
		}
	}

	@Override
	public void updateRank(String id) {
		petsitterDAO.updateRank(id);	
	}

}
