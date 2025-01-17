package com.hobby.my.recommend.vo;

public class CulturalVO {
	
	private String classTitle;       /* 클래스 타이틀 */
	private String category1;        /* 카테고리1 (대분류) */
	private String category2;        /* 카테고리2 (중분류) */
	private String category3;        /* 카테고리3 (소분류) */
	private String classPerson;      /* 클래스 인원 */
	private int classFee;            /* 클래스 요금 (단위: 원) */
	private int classDuration;       /* 클래스 시간 (단위: 시간) */
	private int costPerHour;         /* 클래스 시간당 비용 (단위: 원) */
	private String cityName;         /* 시도 명칭 (예: 서울특별시) */
	private String districtName;     /* 시군구 명칭 (예: 강남구) */
	private String townName;         /* 법정읍면동명칭 (예: 대치동) */
	private String address;          /* 클래스가 위치한 정확한 주소 */
	private String classCurriculum;  /* 클래스 커리큘럼 (상세 설명 또는 과정) */
	private String lastUpdated;      /* 최종 작성일 (데이터가 최종적으로 업데이트된 날짜) */
	
	public String getClassTitle() {
		return classTitle;
	}
	public void setClassTitle(String classTitle) {
		this.classTitle = classTitle;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getClassPerson() {
		return classPerson;
	}
	public void setClassPerson(String classPerson) {
		this.classPerson = classPerson;
	}
	public int getClassFee() {
		return classFee;
	}
	public void setClassFee(int classFee) {
		this.classFee = classFee;
	}
	public int getClassDuration() {
		return classDuration;
	}
	public void setClassDuration(int classDuration) {
		this.classDuration = classDuration;
	}
	public int getCostPerHour() {
		return costPerHour;
	}
	public void setCostPerHour(int costPerHour) {
		this.costPerHour = costPerHour;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public String getTownName() {
		return townName;
	}
	public void setTownName(String townName) {
		this.townName = townName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getClassCurriculum() {
		return classCurriculum;
	}
	public void setClassCurriculum(String classCurriculum) {
		this.classCurriculum = classCurriculum;
	}
	public String getLastUpdated() {
		return lastUpdated;
	}
	public void setLastUpdated(String lastUpdated) {
		this.lastUpdated = lastUpdated;
	}
	@Override
	public String toString() {
		return "CulturalVO [classTitle=" + classTitle + ", category1=" + category1 + ", category2=" + category2
				+ ", category3=" + category3 + ", classPerson=" + classPerson + ", classFee=" + classFee
				+ ", classDuration=" + classDuration + ", costPerHour=" + costPerHour + ", cityName=" + cityName
				+ ", districtName=" + districtName + ", townName=" + townName + ", address=" + address
				+ ", classCurriculum=" + classCurriculum + ", lastUpdated=" + lastUpdated + "]";
	}
	
	
	

}
