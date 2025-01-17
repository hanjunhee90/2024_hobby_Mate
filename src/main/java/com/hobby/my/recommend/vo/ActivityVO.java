package com.hobby.my.recommend.vo;

public class ActivityVO {
	
	/* 전국 액티비티 스포츠 레저 시설 정보 */
	private String fcltyNm;          /* 시설명 */
	private String ctgryOneNm;       /* 카테고리1 */
	private String ctgryTwoNm;       /* 카테고리2 */
	private String ctgryThreeNm;     /* 카테고리3 */
	private String ctprvnNm;         /* 시도명 */
	private String signguNm;         /* 시군구명 */
	private String legaldongNm;      /* 법정동명 */
	private String liNm;             /* 리명 */
	private String lnbrNo;           /* 번지번호 */
	private String roadNm;           /* 도로명 */
	private String lcLa;             /* 위도 */
	private String lcLo;             /* 경도 */
	public String getFcltyNm() {
		return fcltyNm;
	}
	public void setFcltyNm(String fcltyNm) {
		this.fcltyNm = fcltyNm;
	}
	public String getCtgryOneNm() {
		return ctgryOneNm;
	}
	public void setCtgryOneNm(String ctgryOneNm) {
		this.ctgryOneNm = ctgryOneNm;
	}
	public String getCtgryTwoNm() {
		return ctgryTwoNm;
	}
	public void setCtgryTwoNm(String ctgryTwoNm) {
		this.ctgryTwoNm = ctgryTwoNm;
	}
	public String getCtgryThreeNm() {
		return ctgryThreeNm;
	}
	public void setCtgryThreeNm(String ctgryThreeNm) {
		this.ctgryThreeNm = ctgryThreeNm;
	}
	public String getCtprvnNm() {
		return ctprvnNm;
	}
	public void setCtprvnNm(String ctprvnNm) {
		this.ctprvnNm = ctprvnNm;
	}
	public String getSignguNm() {
		return signguNm;
	}
	public void setSignguNm(String signguNm) {
		this.signguNm = signguNm;
	}
	public String getLegaldongNm() {
		return legaldongNm;
	}
	public void setLegaldongNm(String legaldongNm) {
		this.legaldongNm = legaldongNm;
	}
	public String getLiNm() {
		return liNm;
	}
	public void setLiNm(String liNm) {
		this.liNm = liNm;
	}
	public String getLnbrNo() {
		return lnbrNo;
	}
	public void setLnbrNo(String lnbrNo) {
		this.lnbrNo = lnbrNo;
	}
	public String getRoadNm() {
		return roadNm;
	}
	public void setRoadNm(String roadNm) {
		this.roadNm = roadNm;
	}
	public String getLcLa() {
		return lcLa;
	}
	public void setLcLa(String lcLa) {
		this.lcLa = lcLa;
	}
	public String getLcLo() {
		return lcLo;
	}
	public void setLcLo(String lcLo) {
		this.lcLo = lcLo;
	}
	@Override
	public String toString() {
		return "ActivityVO [fcltyNm=" + fcltyNm + ", ctgryOneNm=" + ctgryOneNm + ", ctgryTwoNm=" + ctgryTwoNm
				+ ", ctgryThreeNm=" + ctgryThreeNm + ", ctprvnNm=" + ctprvnNm + ", signguNm=" + signguNm
				+ ", legaldongNm=" + legaldongNm + ", liNm=" + liNm + ", lnbrNo=" + lnbrNo + ", roadNm=" + roadNm
				+ ", lcLa=" + lcLa + ", lcLo=" + lcLo + "]";
	}
	

}
