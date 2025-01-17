<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 
<div class="content" style="min-height: calc(100vh - 200px);">
    <section class="page-section" id="boardForm-section">
        <div class="container mt-5 p-4" style="border: 1px solid #ddd; border-radius: 10px;">
            <h3 class="text-center mb-4">게시글 작성</h3>

            <form action="<c:url value='/insertBoard'/>" method="post">
                <!-- 제목 -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="boTitle" name="boTitle" placeholder="제목을 입력하세요" required>
                    <label for="boTitle">제목</label>
                </div>

                <!-- 작성자 -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="boWriter" name="boWriter" value="${sessionScope.login.memNic}" readonly>
                    <label for="boWriter">작성자</label>
                </div>

				<!-- 분류 (카테고리 선택) -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="boCategory" name="boCategory" required>
                        <option value="">분류를 선택하세요</option>
                        <c:forEach var="code" items="${comList}">
                            <option value="${code.categoryId}">${code.categoryName}</option>
                        </c:forEach>
                    </select>
                    <label for="boCategory">분류</label>
                </div>

                <!-- 내용 -->
                <div class="form-floating mb-3">
                    <textarea class="form-control" id="boContent" name="boContent" placeholder="내용을 입력하세요" style="height: 200px;" required></textarea>
                    <label for="boContent">내용</label>
                </div>

                <!-- 버튼 -->
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="submit" class="btn btn-secondary">작성 완료</button>
                    <a href="<c:url value='/boardList'/>" class="btn btn-secondary ms-2">취소</a>
                </div>
            </form>
        </div>
    </section>
</div>
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>