package org.kosta.zoosee.model.vo;

public class FreeBoardReplyVO {
   private int reply_no;
   private String content;
   private String time_posted;
   private int grp;
   private int lvl;
   private int con;
   private String id;
   private int ref;
   
   public FreeBoardReplyVO() {
      super();
   }

public FreeBoardReplyVO(int reply_no, String content, String time_posted,
		int grp, int lvl, int con, String id, int ref) {
	super();
	this.reply_no = reply_no;
	this.content = content;
	this.time_posted = time_posted;
	this.grp = grp;
	this.lvl = lvl;
	this.con = con;
	this.id = id;
	this.ref = ref;
}

public int getReply_no() {
	return reply_no;
}

public void setReply_no(int reply_no) {
	this.reply_no = reply_no;
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

public int getGrp() {
	return grp;
}

public void setGrp(int grp) {
	this.grp = grp;
}

public int getLvl() {
	return lvl;
}

public void setLvl(int lvl) {
	this.lvl = lvl;
}

public int getCon() {
	return con;
}

public void setCon(int con) {
	this.con = con;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public int getRef() {
	return ref;
}

public void setRef(int ref) {
	this.ref = ref;
}

@Override
public String toString() {
	return "FreeBoardReplyVO [reply_no=" + reply_no + ", content=" + content
			+ ", time_posted=" + time_posted + ", grp=" + grp + ", lvl=" + lvl
			+ ", con=" + con + ", id=" + id + ", ref=" + ref + "]";
}
   
   

   
   
   
}