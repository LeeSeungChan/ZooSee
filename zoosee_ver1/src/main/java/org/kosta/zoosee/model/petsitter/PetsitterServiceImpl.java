package org.kosta.zoosee.model.petsitter;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.member.MemberDAO;
import org.kosta.zoosee.model.message.MessageDAO;
import org.kosta.zoosee.model.qnaboard.PagingBean;
import org.kosta.zoosee.model.vo.MessageVO;
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

	@Override
	public void registerPetsitter(PetsitterVO petsitterVO){
		String id = petsitterVO.getMemberVO().getId();
		int i = petsitterDAO.registerPetsitter(petsitterVO);
		if (i == 1) {// petsitter신청이 완료되었을때
			// 멤버 등급 조정
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			String rank = memberDAO.findRank(id);
			if (rank.equals("normal")) {
				map.put("rank", "pre_petsitter");
			} else if (rank.equals("petmom")) {
				map.put("rank", "pre_petmaster");
			}
			memberDAO.upgradeRank(map);
			// 메세지 보내기
			String title = "[알람] 펫시터 신청 ";
			StringBuilder content = new StringBuilder("펫 시터를 신청하셨습니다.");
			content.append("귀하의 등록 정보를 관리자가 검증후 인증이 완료됩니다.");
			content.append("펫시터의 인증이 완료되면 펫시터 게시판에 글을 등록하실 수 있습니다. 감사합니다.");
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(id);
			messageDAO.insertMessage(message);
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
		PagingBean pagingBean = new PagingBean(totalContents, Integer.parseInt(pageNo));
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
			if (rank.equals("pre_petsitter")) {// 멤버의 rank가 prepetsitter 이면petsitter로 update
				map.put("rank", "petsitter");
			} else if (rank.equals("pre_petmaster")) {// 멤버의 rank가 petmom이면 petmaster로 update
				map.put("rank", "petmaster");
			}
			memberDAO.upgradeRank(map);
			// 메세지 보내기
			String title = "[알람] 펫시터 인증완료 ";
			StringBuilder content = new StringBuilder("펫시터로 인증되셨습니다.");
			content.append("펫시터 게시판에 글을 등록하시면 이용자가 귀하의 정보를 열람할 수 있습니다.");
			content.append("ZOOSEE 의 예약시스템을 이용하실 수 있습니다. ");
			content.append("귀하의 글에 예약신청이 접수되면 신청자의 정보를 열람하실 수 있습니다.");
			content.append("신청이 접수된 예약을 인증하셔야 거래가 성사됩니다. 감사합니다.");
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(id);
			messageDAO.insertMessage(message);
		}
	}

	@Override
	public PetsitterVO getPetsitterVO(int petsitterNo) {
		return petsitterDAO.getPetsitterVO(petsitterNo);
	}

	@Override
	public void deletePetsitter(int petsitterNo) {
		petsitterDAO.deletePetsitter(petsitterNo);
	}
	
	@Override	 
	public void updateRank(String id) {	 
		petsitterDAO.updateRank(id);	 
	}

	@Override
	public PetsitterVO findPetsitterById(String id) {
		return petsitterDAO.findPetsitterById(id);
	}

	@Override
	public void update(PetsitterVO petsitterVO) {
		petsitterVO.setAdminRecog("nonrecog");
		int i = petsitterDAO.update(petsitterVO);
		if (i == 1) {
			// 메세지 보내기
			String title = "[알람] 펫시터 수정 신청";
			StringBuilder content = new StringBuilder("펫시터정보를 수정하셨습니다.");
			content.append("따라서 귀하는 관리자의 검증을 받아야 게시판에 글을 등록하실 수 있습니다. 감사합니다.");
			MessageVO message = new MessageVO();
			message.setTitle(title);
			message.setContent(content.toString());
			message.setId(petsitterVO.getMemberVO().getId());
			messageDAO.insertMessage(message);
		}
	}

}
