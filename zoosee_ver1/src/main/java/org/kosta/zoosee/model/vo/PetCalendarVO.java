package org.kosta.zoosee.model.vo;

public class PetCalendarVO {
	private int pet_calNo;
	private String pet_calDate;
	private String pet_reserve;
	private PetsitterboardVO petsitterboardVO;
	private ReserveVO reserveVO;
	
	public PetCalendarVO() {
 	}
	public PetCalendarVO(int pet_calNo, String pet_calDate, String pet_reserve,
			PetsitterboardVO petsitterboardVO, ReserveVO reserveVO) {
		super();
		this.pet_calNo = pet_calNo;
		this.pet_calDate = pet_calDate;
		this.pet_reserve = pet_reserve;
		this.petsitterboardVO = petsitterboardVO;
		this.reserveVO = reserveVO;
	}
	
	public int getPet_calNo() {
		return pet_calNo;
	}
	public void setPet_calNo(int pet_calNo) {
		this.pet_calNo = pet_calNo;
	}
	public String getPet_calDate() {
		return pet_calDate;
	}
	public void setPet_calDate(String pet_calDate) {
		this.pet_calDate = pet_calDate;
	}
	public String getPet_reserve() {
		return pet_reserve;
	}
	public void setPet_reserve(String pet_reserve) {
		this.pet_reserve = pet_reserve;
	}
	public PetsitterboardVO getPetsitterboardVO() {
		return petsitterboardVO;
	}
	public void setPetsitterboardVO(PetsitterboardVO petsitterboardVO) {
		this.petsitterboardVO = petsitterboardVO;
	}
	public ReserveVO getReserveVO() {
		return reserveVO;
	}
	public void setReserveVO(ReserveVO reserveVO) {
		this.reserveVO = reserveVO;
	}
	
	@Override
	public String toString() {
		return "PetCalendar [pet_calNo=" + pet_calNo + ", pet_calDate="
				+ pet_calDate + ", pet_reserve=" + pet_reserve
				+ ", petsitterboardVO=" + petsitterboardVO + ", reserveVO="
				+ reserveVO + "]";
	}
}