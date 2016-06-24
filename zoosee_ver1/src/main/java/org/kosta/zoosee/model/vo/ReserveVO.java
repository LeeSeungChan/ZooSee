package org.kosta.zoosee.model.vo;


public class ReserveVO {
	private int reserve_no;
	private int reserve_price;
	private int reserve_recog;
	private int petCheckNumber;
	private MemberVO memberVO;
	private PetVO petVO;
	private PetsitterboardVO petsitterboardVO;
	
	public ReserveVO() {
 	}
	public ReserveVO(int reserve_no, int reserve_price, int reserve_recog,
			int petCheckNumber, MemberVO memberVO, PetVO petVO,
			PetsitterboardVO petsitterboardVO) {
		super();
		this.reserve_no = reserve_no;
		this.reserve_price = reserve_price;
		this.reserve_recog = reserve_recog;
		this.petCheckNumber = petCheckNumber;
		this.memberVO = memberVO;
		this.petVO = petVO;
		this.petsitterboardVO = petsitterboardVO;
	}
	
	public int getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}
	public int getReserve_price() {
		return reserve_price;
	}
	public void setReserve_price(int reserve_price) {
		this.reserve_price = reserve_price;
	}
	public int getReserve_recog() {
		return reserve_recog;
	}
	public void setReserve_recog(int reserve_recog) {
		this.reserve_recog = reserve_recog;
	}
	public int getPetCheckNumber() {
		return petCheckNumber;
	}
	public void setPetCheckNumber(int petCheckNumber) {
		this.petCheckNumber = petCheckNumber;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public PetVO getPetVO() {
		return petVO;
	}
	public void setPetVO(PetVO petVO) {
		this.petVO = petVO;
	}
	public PetsitterboardVO getPetsitterboardVO() {
		return petsitterboardVO;
	}
	public void setPetsitterboardVO(PetsitterboardVO petsitterboardVO) {
		this.petsitterboardVO = petsitterboardVO;
	}
	
	@Override
	public String toString() {
		return "ReserveVO[reserve_no=" + reserve_no + ",reserve_price="
				+ reserve_price + ",reserve_recog=" + reserve_recog + ",petCheckNumber="
				+ petCheckNumber + ",memberVO=" + memberVO + ",petVO="
				+ petVO + ",petsitterboardVO=" + petsitterboardVO + "]";
	}
}
