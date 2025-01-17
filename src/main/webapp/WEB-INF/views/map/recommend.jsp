<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<div class="container mt-5 py-5" id="weather-recommendation">
    <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
            <h2 class="text-uppercase text-primary mb-4">현재 위치 및 날씨</h2>
            <div id="weather-info" class="mb-4">
                <h5 id="location"></h5>
                <p id="weather-description"></p>
                <img id="weather-icon" src="" alt="날씨 아이콘" class="img-fluid mb-3">
            </div>
            <div class="form-floating mb-4">
                <textarea class="form-control" id="activity-input" style="height: 100px" placeholder="운동, 집에서 할 수 있는 것 등..."></textarea>
                <label for="activity-input">추천 활동을 입력하세요</label>
            </div>
            <button class="btn btn-primary w-50 mb-3" onclick="getRecommendations()">추천하기</button>
            <div id="recommendation-result" class="mt-4">
                <h4 class="text-secondary">추천 결과</h4>
                <p id="recommendation-text"></p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

</body>
<script>
//HTML이 로드된 후 위치 정보 요청
$(document).ready(function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(successLocation, errorLocation);
    } else {
        alert("위치 정보를 사용할 수 없습니다.");
    }
});

// 위치 정보 가져오기 성공 시 호출
function successLocation(position) {
    var lat = position.coords.latitude;  // 위도
    var lon = position.coords.longitude; // 경도
    console.log(lat +":"+lon);
    var gridCoords = convertToGrid(lat, lon); // 경위도를 격자 좌표로 변환
    var nx = gridCoords.nx;    // 변환된 x 좌표값
    var ny = gridCoords.ny;    // 변환된 y 좌표값
	console.log(nx +":"+ny);
    var baseDate = getBaseDate(); // 기준 날짜 설정 (yyyyMMdd 형식)
    var baseTime = getBaseTime(); // 기준 시간 설정 (1시간 단위)

    // API 호출 URL 생성 후 날씨 데이터 요청
    //var url = createUrl(nx, ny, baseDate, baseTime);
    
    fetchWeatherData(baseDate, baseTime, nx, ny);
}

// 위치 정보 가져오기 실패 시 호출
function errorLocation() {
    alert("위치 정보를 가져오지 못했습니다.");
}

// API URL 생성 함수
function createUrl(nx, ny, baseDate, baseTime) {
    const serviceKey = "ZyQlwjhSn6%2BN9lWdWU4kogoKlNM%2FfR4YUgr7l%2F%2F5EhZahGdnrGWPUZF41myyjZwFqCSBDfCr1cJySRJa6qJf0g%3D%3D";
    const numOfRows = "12"; // 1시간당 기상 정보가 12개
    const pageNo = "1"; // 페이지 번호
    const dataType = "JSON"; // 요청 자료 형식

    return (
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst" +
        "?serviceKey=" + serviceKey +
        "&numOfRows=" + numOfRows +
        "&pageNo=" + pageNo +
        "&dataType=" + dataType +
        "&base_date=" + baseDate +
        "&base_time=" + baseTime +
        "&nx=" + nx +
        "&ny=" + ny
    );
}

// 날씨 데이터 요청 함수
function fetchWeatherData(baseDate, baseTime, nx, ny) {
    const serviceKey = "ZyQlwjhSn6%2BN9lWdWU4kogoKlNM%2FfR4YUgr7l%2F%2F5EhZahGdnrGWPUZF41myyjZwFqCSBDfCr1cJySRJa6qJf0g%3D%3D"; // 발급받은 API 키 입력

    // 날씨 데이터 요청
    $.getJSON(
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=" + serviceKey + 
        "&pageNo=1&numOfRows=12&dataType=JSON&base_date=" + baseDate + "&base_time=" + baseTime + "&nx=" + nx + "&ny=" + ny,
        function(data) {
            console.log("API 응답:", data.response.body);
            if (data.response && data.response.body && data.response.body.items) {
                var items = data.response.body.items.item;
                displayWeatherData(items);
            } else {
                console.error("날씨 데이터를 불러오지 못했습니다.", data);
            }
        }
    );
}


// 기준 날짜 설정 함수 (오늘 날짜)
function getBaseDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = String(today.getMonth() + 1).padStart(2, '0');
    var day = String(today.getDate()).padStart(2, '0');
    return year + month + day; // yyyyMMdd 형식으로 반환
}

// 기준 시간 설정 함수 (가장 최근 시간대 찾기)
function getBaseTime() {
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();

    // API는 보통 1시간 단위로 업데이트됨, 가장 가까운 정각 시간으로 설정
    if (minutes < 40) {
        hours -= 1; // 40분 이전이면, 한 시간 전의 데이터를 요청
    }
    return String(hours).padStart(2, '0') + "00"; // 정각 시간 반환 (hh00 형식)
}

// 위도, 경도를 격자 좌표로 변환하는 함수
function convertToGrid(lat, lon) {
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0;      // 격자 간격(km)
    var SLAT1 = 30.0;    // 투영할 위도
    var SLAT2 = 60.0;    // 투영할 위도
    var OLON = 126.0;    // 기준점 경도
    var OLAT = 38.0;     // 기준점 위도
    var XO = 43;         // 기준점 X좌표
    var YO = 136;        // 기준점 Y좌표

    var DEGRAD = Math.PI / 180.0;
    var re = RE / GRID;
    var slat1 = SLAT1 * DEGRAD;
    var slat2 = SLAT2 * DEGRAD;
    var olon = OLON * DEGRAD;
    var olat = OLAT * DEGRAD;

    var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
    var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
    sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
    var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
    ro = re * sf / Math.pow(ro, sn);
    var ra = Math.tan(Math.PI * 0.25 + lat * DEGRAD * 0.5);
    ra = re * sf / Math.pow(ra, sn);
    var theta = lon * DEGRAD - olon;
    if (theta > Math.PI) theta -= 2.0 * Math.PI;
    if (theta < -Math.PI) theta += 2.0 * Math.PI;
    theta *= sn;

    var x = Math.floor(ra * Math.sin(theta) + XO + 0.5);
    var y = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);

    return { nx: x, ny: y };
}

//날씨 데이터를 화면에 표시하는 함수
function displayWeatherData(items) {
    items.forEach(function(item) {
        switch(item.category) {
            case 'TMP': // 기온
                console.log("기온: " + item.fcstValue + "°C");
                break;
            case 'RN1': // 1시간 강수량
                console.log("1시간 강수량: " + item.fcstValue + " mm");
                break;
            case 'SKY': // 하늘 상태
                console.log("하늘 상태: " + item.fcstValue);
                break;
            case 'REH': // 습도
                console.log("습도: " + item.fcstValue + "%");
                break;
            case 'PTY': // 강수 형태
                console.log("강수 형태: " + item.fcstValue);
                break;
            case 'POP': // 강수 확률
                console.log("강수 확률: " + item.fcstValue + "%");
                break;
            case 'WSD': // 풍속
                console.log("풍속: " + item.fcstValue + " m/s");
                break;
            case 'VEC': // 풍향
                console.log("풍향: " + item.fcstValue + "°");
                break;
            case 'UUU': // 동서바람성분
                console.log("동서바람성분: " + item.fcstValue + " m/s");
                break;
            case 'VVV': // 남북바람성분
                console.log("남북바람성분: " + item.fcstValue + " m/s");
                break;
            case 'WAV': // 파고
                console.log("파고: " + item.fcstValue + " m");
                break;
            case 'PCP': // 강수량
                console.log("강수량: " + item.fcstValue + " mm");
                break;
            case 'SNO': // 적설량
                console.log("적설량: " + item.fcstValue + " cm");
                break;
            default:
                console.log(item.category + ": " + item.fcstValue);
        }
    });
}
// 추천 활동 요청 버튼 이벤트 핸들러
function getRecommendations() {
    var activityInput = $("#activity-input").val();

    if (activityInput.trim() !== "") {
        $.ajax({
            url: "/getRecommendations",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ activity: activityInput }),
            success: function(response) {
                $("#recommendation-text").text(response.recommendation);
            },
            error: function(error) {
                console.error("추천 결과를 가져오지 못했습니다.", error);
            }
        });
    } else {
        alert("추천받을 활동을 입력하세요.");
    }
}

</script>
</html>