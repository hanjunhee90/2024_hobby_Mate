package com.hobby.my.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hobby.my.member.dao.IMemberDAO;
import com.hobby.my.member.vo.MbtiVO;
import com.hobby.my.member.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	IMemberDAO memDao;
	
	/**
	 * 회원 가입 
	 * @throws Exception 
	 * */
	@Transactional
	public void registerMember(MemberVO memberVO) throws Exception {

		 // 1. 회원 정보 저장
		 memDao.registMember(memberVO);

	}
	
	// mbti 리스트 호출
	public ArrayList<MbtiVO> mbtiList() {
		
		return memDao.mbtiList();
	}
	
	// 로그인
	public MemberVO loginMember(MemberVO memberVO) throws Exception {
		MemberVO user = memDao.loginMember(memberVO);
		if(user == null) {
			throw new Exception();
		}
		
		return user;
	}
	
	 // 회원 정보 업데이트
    public void updateMember(MemberVO memberVO) {
        memDao.updateMember(memberVO);
    }
    
    // 아이디 중복체크
    public int checkId(String memId) {
    	return memDao.checkId(memId);
    }

}

