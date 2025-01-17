package com.hobby.my.board.vo;

import com.hobby.my.common.vo.PagingVO;

public class SearchVO extends PagingVO {
	
	private String searchType;   // 검색 유형 (예: 제목, 작성자 등)
    private String searchCategory; // 검색 카테고리 (자유게시판, 질문게시판 등)
    private String searchWord;   // 검색어
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchCategory() {
		return searchCategory;
	}
	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", searchCategory=" + searchCategory + ", searchWord="
				+ searchWord + "]";
	}
   

}
