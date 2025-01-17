package com.hobby.my.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobby.my.board.dao.IBoardDAO;
import com.hobby.my.board.vo.BoardVO;
import com.hobby.my.board.vo.CategoryVO;
import com.hobby.my.board.vo.SearchVO;

@Service
public class BoardService {
	
	@Autowired
	IBoardDAO boardDao;
	
	// 메인 홈페이지 에서 좋아요 높은순으로 게시글 보여주기
	public ArrayList<BoardVO> mainBoard(){
		return boardDao.mainBoard();
	}
	
	// 게시판 목록 조회 (검색 + 페이징)
	public ArrayList<BoardVO> getBoardList(SearchVO searchVO) {
		int totalRowCount = boardDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		// 검색 조건으로 검색된 전체 건수를 기준으로 세팅!
		searchVO.pageSetting();
		return boardDao.getBoardList(searchVO);

	}

    // 특정 게시물의 상세 정보를 조회하는 메서드
    public BoardVO getBoard(int boNo) {
        return boardDao.getBoard(boNo);
    }

    // 새로운 게시물을 등록하는 메서드
    public void insertBoard(BoardVO boardVO) {
        boardDao.insertBoard(boardVO);
    }

    // 조회수를 증가시키는 메서드
    public void updateHit(int boNo) {
        boardDao.updateHit(boNo);
    }
    
    public ArrayList<CategoryVO> getCategory() {
    	return boardDao.getCategory();
    }
    
    // boardLike 테이블 인서트
    public int selectLike(int boNo) {
    	return boardDao.selectLike(boNo);
    }
    
    // board의 like 수 업데이트
    public int updateBoardLike(int boNo) {
    	return boardDao.updateBoardLike(boNo);
    }

    // 좋아요 중복체크
	/*
	 * public boolean isAlreadyLiked(LikeVO likeVO) { return
	 * boardDao.selectLikeCount(likeVO) > 0; }
	 */
}
