package org.kosta.zoosee.model.vo;

public class ReviewVO {
	
	private int review_no;
	private String content;
	private String time_posted;
	private int star_rate;
	private String id;
	private String ref_id;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int review_no, String content, String time_posted,
			int star_rate, String id, String ref_id) {
		super();
		this.review_no = review_no;
		this.content = content;
		this.time_posted = time_posted;
		this.star_rate = star_rate;
		this.id = id;
		this.ref_id = ref_id;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime_posted() {
		return time_posted;
	}

	public void setTime_posted(String time_posted) {
		this.time_posted = time_posted;
	}

	public int getStar_rate() {
		return star_rate;
	}

	public void setStar_rate(int star_rate) {
		this.star_rate = star_rate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRef_id() {
		return ref_id;
	}

	public void setRef_id(String ref_id) {
		this.ref_id = ref_id;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", content=" + content
				+ ", time_posted=" + time_posted + ", star_rate=" + star_rate
				+ ", id=" + id + ", ref_id=" + ref_id + "]";
	}
	
	

}
