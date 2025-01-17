package com.hobby.my.board.vo;

// 게시판
public class BoardVO {
	
	private int boNo;             /* 글번호  */
	private String boTitle;       /* 글제목  */
	private String boCategory;    /* 글 분류  */
	private String boWriter;      /* 작성자명  */
	private String memId;         /* 작성자ID */
	private String boPass;        /* 비밀번호  */
	private String boContent;     /* 글내용  */
	private int boHit;            /* 조회수  */
	private int boLike;           /* 좋아요  */
	private String boRegDate;     /* 등록일자  */
	private String boModDate;     /* 수정일자  */
	private String boDelYn;       /* 삭제여부  */
	private String categoryName;
	private String profileImg;    // 작성자 프로필 이미지 (조인된 값)
	
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public String getBoTitle() {
		return boTitle;
	}
	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}
	public String getBoCategory() {
		return boCategory;
	}
	public void setBoCategory(String boCategory) {
		this.boCategory = boCategory;
	}
	public String getBoWriter() {
		return boWriter;
	}
	public void setBoWriter(String boWriter) {
		this.boWriter = boWriter;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBoPass() {
		return boPass;
	}
	public void setBoPass(String boPass) {
		this.boPass = boPass;
	}
	public String getBoContent() {
		return boContent;
	}
	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}
	public int getBoHit() {
		return boHit;
	}
	public void setBoHit(int boHit) {
		this.boHit = boHit;
	}
	public int getBoLike() {
		return boLike;
	}
	public void setBoLike(int boLike) {
		this.boLike = boLike;
	}
	public String getBoRegDate() {
		return boRegDate;
	}
	public void setBoRegDate(String boRegDate) {
		this.boRegDate = boRegDate;
	}
	public String getBoModDate() {
		return boModDate;
	}
	public void setBoModDate(String boModDate) {
		this.boModDate = boModDate;
	}
	public String getBoDelYn() {
		return boDelYn;
	}
	public void setBoDelYn(String boDelYn) {
		this.boDelYn = boDelYn;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	@Override
	public String toString() {
		return "BoardVO [boNo=" + boNo + ", boTitle=" + boTitle + ", boCategory=" + boCategory + ", boWriter="
				+ boWriter + ", memId=" + memId + ", boPass=" + boPass + ", boContent=" + boContent + ", boHit=" + boHit
				+ ", boLike=" + boLike + ", boRegDate=" + boRegDate + ", boModDate=" + boModDate + ", boDelYn="
				+ boDelYn + ", categoryName=" + categoryName + ", profileImg=" + profileImg + "]";
	}
	
	

	

}
