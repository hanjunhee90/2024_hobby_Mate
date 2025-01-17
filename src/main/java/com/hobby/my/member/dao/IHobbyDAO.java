package com.hobby.my.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hobby.my.member.vo.HobbyVO;

@Mapper
public interface IHobbyDAO {
	
	public void insertHobby(HobbyVO hobbyVO);
	
	public int getLastInsertedHobbyId();
	
	public void insertMemberHobby(@Param("memId") String memId, @Param("hobbyId") int hobbyId);

}
