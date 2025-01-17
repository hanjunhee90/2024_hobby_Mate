package com.hobby.my.board.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobby.my.board.service.BoardService;
import com.hobby.my.board.service.CommentService;
import com.hobby.my.board.vo.BoardVO;
import com.hobby.my.board.vo.CategoryVO;
import com.hobby.my.board.vo.CommentVO;
import com.hobby.my.board.vo.LikeVO;
import com.hobby.my.board.vo.SearchVO;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	@Autowired
	CommentService comService;

	@ModelAttribute("comList")
	public ArrayList<CategoryVO> getCategory() {
		return boardService.getCategory(); // 게시판 관련
	}
	
	@RequestMapping("/boardList")
	public String getBoardList(Model model, @ModelAttribute("searchVO") SearchVO searchVO) {
		 // searchCategory와 searchWord가 null인 경우 기본 처리
	    if (searchVO.getSearchCategory() == null) {
	        searchVO.setSearchCategory("");  // 전체 카테고리로 설정
	    }

	    if (searchVO.getSearchWord() == null) {
	        searchVO.setSearchWord("");  // 빈 검색어 처리
	    }

	    // 나머지 검색 및 로직 처리
	    // 예시: 검색 결과 조회 및 모델에 저장
	    ArrayList<BoardVO> boardList = boardService.getBoardList(searchVO);
	    model.addAttribute("boardList", boardList);
	    return "board/boardList";
	
	}

	// Controller
	// 특정 게시물을 조회하는 메서드 게시글 상세(상세 보기)
	@GetMapping("/boardView")
	public String getBoardView(int boNo, @RequestParam(value = "isRead", required = false, defaultValue = "true") boolean isRead, Model model) {
		BoardVO board = boardService.getBoard(boNo);
		model.addAttribute("board", board);
		// 조회수 업데이트 (isRead가 true일 경우에만)
	    if (isRead) {
	        boardService.updateHit(boNo);
	    }

	    // 해당 게시물에 대한 댓글 리스트 가져오기
	    ArrayList<CommentVO> comments = comService.getCommentsByBoardId(boNo);
	    model.addAttribute("comments", comments);
	    return "board/boardView";
	}

	// 게시물 작성 페이지로 이동
	@GetMapping("/boardForm")
	public String boardForm() {
		return "board/boardForm"; // 게시물 작성 페이지로 이동 (JSP)
	}

	// 게시물 작성 (POST)
	@RequestMapping("/insertBoard")
	public String insertBoard(@ModelAttribute("boardVO") BoardVO boardVO) {
		boardService.insertBoard(boardVO);
		return "redirect:/boardList"; // 게시물 등록 후 목록 페이지로 리다이렉트
	}

	
	 
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateLike(int boNo) {
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	        // 좋아요 수 업데이트
	        boardService.updateBoardLike(boNo);

	        // 업데이트된 좋아요 수를 가져옴
	        int newLikeCount = boardService.selectLike(boNo);
	        
	        // 응답에 성공 여부와 새로운 좋아요 수 포함
	        result.put("success", true);
	        result.put("newLikeCount", newLikeCount);
	    } catch (Exception e) {
	        result.put("success", false);  // 에러가 발생했을 때
	        result.put("message", "좋아요 처리 중 오류가 발생했습니다.");
	    }
	    
	    return result;  // JSON 형식으로 응답
	}
}
