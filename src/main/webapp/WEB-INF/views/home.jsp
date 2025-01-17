<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>HobbyMate</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 
<!-- 사진 슬라이드 -->
<div class="carousel-header">
    <div id="carouselId" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#carouselId" data-bs-slide-to="1"></li>
            <li data-bs-target="#carouselId" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <img src="assets/img/main1.jpg" class="img-fluid" alt="맞춤형 여가 추천 이미지">
                <div class="carousel-caption">
                    <div class="text-center p-4" style="max-width: 900px;">
                        <h4 class="text-white text-uppercase fw-bold mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.1s">맞춤형 여가 추천</h4>
                        <h2 class="display-2 text-capitalize text-white mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.3s">나만의 취미를 발견하세요!</h2>
                        <p class="text-white mb-4 mb-md-5 fs-5 wow fadeInUp" data-wow-delay="0.5s">성별, 나이, MBTI, 날씨 정보를 바탕으로 여가 활동을 추천받고, 나만의 취미를 즐겨보세요.</p>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5 wow fadeInUp" data-wow-delay="0.7s" href="#">더 알아보기</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/img/main2.jpg" class="img-fluid" alt="전국 축제 정보 이미지">
                <div class="carousel-caption">
                    <div class="text-center p-4" style="max-width: 900px;">
                        <h5 class="text-white text-uppercase fw-bold mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.1s">전국 축제 정보</h5>
                        <h2 class="display-2 text-capitalize text-white mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.3s">축제와 함께하는 특별한 순간</h2>
                        <p class="text-white mb-4 mb-md-5 fs-5 wow fadeInUp" data-wow-delay="0.5s">전국의 다양한 축제 정보를 확인하고, 다채로운 문화 경험을 즐기세요.</p>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5 wow fadeInUp" data-wow-delay="0.7s" href="#">더 알아보기</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="assets/img/main3.jpg" class="img-fluid" alt="원데이 클래스 정보 이미지">
                <div class="carousel-caption">
                    <div class="text-center p-4" style="max-width: 900px;">
                        <h5 class="text-white text-uppercase fw-bold mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.1s">원데이 클래스 정보</h5>
                        <h2 class="display-2 text-capitalize text-white mb-3 mb-md-4 wow fadeInUp" data-wow-delay="0.3s">새로운 취미를 시작해보세요!</h2>
                        <p class="text-white mb-4 mb-md-5 fs-5 wow fadeInUp" data-wow-delay="0.5s">다양한 원데이 클래스를 통해 새로운 스킬과 경험을 쌓아보세요.</p>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5 wow fadeInUp" data-wow-delay="0.7s" href="#">더 알아보기</a>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bs-second wow fadeInLeft" data-wow-delay="0.2s" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
            <span class="carousel-control-next-icon bg-yellow wow fadeInRight" data-wow-delay="0.2s" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!-- 슬라이드 end -->

<!-- 사용자 후기 Start -->
<div class="container-fluid testimonial overflow-hidden pb-5">
    <div class="container py-5">
        <div class="section-title text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="sub-style">
                <h5 class="sub-title text-primary px-3">인기 게시물</h5>
            </div>
            <h2 class="display-4 mb-4">가장 많은 좋아요를 받은 게시물</h2>
            <p class="mb-0">사용자들이 좋아요를 많이 누른 게시물을 확인하고, 그들이 경험한 이야기들을 만나보세요!</p>
        </div>
        <div class="owl-carousel testimonial-carousel wow zoomInDown" data-wow-delay="0.2s">
            <c:forEach var="board" items="${boardList}">
                <div class="testimonial-item">
                    <div class="testimonial-content p-4 mb-5">
                        <p class="fs-5 mb-0">${board.boContent}</p>

                    </div>
                    <div class="d-flex">
                        <div class="rounded-circle me-4" style="width: 100px; height: 100px;">
                            <img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}${board.profileImg}" alt="${board.boWriter} 사진">
                        </div>
                        <div class="my-auto">
                            <h5>${board.boWriter}</h5>
                            <p class="mb-0">좋아요: ${board.boLike}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- 사용자 후기 End -->
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
  <script>
        $(document).ready(function () {
            let maxHeight = 0;
            $('.testimonial-content').each(function () {
                let currentHeight = $(this).height();
                if (currentHeight > maxHeight) {
                    maxHeight = currentHeight;
                }
            });
            $('.testimonial-content').height(maxHeight);
        });
    </script>
</html>
