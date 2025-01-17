<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>class room</title>
<style>
	.table-hover tbody tr:hover {
		cursor: pointer;
		background-color: #f1f1f1;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<div class="container mt-5">
    <h2 class="text-center mb-4">클래스 검색</h2>
    
    <!-- 검색 폼 -->
    <form id="searchForm">
        <div class="row mb-3">
            <div class="col-md-5">
                <input type="text" id="category3Input" class="form-control" placeholder="카테고리3로 검색 (예: 악기)">
            </div>
            <div class="col-md-5">
                <input type="text" id="addressInput" class="form-control" placeholder="주소로 검색 (예: 서울)">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </div>
    </form>

    <!-- 검색 결과 테이블 -->
    <table class="table table-hover">
        <thead>
            <tr>
                <th>클래스 타이틀</th>
                <th>카테고리3</th>
                <th>주소</th>
            </tr>
        </thead>
        <tbody id="resultTable">
            <!-- 검색된 결과가 여기에 표시됩니다 -->
        </tbody>
    </table>
</div>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>