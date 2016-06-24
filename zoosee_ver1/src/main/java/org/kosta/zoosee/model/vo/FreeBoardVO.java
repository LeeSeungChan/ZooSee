package org.kosta.zoosee.model.vo;

public class FreeBoardVO {
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardContents;
	private int freeBoardHits;
	private String freeBoardTimePosted;
	private MemberVO memberVO;

	public FreeBoardVO() {
		super();
	}
	public FreeBoardVO(int freeBoardNo, String freeBoardTitle,
			String freeBoardContents, int freeBoardHits,
			String freeBoardTimePosted, MemberVO memberVO) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardContents = freeBoardContents;
		this.freeBoardHits = freeBoardHits;
		this.freeBoardTimePosted = freeBoardTimePosted;
		this.memberVO = memberVO;
	}
	public int getFreeBoardNo() {
		return freeBoardNo;
	}
	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}
	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}
	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}
	public String getFreeBoardContents() {
		return freeBoardContents;
	}
	public void setFreeBoardContents(String freeBoardContents) {
		this.freeBoardContents = freeBoardContents;
	}
	public int getFreeBoardHits() {
		return freeBoardHits;
	}
	public void setFreeBoardHits(int freeBoardHits) {
		this.freeBoardHits = freeBoardHits;
	}
	public String getFreeBoardTimePosted() {
		return freeBoardTimePosted;
	}
	public void setFreeBoardTimePosted(String freeBoardTimePosted) {
		this.freeBoardTimePosted = freeBoardTimePosted;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "FreeBoardVO [freeBoardNo=" + freeBoardNo + ", freeBoardTitle="
				+ freeBoardTitle + ", freeBoardContents=" + freeBoardContents
				+ ", freeBoardHits=" + freeBoardHits + ", freeBoardTimePosted="
				+ freeBoardTimePosted + ", memberVO=" + memberVO + "]";
	}
	
	
	
}
