package com.hobby.my.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.hobby.my.board.vo.BoardVO;
import com.hobby.my.board.vo.CategoryVO;
import com.hobby.my.board.vo.LikeVO;
import com.hobby.my.board.vo.SearchVO;

@Mapper
public interface IBoardDAO {
	
	// 메인 홈페이지 에서 좋아요 높은순으로 게시글 보여주기
	public ArrayList<BoardVO> mainBoard();
	
    // 게시판 목록 조회 (검색 + 페이징)
	public ArrayList<BoardVO> getBoardList(SearchVO searchVO);

    // 총 레코드 수 조회 (검색 포함)
    public int getTotalRowCount(SearchVO searchVO);

    // 게시물 상세 조회
    public BoardVO getBoard(int boNo);

    // 게시물 등록
    public int insertBoard(BoardVO boardVO);

    // 조회수 증가
    public int updateHit(int boNo);
    
    
    public ArrayList<CategoryVO> getCategory();
    
    // board like 카운트
    public int selectLike(int boNo);
    
    // board의 like 수 업데이트
    public int updateBoardLike(int boNo);

    // 좋아요 중복체크
    //public int selectLikeCount(LikeVO likeVO);
}
