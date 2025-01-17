<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
</head>
<body>
	<%@ include file="/WEB-INF/inc/top.jsp"%>
<section class="page-section" id="contact">
    <div class="container mt-5 p-4" style="border: 1px solid #ddd; border-radius: 10px;">
        <div class="row">
            <!-- Profile Image Section -->
            <div class="col-md-4 text-center">
                <img src="${pageContext.request.contextPath}${board.profileImg}" alt="작성자 프로필 이미지" class="img-thumbnail mb-3" style="width: 100%; max-width: 300px; border-radius: 30%">
                <p>프로필</p>
            </div>

            <!-- Post Details Section -->
            <div class="col-md-8">
                <!-- Title and Views -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="text-primary">${board.boTitle}</h3>
                     <button class="btn btn-outline-info" disabled>
                        <img src="${pageContext.request.contextPath}/assets/img/hit.png" width="20"> 조회수: ${board.boHit}
                    </button>
                </div>

                <!-- Author and Likes -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <p><strong>작성자:</strong> ${board.boWriter}</p>
                    </div>
                    <div class="col-md-6 text-end">
				        <form  method="post" class="d-inline">
				            <input type="hidden" id="likeBoNo" name="boNo" value="${board.boNo}">
				            <button type="button" id="like-btn" class="btn btn-outline-success">
				                <img src="${pageContext.request.contextPath}/assets/img/like.png" width="20"> 좋아요: ${board.boLike}
				            </button>
				        </form>
				    </div>
                </div>

                <!-- Category and Dates -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <p><strong>분류:</strong> ${board.categoryName}</p>
                    </div>
                    <div class="col-md-6 d-flex justify-content-between">
                        <p><strong>작성일:</strong> ${board.boRegDate}</p>
                        <p><strong>수정일:</strong> ${board.boModDate}</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h5 class="text-muted">내용</h5>
                <textarea class="form-control" rows="10" readonly>${board.boContent}</textarea>
            </div>
        </div>

        <!-- Comment Section -->
        <div class="row mt-4">
            <div class="col-12">
                <h5 class="text-muted">댓글</h5>
                <ul class="list-group mb-3">
                    <c:forEach var="comment" items="${comments}">
                        <li class="list-group-item">
                            ${comment.content} - <strong>${comment.memId}</strong> <small>(${comment.regDate})</small>
                            <c:if test="${comment.memId == sessionScope.login.memId}">
		                        <button class="btn btn-danger btn-sm float-end delete-comment-btn" data-comment-id="${comment.commentId}">삭제</button>
		                    </c:if>
                        </li>
                    </c:forEach>
                </ul>

                <!-- Comment Form -->
               <form id="comment-form" method="post">
			    <textarea class="form-control mb-2" name="content" placeholder="댓글을 입력하세요" rows="3"></textarea>
			    <input type="hidden" name="boNo" value="${board.boNo}">
			    <input type="hidden" name="memId" value="${sessionScope.login.memId}">
			    <button type="submit" class="btn btn-secondary w-100">댓글 달기</button>
			</form>
            </div>
        </div>
    </div>
</section>
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
<script>

$('#like-btn').on('click', function(e) {
    $.ajax({
        url: '${pageContext.request.contextPath}' + "/like",  // 좋아요 처리 URL
        type: 'POST',
        data: {"boNo": $("#likeBoNo").val()},
        dataType: 'json',  // 서버에서 JSON 응답을 받을 준비
        success: function(response) {
            if (response.success) {
                // 서버에서 받은 좋아요 수로 UI 업데이트
                $('#like-btn').html('<img src="' + '${pageContext.request.contextPath}' + '/assets/img/like.png" width="20" class="liked-icon"> 좋아요: ' + response.newLikeCount);
            } else {
                alert(response.message || '좋아요 처리 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('좋아요 요청에 실패했습니다.');
        }
    });
});

$('#comment-form').on('submit', function(e) {
    e.preventDefault(); // 기본 폼 제출 동작을 방지합니다.

    console.log('폼 제출 이벤트 실행'); // 디버깅 로그

    // 폼 데이터를 직렬화해서 가져옵니다.
    const formData = $(this).serialize();

    $.ajax({
        url: '${pageContext.request.contextPath}/addComment',  // 서버 URL로 AJAX 요청을 보냅니다.
        type: 'POST',
        data: formData,
        // dataType 설정을 제거합니다.
        success: function(response) {
            console.log('서버 응답: ', response); // 디버깅을 위한 서버 응답 로그
            if (response.success) {
                // 새로운 댓글을 댓글 목록에 추가합니다.
                var newComment = 
                    "<li class='list-group-item'>" +
                        response.content + " - <strong>" + response.memId + "</strong> <small>(" + response.regDate + ")</small>" +
                        "<button class='btn btn-danger btn-sm float-end delete-comment-btn' data-comment-id='" + response.commentId + "'>삭제</button>" +
                    "</li>";
                
                // 댓글 리스트에 새 댓글을 추가합니다.
                $('.list-group').append(newComment);

                // 댓글 입력란을 초기화합니다.
                $('textarea[name="content"]').val('');
            } else {
                alert(response.message || '댓글 등록 중 오류가 발생했습니다.');
            }
        },
        error: function() {
            alert('댓글 등록 요청에 실패했습니다.');
        }
    });
});

$(document).on('click', '.delete-comment-btn', function() {
    const commentId = $(this).data('comment-id');

    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            url: '${pageContext.request.contextPath}/delComment',
            type: 'POST',
            data: { commentId: commentId },
            success: function(response) {
                if (response.success) {
                    $("button[data-comment-id='" + commentId + "']").closest('li').remove();
                } else {
                    alert(response.message || '댓글 삭제 중 오류가 발생했습니다.');
                }
            },
            error: function() {
                alert('댓글 삭제 요청에 실패했습니다.');
            }
        });
    }
});
</script>
</html>

