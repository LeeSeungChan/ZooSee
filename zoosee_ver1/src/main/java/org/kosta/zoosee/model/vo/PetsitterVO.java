package org.kosta.zoosee.model.vo;


public class PetsitterVO {
	private int petsitterNo;
	private MemberVO memberVO;
	private int petNumber;
	private String service;
	private int price;
	private String petSize;
	private String petType;
	private String houseImg;
	private String petsitterImg;
	private String adminRecog;
	
	public PetsitterVO() {
		super();
	}

	public PetsitterVO(int petsitterNo, MemberVO memberVO, int petNumber,
			String service, int price, String petSize, String petType,
			String houseImg, String petsitterImg, String adminRecog) {
		super();
		this.petsitterNo = petsitterNo;
		this.memberVO = memberVO;
		this.petNumber = petNumber;
		this.service = service;
		this.price = price;
		this.petSize = petSize;
		this.petType = petType;
		this.houseImg = houseImg;
		this.petsitterImg = petsitterImg;
		this.adminRecog = adminRecog;
	}

	public int getPetsitterNo() {
		return petsitterNo;
	}

	public void setPetsitterNo(int petsitterNo) {
		this.petsitterNo = petsitterNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public int getPetNumber() {
		return petNumber;
	}

	public void setPetNumber(int petNumber) {
		this.petNumber = petNumber;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPetSize() {
		return petSize;
	}

	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getHouseImg() {
		return houseImg;
	}

	public void setHouseImg(String houseImg) {
		this.houseImg = houseImg;
	}

	public String getPetsitterImg() {
		return petsitterImg;
	}

	public void setPetsitterImg(String petsitterImg) {
		this.petsitterImg = petsitterImg;
	}

	public String getAdminRecog() {
		return adminRecog;
	}

	public void setAdminRecog(String adminRecog) {
		this.adminRecog = adminRecog;
	}

	@Override
	public String toString() {
		return "PetsitterVO [petsitterNo=" + petsitterNo + ", petNumber="
				+ petNumber + ", service=" + service + ", price=" + price
				+ ", petSize=" + petSize + ", petType=" + petType
				+ ", houseImg=" + houseImg + ", petsitterImg=" + petsitterImg
				+ ", adminRecog=" + adminRecog + "]";
	}
	
	
	

}
