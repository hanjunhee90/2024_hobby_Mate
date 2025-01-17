package com.hobby.my.board.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobby.my.board.service.CommentService;
import com.hobby.my.board.vo.CommentVO;

@Controller
public class CommentController {

	@Autowired
	CommentService comService;

	@PostMapping("/addComment")
	@ResponseBody
	public Map<String, Object> addComment(CommentVO commentVO) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        // 댓글 저장
	        comService.insertComment(commentVO);
	        
	        // 방금 저장한 댓글을 다시 조회하여 가져옴 (자동 생성된 regDate 등을 포함하여)
	        CommentVO savedComment = comService.getCommentById(commentVO.getCommentId());

	        // 응답 데이터에 등록된 댓글 정보 포함
	        result.put("success", true);
	        result.put("content", savedComment.getContent());
	        result.put("memId", savedComment.getMemId());
	        result.put("regDate", savedComment.getRegDate());
	        result.put("commentId", savedComment.getCommentId());  // 삭제 시 사용하기 위해 필요
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "댓글 등록 중 오류가 발생했습니다.");
	    }
	    return result;
	}

	@PostMapping("/delComment")
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestParam("commentId") int commentId) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        comService.deleteComment(commentId);
	        result.put("success", true);
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "댓글 삭제 중 오류가 발생했습니다.");
	    }
	    return result;
	}
}
