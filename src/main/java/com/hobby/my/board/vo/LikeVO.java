package com.hobby.my.board.vo;

// 추천vo
public class LikeVO {
	
	private int likeId;         /* 추천 고유 식별자 */
    private int boNo;           /* 게시물 번호 (BOARD 테이블과 연결) */ 
    private String memId;       /* 추천한 회원 ID */
    private String likeDate;    /* 추천 일자 */
    
	public int getLikeId() {
		return likeId;
	}
	public void setLikeId(int likeId) {
		this.likeId = likeId;
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
	public String getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}
	@Override
	public String toString() {
		return "LikeVO [likeId=" + likeId + ", boNo=" + boNo + ", memId=" + memId + ", likeDate=" + likeDate + "]";
	}
    
    

}
