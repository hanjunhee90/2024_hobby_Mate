package com.hobby.my.member.vo;

public class HobbyVO {
	
	 private int hobbyId;     // 취미 ID
	 private String hobbyName; // 취미 이름
	 
	public int getHobbyId() {
		return hobbyId;
	}
	public void setHobbyId(int hobbyId) {
		this.hobbyId = hobbyId;
	}
	public String getHobbyName() {
		return hobbyName;
	}
	public void setHobbyName(String hobbyName) {
		this.hobbyName = hobbyName;
	}
	
	@Override
	public String toString() {
		return "hobbyVO [hobbyId=" + hobbyId + ", hobbyName=" + hobbyName + "]";
	}
	
}
