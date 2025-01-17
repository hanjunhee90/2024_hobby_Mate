package com.hobby.my.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobby.my.board.dao.ICommentDAO;
import com.hobby.my.board.vo.CommentVO;

@Service
public class CommentService {
	
	@Autowired
    ICommentDAO commentDao;

    public ArrayList<CommentVO> getCommentsByBoardId(int boNo) {
        return commentDao.getCommentsByBoardId(boNo);
    }


    public int insertComment(CommentVO commentVO) {
        return commentDao.insertComment(commentVO);
    }


    public int deleteComment(int commentId) {
        return commentDao.deleteComment(commentId);
    }
    
    public CommentVO getCommentById(int commentId) {
    	return commentDao.getCommentById(commentId);
    }

}
