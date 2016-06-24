package org.kosta.zoosee.model.tradeInfo;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.zoosee.model.vo.TradeInfoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TradeInfoDAOImpl implements TradeInfoDAO{
	@Resource
	private SqlSessionTemplate template;

	@Override // 거래내역 insert하기
	public void registerTradeInfo(TradeInfoVO tradeInfoVO) {
		template.insert("tradeInfo.registerTradeInfo", tradeInfoVO);
	}

	@Override // PetMom이 로그인시 list 찾기
	public List<TradeInfoVO> getTradeVOPetMomList(String id) {
 		return template.selectList("tradeInfo.getTradeVOPetMomList", id);
	}

	@Override // Petsitter이 로그인시 list 찾기
	public List<TradeInfoVO> getTradeVOPetsitterList(String id) {
		return template.selectList("tradeInfo.getTradeVOPetsitterList", id);
	}
}
