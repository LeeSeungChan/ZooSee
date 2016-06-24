package org.kosta.zoosee.model.tradeInfo;

import java.util.Comparator;

import org.kosta.zoosee.model.vo.TradeInfoVO;

public class TradeInfo_No_Desc implements Comparator<TradeInfoVO> {

	@Override
	public int compare(TradeInfoVO vo1, TradeInfoVO vo2) {
		int count = 0 ;
		
		if(vo1.getTradeinfo_no() > vo2.getTradeinfo_no()){
			count = -1;
		}else if(vo1.getTradeinfo_no() < vo2.getTradeinfo_no()){
			count = 1;
		}
		
 		return count;
	}

}
