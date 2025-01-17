<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- content의 내용이 적어도 foot가 고정되있도록 -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex-grow: 1;
        }
        footer {
            margin-top: auto;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<!-- 로그인 폼 Start -->
<div class="container mt-5 py-5" id="login-form">
    <div class="row justify-content-center">
        <div class="col-12 col-md-10 d-flex flex-column flex-md-row align-items-center rounded border p-5" style="border-radius: 30px; box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.15);">
            <div class="col-12 col-md-5 text-center mb-4 mb-md-0" style="background-color: rgb(179, 246, 140); border-radius: 10%;">
                <img src="assets/img/logo3.png" class="img-fluid" alt="HobbyMate Logo">
            </div>
            <div class="col-12 col-md-5 ms-md-5 me-md-4">
                <h2 class="text-center mb-4">로그인</h2>
                <form method="post" action="/loginDo">
                    <div class="form-floating mb-4">
                        <input class="form-control" id="memId" name="memId" type="text" placeholder="아이디를 입력하세요">
                        <label for="login-id">아이디</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input class="form-control" id="memPw" name="memPw" type="password" placeholder="비밀번호를 입력하세요">
                        <label for="login-password">비밀번호</label>
                    </div>
                    <div class="mb-4 row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-outline-primary w-100 py-2" style="border-radius: 25px; font-weight: 600;">로그인</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 로그인 폼 End -->


<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
</html>