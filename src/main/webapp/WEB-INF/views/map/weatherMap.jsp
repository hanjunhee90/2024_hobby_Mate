<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보와 추천 활동</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .map-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
    }
    
    #map {
        width: 90%; /* 고정된 너비를 주어 중앙에 위치하게 함 */
        height: 600px;
        border-radius: 20px;
        background-color: #f0f0f0;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<!-- 내 위치를 중심으로 지도 그리기 -->
<div id="map" class="container mt-3 d-flex justify-content-center"></div>

<!-- 버튼 추가 -->
<div class="text-center mt-4">
    <button id="getActivityData" class="btn">Activity시설</button>
    <button id="getSportsData" class="btn">스포츠시설</button>
</div>

<div class="text-center mt-4">
	<button id="getClassData" class="btn btn-success me-2">클래스 정보 조회</button>
    <button id="getClubData" class="btn btn-warning">클럽 정보 조회</button>
</div>

<div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-md-6">
            <h5 class="text-center">클래스 정보</h5>
            <ul id="classInfoList" class="list-group"></ul>
            <button id="loadMoreClass" class="btn btn-outline-primary mt-2 w-100">더보기</button>
        </div>
        <div class="col-md-6">
            <h5 class="text-center">클럽 정보</h5>
            <ul id="clubInfoList" class="list-group"></ul>
            <button id="loadMoreClub" class="btn btn-outline-secondary mt-2 w-100">더보기</button>
        </div>
    </div>
</div>

<!-- 실제 지도를 그리는 Javascript API를 불러오기 && services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=539b508df6c017894a2691b6cfff05ce&libraries=services,clusterer,drawing"></script>

<!-- 지도를 띄우는 코드 작성 -->
<script>
    var container = document.getElementById('map'); // 지도를 표시할 div 
    var map, openInfowindow = null; // 전역 변수로 지도, 열려있는 인포윈도우 객체 선언
    var markers = []; // 지도에 표시된 모든 마커를 관리하는 배열
    var currentClassIndex = 0; // 클래스 정보 페이지 인덱스
    var currentClubIndex = 0; // 클럽 정보 페이지 인덱스
    const PAGE_SIZE = 10; // 한 번에 로드할 아이템 개수

    // 현재 위치 가져오기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var lat = position.coords.latitude; // 위도
            var lng = position.coords.longitude; // 경도

            // 지도의 중심 좌표 설정
            var options = {
                center: new kakao.maps.LatLng(lat, lng), // 현재 위치를 중심 좌표로 설정
                level: 6
            };

            // 지도 생성
            map = new kakao.maps.Map(container, options);

            // 현재 위치에 기본 마커 추가
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                map: map
            });

        }, function (error) {
            console.error('Geolocation error:', error);
        });
    } else {
        alert('Geolocation is not supported by this browser.');
    }

    // 버튼 클릭 시 서버에 요청을 보내서 활동 정보를 지도에 표시
    document.getElementById('getActivityData').addEventListener('click', function () {
        requestActivityData('activityList', 'blue');
    });

    document.getElementById('getSportsData').addEventListener('click', function () {
        requestActivityData('sportsList', 'red');
    });
    
    document.getElementById('getClassData').addEventListener('click', function () {
        loadClassData();
    });

    document.getElementById('getClubData').addEventListener('click', function () {
        loadClubData();
    });

    document.getElementById('loadMoreClass').addEventListener('click', function () {
        loadClassData();
    });

    document.getElementById('loadMoreClub').addEventListener('click', function () {
        loadClubData();
    });

    // 서버에 요청을 보내는 함수
    function requestActivityData(listType, markerColor) {
        // 기존 마커 제거
        markers.forEach(function(marker) {
            marker.setMap(null);
        });
        markers = []; // 마커 배열 초기화

        // 위도와 경도 가져오기
        var userLat = document.getElementById('latitude-info').textContent;
        var userLon = document.getElementById('longitude-info').textContent;

        // AJAX 요청 보내기
        $.ajax({
            url: '/submitWeather',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                latitude: userLat,
                longitude: userLon,
                cityName: 'Daejeon' // 예시로 도시 이름을 설정 (원하는 값으로 수정 가능)
            }),
            success: function (response) {
                console.log("받은 데이터:", response);

                // 활동 리스트 가져오기
                const dataList = response[listType];

                // 활동 정보를 지도에 표시
                addMarkers(dataList, markerColor);
                console.log(dataList);
            },
            error: function (error) {
                console.error("서버 요청 실패:", error);
            }
        });
    }

    // 활동 정보를 지도에 마커로 표시하는 함수
    function addMarkers(dataList, markerColor) {
        if (dataList && dataList.length > 0) {
            dataList.forEach(function (item) {
                var latitude = parseFloat(item.lcLa);
                var longitude = parseFloat(item.lcLo);
                var coords = new kakao.maps.LatLng(latitude, longitude);

                // 기본 마커 생성 (색상 변경 없이 기본 마커 사용)
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords,
                    image: new kakao.maps.MarkerImage(
                        'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
                        new kakao.maps.Size(24, 35),
                        {
                            offset: new kakao.maps.Point(12, 35)
                        }
                    )
                });
                markers.push(marker); // 마커 배열에 추가

                // 인포윈도우 설정
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:200px;text-align:center;padding:10px;">' +
                        '<strong>시설명 :' + (item.fcltyNm || item.poiNm) + '</strong><br>' +
                        '분류: ' + (item.ctgryThreeNm || item.clNm) + '</div>'
                });

                // 마커 클릭 시 인포윈도우 표시/닫기
                kakao.maps.event.addListener(marker, 'click', function () {
                    if (openInfowindow) {
                        openInfowindow.close(); // 다른 인포윈도우가 열려 있으면 닫기
                    }

                    if (openInfowindow !== infowindow) { // 클릭된 인포윈도우가 현재 열린 인포윈도우와 다르면
                        infowindow.open(map, marker); // 인포윈도우 열기
                        openInfowindow = infowindow;  // 현재 열린 인포윈도우를 기록
                    } else {
                        openInfowindow = null;  // 같은 마커 클릭 시 닫힌 상태로 변경
                    }
                });
            });
        } else {
            console.warn("활동 정보가 없습니다.");
        }        
        
    }
    
 // 클래스 정보 불러오기 함수
    function loadClassData() {
        $.ajax({
            url: '/submitWeather',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                latitude: document.getElementById('latitude-info').textContent,
                longitude: document.getElementById('longitude-info').textContent,
                cityName: 'Daejeon'
            }),
            success: function (response) {
                const classList = response.classList;
                let html = '';
                for (let i = currentClassIndex; i < currentClassIndex + PAGE_SIZE && i < classList.length; i++) {
                    html += '<li class="list-group-item">클래스 이름: ' + classList[i].classTitle + '</br> 종류: ' + classList[i].category3 + '</br>주소:' +classList[i].address+'</li>';
                    		
                }
                $('#classInfoList').append(html);
                currentClassIndex += PAGE_SIZE;
            },
            error: function (error) {
                console.error("클래스 정보 요청 실패:", error);
            }
        });
    }

    // 클럽 정보 불러오기 함수
    function loadClubData() {
        $.ajax({
            url: '/submitWeather',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                latitude: document.getElementById('latitude-info').textContent,
                longitude: document.getElementById('longitude-info').textContent,
                cityName: 'Daejeon'
            }),
            success: function (response) {
                const clubList = response.clubList;
                let html = '';
                for (let i = currentClubIndex; i < currentClubIndex + PAGE_SIZE && i < clubList.length; i++) {
                    html += '<li class="list-group-item">업체명: ' + clubList[i].clubNm + '</br> 종목명: ' + clubList[i].itemNm + '</br>주소: '+clubList[i].signguNm+'</li>';
                }
                $('#clubInfoList').append(html);
                currentClubIndex += PAGE_SIZE;
            },
            error: function (error) {
                console.error("클럽 정보 요청 실패:", error);
            }
        });
    }
</script>
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>

</html>
