<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<!-- 마이페이지 폼 Start -->
<div class="container mt-5 py-5" id="mypage-form">
    <div class="row justify-content-center">
        <div class="col-12 col-md-10 d-flex flex-column flex-md-row align-items-center rounded border p-5" style="border-radius: 30px; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);">
            <div class="col-12 col-md-5 text-center mb-4 mb-md-0">
                <img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}" style="border-radius: 30%;" class="img-fluid" alt="Profile Image">
            </div>
            <div class="col-12 col-md-5 ms-md-5 me-md-4">
                <h2 class="text-center mb-4">마이페이지</h2>
                <form action="/updateProfile" method="post" enctype="multipart/form-data">
                    <div class="form-floating mb-4">
                        <input class="form-control" id="memId" name="memId" type="text" value="${sessionScope.login.memId }" readonly>
                        <label for="memId">아이디</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input class="form-control" id="memPass" name="memPass" type="password" value="********" readonly>
                        <label for="memPass">비밀번호</label>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-3 col-form-label">성별</label>
                        <div class="col-sm-9">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="memGender" id="genderMale" value="male" disabled 
                                       <c:if test="${sessionScope.login.memGender eq 'male'}">checked</c:if>>
                                <label class="form-check-label" for="genderMale">남성</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="memGender" id="genderFemale" value="female" disabled 
                                       <c:if test="${sessionScope.login.memGender eq 'female'}">checked</c:if>>
                                <label class="form-check-label" for="genderFemale">여성</label>
                            </div>
                        </div>
                    </div>
					<div class="form-floating mb-4">
						<input class="form-control" id="memNic" name="memNic" type="text" value="${sessionScope.login.memNic }">
						<label for="memNic">닉네임</label>
					</div>
					<!-- 프로필 이미지 업로드 -->
					<div class="form-floating mb-4">
						<input class="form-control" id="profileImg" name="profileImgFile" type="file" accept="image/*">
						<label for="profileImg">프로필 이미지</label>
					</div>
						
                    <div class="form-floating mb-4">
                        <input type="text" class="form-control" id="memJob" name="memJob" value="${sessionScope.login.memJob }">
                        <label for="memJob">직업</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="text" class="form-control" id="memBirth" name="memBirth" value="${sessionScope.login.memBirth }" readonly maxlength="11">
                        <label for="memBirth">생년월일</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input class="form-control" type="text" id="memMbti" value="${sessionScope.login.memMbti }">
                        <label for="memMbti">MBTI</label>
                           
                        
                    </div>
                    <div class="form-floating mb-4">
						<input type="text" class="form-control" id="memHob" placeholder="취미" name="memHob" value="${sessionScope.login.memHob }">
						<label for="memHob">취미</label>	
					</div>
                    <div class="mb-3 row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-secondary">정보 수정</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 마이페이지 폼 End -->

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>