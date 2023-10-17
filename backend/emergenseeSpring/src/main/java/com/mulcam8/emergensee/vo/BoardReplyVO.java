package com.mulcam8.emergensee.vo;



public class BoardReplyVO {
	private int comment_no;
	private int post_no;
	private String contents;
	private String userid;
	private String writedate;
	private int editornot;
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getEditornot() {
		return editornot;
	}
	public void setEditornot(int editornot) {
		this.editornot = editornot;
	}
	
	
}
