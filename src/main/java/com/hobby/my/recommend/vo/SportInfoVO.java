package com.hobby.my.recommend.vo;

/* 레포츠시설 */
public class SportInfoVO {
	
	private String mlsfcNm;       /* 대분류명(레포츠만있음) */
	private String poiNm;         /* 업체명 */
	private String clNm;          /* 업체종류 */
	private String ctprvnNm;      /* 시도명 */
	private String signguNm;      /* 시군구 */
	private String legaldongNm;   /* 법정동명 */
	private String lnbrNo;        /* 번지번호 */
	private String rdnmadrNm;     /* 도로명주소명 */
	private String lcLo;          /* 위도 */
	private String lcLa;          /* 경도 */
	public String getMlsfcNm() {
		return mlsfcNm;
	}
	public void setMlsfcNm(String mlsfcNm) {
		this.mlsfcNm = mlsfcNm;
	}
	public String getPoiNm() {
		return poiNm;
	}
	public void setPoiNm(String poiNm) {
		this.poiNm = poiNm;
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
	public String getLnbrNo() {
		return lnbrNo;
	}
	public void setLnbrNo(String lnbrNo) {
		this.lnbrNo = lnbrNo;
	}
	public String getRdnmadrNm() {
		return rdnmadrNm;
	}
	public void setRdnmadrNm(String rdnmadrNm) {
		this.rdnmadrNm = rdnmadrNm;
	}
	public String getLcLo() {
		return lcLo;
	}
	public void setLcLo(String lcLo) {
		this.lcLo = lcLo;
	}
	public String getLcLa() {
		return lcLa;
	}
	public void setLcLa(String lcLa) {
		this.lcLa = lcLa;
	}
	
	
	public String getClNm() {
		return clNm;
	}
	public void setClNm(String clNm) {
		this.clNm = clNm;
	}
	@Override
	public String toString() {
		return "SportInfoVO [mlsfcNm=" + mlsfcNm + ", poiNm=" + poiNm + ", clNm=" + clNm + ", ctprvnNm=" + ctprvnNm
				+ ", signguNm=" + signguNm + ", legaldongNm=" + legaldongNm + ", lnbrNo=" + lnbrNo + ", rdnmadrNm="
				+ rdnmadrNm + ", lcLo=" + lcLo + ", lcLa=" + lcLa + "]";
	}

	
	

}
