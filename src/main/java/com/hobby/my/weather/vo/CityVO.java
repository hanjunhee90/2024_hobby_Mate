package com.hobby.my.weather.vo;

public class CityVO {
	
	private String englishName;
	private String koreanName;
	
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getKoreanName() {
		return koreanName;
	}
	public void setKoreanName(String koreanName) {
		this.koreanName = koreanName;
	}
	@Override
	public String toString() {
		return "CityVO [englishName=" + englishName + ", koreanName=" + koreanName + "]";
	}

}
