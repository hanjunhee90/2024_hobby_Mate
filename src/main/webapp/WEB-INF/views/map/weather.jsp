<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날씨</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include> 

<div class="container mt-5">
    <h2 class="text-center mb-4">현재 위치 날씨 정보</h2>

   <div id="weather-info" class="text-center">
        <h4 id="location"></h4>
        <p id="temperature"></p>
        <p id="tempMin"></p>
        <p id="tempMax"></p>
        <p id="humidity"></p>
        <p id="pressure"></p>
        <p id="windSpeed"></p>
        <p id="windDeg"></p>
        <p id="clouds"></p>
        <p id="rain"></p>
        <p id="snow"></p>
        <p id="description"></p>
        <img id="weather-icon" src="" alt="날씨 아이콘" class="img-fluid">
    </div>
</div>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
</body>
<script>
// OpenWeather API 키 (여기에 본인의 API 키를 입력)
const apiKey = "26d19323df659828b99ea7cf2381c5d7";

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
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;

    // OpenWeather API 호출
    var url = buildOpenWeatherUrl(latitude, longitude);
    
    // 날씨 데이터 요청
    getWeatherData(url);
}

// 위치 정보 가져오기 실패 시 호출
function errorLocation() {
    alert("위치 정보를 가져오지 못했습니다.");
}

// OpenWeather URL 생성 함수
function buildOpenWeatherUrl(lat, lon) {
    const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
    const queryParams = [
        "lat=" + lat,
        "lon=" + lon,
        "appid=" + apiKey,    // API 키는 상단에서 정의됨
        "units=metric",       // 섭씨로 온도 설정
        "lang=kr"             // 한국어로 설정
    ];

    return baseUrl + "?" + queryParams.join("&");
}

// OpenWeather API로 날씨 데이터 요청
function getWeatherData(url) {
    $.getJSON(url, function(data) {
        console.log("날씨 데이터:", data);

        // 데이터 표시
        var location = data.name;
        var temperature = data.main.temp + "°C";
        var tempMin = data.main.temp_min + "°C"; // 최저 기온
        var tempMax = data.main.temp_max + "°C"; // 최고 기온
        var humidity = data.main.humidity + "%"; // 습도
        var pressure = data.main.pressure + " hPa"; // 기압
        var windSpeed = data.wind.speed + " m/s"; // 풍속
        var windDeg = data.wind.deg + "°"; // 바람 방향
        var clouds = data.clouds.all + "%"; // 구름량
        var description = data.weather[0].description; // 날씨 설명
        var icon = "https://openweathermap.org/img/wn/" + data.weather[0].icon + "@2x.png"; // 아이콘 URL
        
        // 강수량과 적설량 (옵션 값, 없는 경우 표시 안함)
        var rain = data.rain ? (data.rain['1h'] || data.rain['3h']) + " mm" : "없음"; // 1시간 또는 3시간 강수량
        var snow = data.snow ? (data.snow['1h'] || data.snow['3h']) + " mm" : "없음"; // 1시간 또는 3시간 적설량

        // HTML에 데이터 삽입
        $('#location').text(location);
        $('#temperature').text("현재 온도: " + temperature);
        $('#tempMin').text("최저 기온: " + tempMin);
        $('#tempMax').text("최고 기온: " + tempMax);
        $('#humidity').text("습도: " + humidity);
        $('#pressure').text("기압: " + pressure);
        $('#windSpeed').text("풍속: " + windSpeed);
        $('#windDeg').text("바람 방향: " + windDeg);
        $('#clouds').text("구름량: " + clouds);
        $('#rain').text("강수량: " + rain);
        $('#snow').text("적설량: " + snow);
        $('#description').text("날씨: " + description);
        $('#weather-icon').attr('src', icon);
    }).fail(function() {
        alert("날씨 정보를 가져오는 데 실패했습니다.");
    });
}

</script>
</html>