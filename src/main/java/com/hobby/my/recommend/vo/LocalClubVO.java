package com.hobby.my.recommend.vo;

/* 지역별 동호회 정보*/
public class LocalClubVO {
	
	private String clubNm;         /* 동호회명 */
	private String ctprvnNm;       /* 시도명 */
	private String signguNm;       /* 시군구명 */
	private String itemNm;         /* 종목명 */
	private String afltinGroupNm;  /* 소속그룹명 */
	private String itemClNm;       /* 종목분류명 */
	private String sexdstnFlagNm;  /* 성별구분명 */
	private int mberCo;            /* 회원수 */
	private String fondDe;         /* 설립일자 */
	public String getClubNm() {
		return clubNm;
	}
	public void setClubNm(String clubNm) {
		this.clubNm = clubNm;
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
	public String getItemNm() {
		return itemNm;
	}
	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}
	public String getAfltinGroupNm() {
		return afltinGroupNm;
	}
	public void setAfltinGroupNm(String afltinGroupNm) {
		this.afltinGroupNm = afltinGroupNm;
	}
	public String getItemClNm() {
		return itemClNm;
	}
	public void setItemClNm(String itemClNm) {
		this.itemClNm = itemClNm;
	}
	public String getSexdstnFlagNm() {
		return sexdstnFlagNm;
	}
	public void setSexdstnFlagNm(String sexdstnFlagNm) {
		this.sexdstnFlagNm = sexdstnFlagNm;
	}
	public int getMberCo() {
		return mberCo;
	}
	public void setMberCo(int mberCo) {
		this.mberCo = mberCo;
	}
	public String getFondDe() {
		return fondDe;
	}
	public void setFondDe(String fondDe) {
		this.fondDe = fondDe;
	}
	@Override
	public String toString() {
		return "LocalClubVO [clubNm=" + clubNm + ", ctprvnNm=" + ctprvnNm + ", signguNm=" + signguNm + ", itemNm="
				+ itemNm + ", afltinGroupNm=" + afltinGroupNm + ", itemClNm=" + itemClNm + ", sexdstnFlagNm="
				+ sexdstnFlagNm + ", mberCo=" + mberCo + ", fondDe=" + fondDe + "]";
	}
	
	

}
