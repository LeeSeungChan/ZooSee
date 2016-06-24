package org.kosta.zoosee.model.vo;

public class MemberVO {
	private String id;
	private String name;
	private String addressCode;
	private String address;
	private String detailAddress;
	private String gender;
	private String email;
	private String password;
	private String tel;
	private String job;
	private String rank;
	private String existence;
	
	public MemberVO() {
 	}
	
	public MemberVO(String id, String name, String addressCode, String address,
			String detailAddress, String gender, String email, String password,
			String tel, String job, String rank, String existence) {
		super();
		this.id = id;
		this.name = name;
		this.addressCode = addressCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.tel = tel;
		this.job = job;
		this.rank = rank;
		this.existence = existence;
	}

	public String getAddressCode() {
		return addressCode;
	}

	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getExistence() {
		return existence;
	}
	public void setExistence(String existence) {
		this.existence = existence;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", addressCode="
				+ addressCode + ", address=" + address + ", detailAddress="
				+ detailAddress + ", gender=" + gender + ", email=" + email
				+ ", password=" + password + ", tel=" + tel + ", job=" + job
				+ ", rank=" + rank + ", existence=" + existence + "]";
	}
	
	
}
