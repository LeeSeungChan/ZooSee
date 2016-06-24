package org.kosta.zoosee.model.vo;

public class MessageVO {
	
	private int message_no;
	private String title;
	private String content;
	private String time_posted;
	private int checked;
	private String id;
	
	public MessageVO() {
		super();
	}

	public MessageVO(int message_no, String title, String content,
			String time_posted, int checked, String id) {
		super();
		this.message_no = message_no;
		this.title = title;
		this.content = content;
		this.time_posted = time_posted;
		this.checked = checked;
		this.id = id;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MessageVO [message_no=" + message_no + ", title=" + title
				+ ", content=" + content + ", time_posted=" + time_posted
				+ ", checked=" + checked + ", id=" + id + "]";
	}
	

}
