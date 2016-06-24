package org.kosta.zoosee.model.vo;

public class PetsitterboardVO {
	private int petsitterboard_no;
	private String petsitterboard_title;
	private String petsitterboard_contents;
	private String startDay;
	private String endDay;
	private PetsitterVO petsitterVO;
	
	public PetsitterboardVO() {
 	}
	public PetsitterboardVO(int petsitterboard_no, String petsitterboard_title,
			String petsitterboard_contents, String startDay, String endDay,
			PetsitterVO petsitterVO) {
		super();
		this.petsitterboard_no = petsitterboard_no;
		this.petsitterboard_title = petsitterboard_title;
		this.petsitterboard_contents = petsitterboard_contents;
		this.startDay = startDay;
		this.endDay = endDay;
		this.petsitterVO = petsitterVO;
	}

	public int getPetsitterboard_no() {
		return petsitterboard_no;
	}
	public void setPetsitterboard_no(int petsitterboard_no) {
		this.petsitterboard_no = petsitterboard_no;
	}
	public String getPetsitterboard_title() {
		return petsitterboard_title;
	}
	public void setPetsitterboard_title(String petsitterboard_title) {
		this.petsitterboard_title = petsitterboard_title;
	}
	public String getPetsitterboard_contents() {
		return petsitterboard_contents;
	}
	public void setPetsitterboard_contents(String petsitterboard_contents) {
		this.petsitterboard_contents = petsitterboard_contents;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public PetsitterVO getPetsitterVO() {
		return petsitterVO;
	}
	public void setPetsitterVO(PetsitterVO petsitterVO) {
		this.petsitterVO = petsitterVO;
	}
	
	@Override
	public String toString() {
		return "PetsitterboardVO[petsitterboard_no=" + petsitterboard_no
				+ ",petsitterboard_title=" + petsitterboard_title
				+ ",petsitterboard_contents=" + petsitterboard_contents
				+ ",startDay=" + startDay + ",endDay=" + endDay
				+ ",petsitterVO=" + petsitterVO + "]";
	}
}
