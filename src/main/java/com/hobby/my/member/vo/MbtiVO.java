package com.hobby.my.member.vo;

public class MbtiVO {
	
	private String mbtiCode;         /* mbti 종류 */
	private String mbtiKeywords;     /* 키워드 */
	private String mbtiDescription;  /* 각 mbti별 유형 */
	
	public String getMbtiCode() {
		return mbtiCode;
	}
	public void setMbtiCode(String mbtiCode) {
		this.mbtiCode = mbtiCode;
	}
	public String getMbtiKeywords() {
		return mbtiKeywords;
	}
	public void setMbtiKeywords(String mbtiKeywords) {
		this.mbtiKeywords = mbtiKeywords;
	}
	public String getMbtiDescription() {
		return mbtiDescription;
	}
	public void setMbtiDescription(String mbtiDescription) {
		this.mbtiDescription = mbtiDescription;
	}
	@Override
	public String toString() {
		return "MbtiVO [mbtiCode=" + mbtiCode + ", mbtiKeywords=" + mbtiKeywords + ", mbtiDescription="
				+ mbtiDescription + "]";
	}
	


}
