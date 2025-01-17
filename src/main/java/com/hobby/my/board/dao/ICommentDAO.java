package com.hobby.my.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.hobby.my.board.vo.CommentVO;

@Mapper
public interface ICommentDAO {
	
	// 댓글 목록 가져오기
    public ArrayList<CommentVO> getCommentsByBoardId(int boNo);
    
    // 댓글 등록
    public int insertComment(CommentVO commentVO);
    
    // 댓글 삭제
    public int deleteComment(int commentId);
    
    // 댓글 등록후 바로 조회
    public CommentVO getCommentById(int commentId);

}
