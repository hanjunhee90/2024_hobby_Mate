<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보와 추천 활동</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

<div class="container mt-5">
    <h2 class="text-center mb-4">현재 위치의 날씨와 추천 정보</h2>

    <div class="row">
        <!-- 날씨 정보 및 추천 -->
        <div class="col-md-6">
            <form id="weatherForm" method="post" action="/submitWeather">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title" id="locationName">위치: </h5>
                        <ul class="list-group">
                            <li class="list-group-item" id="weatherMain">날씨 상태: </li>
                            <li class="list-group-item" id="weatherDescription">날씨 설명: </li>
                            <li class="list-group-item" id="temperature">온도: </li>
                            <li class="list-group-item" id="feelsLike">체감 온도: </li>
                            <li class="list-group-item" id="humidity">습도: </li>
                            <li class="list-group-item" id="windSpeed">풍속: </li>
                            <li class="list-group-item" id="windDeg">풍향: </li>
                        </ul>
                        
                        <!-- 숨겨진 input 필드에 데이터 저장 -->
                        <input type="hidden" name="cityName" id="cityName">
                        <input type="hidden" name="latitude" id="latitude">
                        <input type="hidden" name="longitude" id="longitude">
                        <button type="submit" class="btn btn-primary mt-3 w-100">날씨 및 추천 정보 제출</button>
                    </div>
                </div>
            </form>
        </div>
</div>
        <!-- 추천 리스트 -->
        <div class="col-md-6">
            <h4>추천 정보</h4>
            <div id="accordion">
                <!-- 스포츠 정보 아코디언 -->
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                스포츠 정보
                            </button>
                        </h5>
                    </div>
                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <c:forEach var="sport" items="${sportsList}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="sport-${sport.poiNm}" value="${sport.lcLa},${sport.lcLo}">
                                    <label class="form-check-label" for="sport-${sport.poiNm}">${sport.poiNm} (${sport.clNm})</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- 문화 클래스 아코디언 -->
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                문화 클래스
                            </button>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            <c:forEach var="classList" items="${classList}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="class-${classList.classTitle}" value="${classList.address}">
                                    <label class="form-check-label" for="class-${classList.classTitle}">${classList.classTitle} (${classList.category3})</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- 액티비티 아코디언 -->
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                액티비티
                            </button>
                        </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            <c:forEach var="activity" items="${activityList}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="activity-${activity.fcltyNm}" value="${activity.lcLa},${activity.lcLo}">
                                    <label class="form-check-label" for="activity-${activity.fcltyNm}">${activity.fcltyNm} (${activity.ctgryThreeNm})</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- 동호회 정보 아코디언 -->
                <div class="card">
                    <div class="card-header" id="headingFour">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                동호회 정보
                            </button>
                        </h5>
                    </div>
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                        <div class="card-body">
                            <c:forEach var="club" items="${clubList}">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="club-${club.clubNm}" value="${club.signguNm}">
                                    <label class="form-check-label" for="club-${club.clubNm}">${club.clubNm} (${club.itemNm})</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-info mt-3" onclick="displaySelected()">선택한 추천 보기</button>
        </div>
    </div>

    <!-- 지도 -->
    <div id="map" style="width: 100%; height: 500px; margin: 20px; align-items: center;"></div>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=539b508df6c017894a2691b6cfff05ce"></script>
    <script>
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 선택된 추천 항목을 지도에 표시하는 함수
    function displaySelected() {
        var checkedBoxes = document.querySelectorAll('input[type="checkbox"]:checked');
        var markers = [];

        checkedBoxes.forEach(function(box) {
            var value = box.value.split(',');
            var lat = parseFloat(value[0]);
            var lon = parseFloat(value[1]);

            if (!isNaN(lat) && !isNaN(lon)) {
                var position = new kakao.maps.LatLng(lat, lon);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: position
                });
                markers.push(marker);
                map.setCenter(position);
            }
        });

        if (markers.length > 1) {
            var bounds = new kakao.maps.LatLngBounds();
            markers.forEach(function(marker) {
                bounds.extend(marker.getPosition());
            });
            map.setBounds(bounds);
        }
    }
    </script>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

<script>
var apiKey = "26d19323df659828b99ea7cf2381c5d7";

function getLocationAndWeather() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;

            var url = "https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=" + apiKey + "&units=metric&lang=kr";

            $.getJSON(url, function(data) {
                $('#locationName').text("위치: " + data.name);
                $('#weatherMain').text("날씨 상태: " + data.weather[0].main);
                $('#weatherDescription').text("날씨 설명: " + data.weather[0].description);
                $('#temperature').text("온도: " + data.main.temp + "°C");
                $('#feelsLike').text("체감 온도: " + data.main.feels_like + "°C");
                $('#humidity').text("습도: " + data.main.humidity + "%");
                $('#windSpeed').text("풍속: " + data.wind.speed + " m/s");
                $('#windDeg').text("풍향: " + data.wind.deg + "°");

                $('#cityName').val(data.name);
                $('#latitude').val(lat);
                $('#longitude').val(lon);

                var moveLatLon = new kakao.maps.LatLng(lat, lon);
                map.setCenter(moveLatLon);

                var marker = new kakao.maps.Marker({
                    map: map,
                    position: moveLatLon
                });
            });
        }, function(error) {
            alert("위치 정보를 가져오는 데 실패했습니다.");
        });
    } else {
        alert("이 브라우저는 위치 정보를 지원하지 않습니다.");
    }
}

$(document).ready(function() {
    getLocationAndWeather();
});
</script>
</body>
</html>

