package org.kosta.zoosee.model.tradeInfo;

import java.util.List;

import org.kosta.zoosee.model.vo.TradeInfoVO;

public interface TradeInfoDAO {

	void registerTradeInfo(TradeInfoVO tradeInfoVO);

	List<TradeInfoVO> getTradeVOPetMomList(String id);

	List<TradeInfoVO> getTradeVOPetsitterList(String id);

}
