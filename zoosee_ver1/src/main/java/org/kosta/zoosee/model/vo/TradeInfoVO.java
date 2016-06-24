package org.kosta.zoosee.model.vo;

public class TradeInfoVO {
	private int tradeinfo_no;
	private String tradeSdate;
	private String tradeEdate;
	private int tradePrice;
	private MemberVO memberVO;
	private PetsitterVO petsitterVO;
	private PetsitterboardVO petsitterboardVO;
	
	public TradeInfoVO() {
 	}
	public TradeInfoVO(int tradeinfo_no, String tradeSdate, String tradeEdate,
			int tradePrice, MemberVO memberVO, PetsitterVO petsitterVO,
			PetsitterboardVO petsitterboardVO) {
		super();
		this.tradeinfo_no = tradeinfo_no;
		this.tradeSdate = tradeSdate;
		this.tradeEdate = tradeEdate;
		this.tradePrice = tradePrice;
		this.memberVO = memberVO;
		this.petsitterVO = petsitterVO;
		this.petsitterboardVO = petsitterboardVO;
	}
	
	public int getTradeinfo_no() {
		return tradeinfo_no;
	}
	public void setTradeinfo_no(int tradeinfo_no) {
		this.tradeinfo_no = tradeinfo_no;
	}
	public String getTradeSdate() {
		return tradeSdate;
	}
	public void setTradeSdate(String tradeSdate) {
		this.tradeSdate = tradeSdate;
	}
	public String getTradeEdate() {
		return tradeEdate;
	}
	public void setTradeEdate(String tradeEdate) {
		this.tradeEdate = tradeEdate;
	}
	public int getTradePrice() {
		return tradePrice;
	}
	public void setTradePrice(int tradePrice) {
		this.tradePrice = tradePrice;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public PetsitterVO getPetsitterVO() {
		return petsitterVO;
	}
	public void setPetsitterVO(PetsitterVO petsitterVO) {
		this.petsitterVO = petsitterVO;
	}
	public PetsitterboardVO getPetsitterboardVO() {
		return petsitterboardVO;
	}
	public void setPetsitterboardVO(PetsitterboardVO petsitterboardVO) {
		this.petsitterboardVO = petsitterboardVO;
	}
	
	@Override
	public String toString() {
		return "TradeInfoVO [tradeinfo_no=" + tradeinfo_no + ", tradeSdate="
				+ tradeSdate + ", tradeEdate=" + tradeEdate + ", tradePrice="
				+ tradePrice + ", memberVO=" + memberVO + ", petsitterVO="
				+ petsitterVO + ", petsitterboardVO=" + petsitterboardVO + "]";
	}
}
