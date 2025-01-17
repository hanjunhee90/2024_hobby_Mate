package com.hobby.my.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.hobby.my.member.vo.MbtiVO;
import com.hobby.my.member.vo.MemberVO;

//Mybatis에서 Mapper 인터페이스임을 나타내는 어노테이션
//SQL 쿼리와 Java 객체 간의 매핑을 자동으로 처리함.
@Mapper         // mapper에 namespace와 매핑됨.
public interface IMemberDAO {
	
	public int registMember(MemberVO memberVO);
	
	public ArrayList<MbtiVO> mbtiList();
	
	public MemberVO loginMember(MemberVO memberVO);
	
	public void updateMember(MemberVO memberVO);
	
	public int checkId(String memId);
	

}
