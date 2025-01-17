<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;500;600;700&family=Poppins:wght@200;300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Libraries Stylesheet -->
<link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${pageContext.request.contextPath}css/bootstrap.min.css" rel="stylesheet">
 <!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var currentPath = window.location.pathname;
        var navLinks = document.querySelectorAll('.nav-item.nav-link');

        navLinks.forEach(function(link) {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        });
    });
</script>
<!-- Navbar -->
<div class="container-fluid nav-bar p-0">
    <nav class="navbar navbar-expand-lg navbar-light bg-white px-4 px-lg-5 py-3 py-lg-0">
        <!-- 로고 -->
        <a href="${pageContext.request.contextPath}/" class="navbar-brand p-0 display-5 m-0" style="color: #FFC107;">
            <img src="${pageContext.request.contextPath}/assets/img/logo1.png" class="navbar-light navbar-brand img">Hobby Mate
        </a>
        
        <!-- 날씨 정보 -->
        <div class="navbar-text ms-4 me-auto">
            <img id="weather-icon" src="${pageContext.request.contextPath}/resources/images/default_weather.gif"  class="img-fluid" style="width: 30px; height: 30px;">
            <span id="weather-location"></span>
            <span id="weather-temperature"></span>
            <span id="weather-description"></span>
            <span id="latitude-info" hidden="hidden"></span>
            <span id="longitude-info" hidden="hidden"></span>
        </div>
        
        <!-- 모바일 토글 버튼 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		    <span class="fas fa-bars"></span> <!-- 작대기 3개로 된 햄버거 메뉴 아이콘 -->
		</button>
        
        <!-- 메뉴 항목들 -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <c:if test="${sessionScope.login == null}">
                    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">Home</a>
                    <a href="${pageContext.request.contextPath}/login" class="nav-item nav-link">Login</a>
                    <a href="${pageContext.request.contextPath}/regist" class="nav-item nav-link">Register</a>
                </c:if>
                <c:if test="${sessionScope.login != null}">
                    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">Home</a>
                    <a href="${pageContext.request.contextPath}/weather" class="nav-item nav-link">추천</a>
                    <a href="${pageContext.request.contextPath}/boardList" class="nav-item nav-link">게시판</a>
                    <a href="${pageContext.request.contextPath}/mypage" class="nav-item nav-link">${sessionScope.login.memId} 님</a>
                    <a href="${pageContext.request.contextPath}/logoutDo" class="nav-item nav-link">LogOut</a>
                </c:if>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar -->