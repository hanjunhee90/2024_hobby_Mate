package com.hobby.my.board.vo;

public class CommentVO {
	
	 private int commentId;      // 댓글 ID
	 private int boNo;           // 게시글 번호
	 private String memId;       // 작성자 아이디
	 private String content;     // 댓글 내용
	 private String regDate;     // 작성일자
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "CommentVO [commentId=" + commentId + ", boNo=" + boNo + ", memId=" + memId + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}
	 
	 

}
