(function ($) {
    "use strict";
    
    // Initiate the wowjs
    // WOW.js 라이브러리를 초기화하여 스크롤 애니메이션을 활성화
    new WOW().init();

    // Sticky Navbar
    // 사용자가 스크롤할 때 네비게이션 바에 'sticky-top' 및 'shadow-sm' 클래스를 추가/제거하여 스티키 헤더 효과 적용
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $('.nav-bar').addClass('sticky-top shadow-sm'); // 스크롤이 45px 이상이면 고정된 네비게이션 바로 변경
        } else {
            $('.nav-bar').removeClass('sticky-top shadow-sm'); // 스크롤이 45px 이하이면 원래 상태로 돌아옴
        }
    });

    // Testimonial-carousel
    // Owl Carousel 라이브러리를 사용하여 추천사 섹션에 슬라이더 효과를 적용
    $(".testimonial-carousel").owlCarousel({
        autoplay: true, // 자동 슬라이더 재생
        autoplayTimeout: 5000, // 슬라이드 전환 간격을 5000ms (5초)로 설정
        smartSpeed: 1000, // 슬라이드 전환 속도를 1000ms로 설정
        center: false, // 슬라이드 중앙 정렬 비활성화
        dots: false, // 페이지 네비게이션 점을 숨김
        loop: true, // 무한 반복 슬라이더 활성화
        margin: 25, // 슬라이드 사이의 여백을 25px로 설정
        nav: true, // 이전/다음 화살표 버튼을 표시
        navText: [
            '<i class="bi bi-arrow-left"></i>', // 이전 버튼 아이콘 (Bootstrap 아이콘 사용)
            '<i class="bi bi-arrow-right"></i>' // 다음 버튼 아이콘 (Bootstrap 아이콘 사용)
        ],
        responsiveClass: true, // 반응형 옵션 활성화
        responsive: { // 화면 크기에 따른 아이템 개수 설정
            0: {
                items: 1 // 화면 너비 0px 이상에서는 아이템 1개
            },
            576: {
                items: 2 // 화면 너비 576px 이상에서는 아이템 2개
            },
            768: {
                items: 3 // 화면 너비 768px 이상에서는 아이템 3개
            },
            992: {
                items: 3 // 화면 너비 992px 이상에서는 아이템 3개
            },
            1200: {
                items: 3 // 화면 너비 1200px 이상에서는 아이템 3개
            }
        }
    });

})(jQuery);