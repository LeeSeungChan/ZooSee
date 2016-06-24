package org.kosta.zoosee.model.vo;

public class QNABoardVO {
	private int boardNo;
	private String title;
	private String question;
	private String answer;
	private MemberVO memberVO;
	private String timePosted;
	private String timeAnswered;
	public QNABoardVO() {
		super();
	}
	public QNABoardVO(int boardNo, String title, String question,
			String answer, MemberVO memberVO, String timePosted,
			String timeAnswered) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.question = question;
		this.answer = answer;
		this.memberVO = memberVO;
		this.timePosted = timePosted;
		this.timeAnswered = timeAnswered;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getTimePosted() {
		return timePosted;
	}
	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}
	public String getTimeAnswered() {
		return timeAnswered;
	}
	public void setTimeAnswered(String timeAnswered) {
		this.timeAnswered = timeAnswered;
	}
	@Override
	public String toString() {
		return "QNABoardVO [boardNo=" + boardNo + ", title=" + title
				+ ", question=" + question + ", answer=" + answer
				+ ", memberVO=" + memberVO + ", timePosted=" + timePosted
				+ ", timeAnswered=" + timeAnswered + "]";
	}
	
		
}
