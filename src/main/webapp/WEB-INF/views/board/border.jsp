<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<!-- 자유 게시판 테이블 -->
<table class="table table-hover">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>수정일</th>
            <th>좋아요</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.boardNo}</td>
                <td><a href="<c:url value='/getBoard?boardNo=${board.boardNo}' />">${board.boardTitle}</a></td>
                <td>${board.memNm}</td>
                <td>${board.updateDt}</td>
                <td>
                    <button type="button" class="btn btn-outline-primary btn-sm like-btn" data-board-no="${board.boardNo}">
                        <i class="fas fa-thumbs-up"></i> ${board.likeCount}
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
<!-- 자유게시판 좋아요 -->
<script>
$(document).ready(function() {
    $('.like-btn').on('click', function() {
        const boardNo = $(this).data('board-no');
        $.ajax({
            url: '/likeBoard',
            type: 'POST',
            data: { boardNo: boardNo },
            success: function(response) {
                if (response.success) {
                    // 좋아요 수 업데이트
                    const likeButton = $(`button[data-board-no="${boardNo}"]`);
                    let currentCount = parseInt(likeButton.text().trim());
                    likeButton.html(`<i class="fas fa-thumbs-up"></i> ${currentCount + 1}`);
                } else {
                    alert('좋아요 처리에 실패했습니다.');
                }
            }
        });
    });
});
</script>
</html>