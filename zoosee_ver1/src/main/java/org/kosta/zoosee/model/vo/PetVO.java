package org.kosta.zoosee.model.vo;


public class PetVO {
	private int petNo;
	private MemberVO memberVO;
	private String petName;
	private int petAge;
	private String petType;
	private String petGender;
	private String petNeutral;
	private String petImg;
	private String petSize;
	private String etc;
	
	public PetVO() {
 	}

	public PetVO(int petNo, MemberVO memberVO, String petName, int petAge,
			String petType, String petGender, String petNeutral, String petImg,
			String petSize, String etc) {
		super();
		this.petNo = petNo;
		this.memberVO = memberVO;
		this.petName = petName;
		this.petAge = petAge;
		this.petType = petType;
		this.petGender = petGender;
		this.petNeutral = petNeutral;
		this.petImg = petImg;
		this.petSize = petSize;
		this.etc = etc;
	}

	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public String getPetNeutral() {
		return petNeutral;
	}

	public void setPetNeutral(String petNeutral) {
		this.petNeutral = petNeutral;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	public String getPetSize() {
		return petSize;
	}

	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "PetVO [petNo=" + petNo + ", memberVO=" + memberVO
				+ ", petName=" + petName + ", petAge=" + petAge + ", petType="
				+ petType + ", petGender=" + petGender + ", petNeutral="
				+ petNeutral + ", petImg=" + petImg + ", petSize=" + petSize
				+ ", etc=" + etc + "]";
	}

}
