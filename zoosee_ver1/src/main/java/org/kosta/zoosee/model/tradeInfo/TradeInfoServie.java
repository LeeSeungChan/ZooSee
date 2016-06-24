package org.kosta.zoosee.model.tradeInfo;

import java.util.List;

import org.kosta.zoosee.model.vo.TradeInfoVO;

public interface TradeInfoServie {

	void registerTradeInfo(TradeInfoVO tradeInfoVO, int reserve_no, String id, String petsitterId);

	List<TradeInfoVO> getTradeMyList(String id);

}
