<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Regist</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

	<!-- 회원가입 폼 Start -->
	<div class="container mt-5 py-5" id="signup-form">
		<div class="row justify-content-center">
			<div
				class="col-12 col-md-10 d-flex flex-column flex-md-row align-items-center rounded border p-5"
				style="border-radius: 30px; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);">
				<div class="col-12 col-md-5 text-center mb-4 mb-md-0">
					<img src="assets/img/logo5.png" class="img-fluid"
						alt="HobbyMate Logo">
				</div>
				<div class="col-12 col-md-5 ms-md-5 me-md-4">
					<h2 class="text-center mb-4">회원가입</h2>
					<form action="/registDo" method="post" enctype="multipart/form-data">
						<div class="input-group mb-4">
							<div class="form-floating flex-grow-1">
								<input class="form-control" id="memId" name="memId" type="text"
									placeholder="아이디를 입력하세요"> <label for="memId">아이디</label>
							</div>
							<button class="btn btn-secondary ms-2" type="button"
								id="check-id-btn" style="border-radius: 20px;">중복 확인</button>
							<small id="id-check-msg" class="ms-2"></small>
						</div>

						<div class="input-group mb-4">
							<div class="form-floating flex-grow-1">
								<input class="form-control" id="memNic" name="memNic"
									type="text" placeholder="닉네임을 입력하세요"> <label
									for="memNic">닉네임</label>
							</div>
						</div>
						<div class="form-floating mb-4">
							<input class="form-control" id="memPw" name="memPw"
								type="password" placeholder="비밀번호를 입력하세요"> <label
								for="memPw">비밀번호</label>
						</div>
						<div class="form-floating mb-4">
							<input class="form-control" id="signup-password-confirm"
								type="password" placeholder="비밀번호를 다시 입력하세요"> <label
								for="signup-password-confirm">비밀번호 확인</label>
							<small id="pw-check-msg" class="ms-2"></small>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">성별</label>
							<div class="col-sm-9">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="memGender"
										id="genderMale" value="male"> <label
										class="form-check-label" for="genderMale">남성</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="memGender"
										id="genderFemale" value="female"> <label
										class="form-check-label" for="genderFemale">여성</label>
								</div>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">MBTI</label>
							<div class="col-sm-9">
								<select class="form-select" id="mbti" name="memMbti">
									<option>선택하세요</option>
									<c:forEach items="${mbtiList}" var="mbti">
										<option value="${mbti.mbtiCode}">${mbti.mbtiCode}:
											${mbti.mbtiKeywords}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-floating mb-4">
							<input type="date" class="form-control" id="memBirth" name="memBirth" placeholder="생년월일">
							<label for="memBirth">생년월일</label>
						</div>
						<div class="form-floating mb-4">
							<input type="text" class="form-control" id="memJob" placeholder="직업" name="memJob">
							<label for="memJob">직업</label>
						</div>
						<input type="hidden" name="profileImg" value="${pageContext.request.contextPath}/assets/img/non.png">
						<div class="form-floating mb-4">
							<input type="text" class="form-control" id="memHob" placeholder="취미" name="memHob">
							<label for="memHob">취미</label>	
						</div>
						<div class="mb-3 row">
							<div class="col-sm-12">
								<button type="submit" id="registBtn"
									class="btn btn-outline-primary w-100 py-2"
									style="border-radius: 25px; font-weight: 600;">회원가입</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원가입 폼 End -->

	<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
<script>
/* 버튼 추가를 위한 스크립트 */
/* 	$('#addHobbyBtn').on('click', function () {
	    const hobbyList = $('#hobby-list');
	    const newHobby = $(
	        '<div class="input-group mb-2">' +
	            '<input type="text" class="form-control" name="hobbyNames" placeholder="취미를 입력하세요">' +
	            '<button class="btn btn-danger delBtn" type="button">-</button>' +
	        '</div>'
	    );
	    hobbyList.append(newHobby);
	
	    newHobby.find('.delBtn').on('click', function () {
	        newHobby.remove();
	    });
	}); */
	// 아이디 중복 체크 버튼 클릭 시 로직
	$('#check-id-btn').on('click', function () {
	    const memId = $('#memId').val();
	    if (memId) {
	        $.ajax({
	            url: '/checkId',
	            type: 'POST',
	            data: { memId: memId },
	            success: function (response) {
	                if (response === 0) {
	                    $('#id-check-msg').text('사용 가능한 아이디입니다.').css('color', 'green');
	                } else {
	                    $('#id-check-msg').text('이미 사용 중인 아이디입니다.').css('color', 'red');
	                }
	            },
	            error: function () {
	                $('#id-check-msg').text('오류가 발생했습니다. 다시 시도해주세요.').css('color', 'red');
	            }
	        });
	    } else {
	        $('#id-check-msg').text('아이디를 입력해주세요.').css('color', 'red');
	    }
	});

	// 비밀번호 일치 여부 체크 로직
	$('#signup-password-confirm').on('keyup', function () {
	    const password = $('#memPw').val();
	    const confirmPassword = $('#signup-password-confirm').val();

	    if (password !== confirmPassword) {
	        $('#pw-check-msg').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
	    } else {
	        $('#pw-check-msg').text('비밀번호가 일치합니다.').css('color', 'green');
	    }
	});
   
</script>
</html>