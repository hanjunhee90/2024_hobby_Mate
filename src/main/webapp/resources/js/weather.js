// OpenWeather API 키
const apiKey = "26d19323df659828b99ea7cf2381c5d7";

// 날씨 설명에 따른 이미지 매핑 객체
const weatherImages = {
    "맑음": "/resources/images/sun.gif",
    "흐림": "/resources/images/cloud.gif",
    "눈": "/resources/images/snow.gif",
    "번개": "/resources/images/storm.gif",
    "안개": "/resources/images/fogmoon.gif",
    "소나기": "/resources/images/rain.gif"
};

// 페이지 로드 후 일정 시간 뒤에 날씨 정보 요청
document.addEventListener('DOMContentLoaded', function () {
    // 사용자에게 위치 정보 동의를 요청하기 전에 작은 안내 메시지를 표시할 수도 있음
    setTimeout(function() {
        if (navigator.geolocation) {
            // 위치 정보 요청
            navigator.geolocation.getCurrentPosition(successLocation, errorLocation, {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0
            });
        } else {
            console.warn("브라우저가 위치 정보를 지원하지 않습니다.");
            // 기본 좌표 (대전) 사용
            getWeatherData(buildOpenWeatherUrl(36.3504, 127.3845));
        }
    }, 2000); // 2초 후에 위치 정보 요청
});

// 위치 정보 가져오기 성공 시 호출
function successLocation(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // OpenWeather API 호출
    const url = buildOpenWeatherUrl(latitude, longitude);

    // 날씨 데이터 요청
    getWeatherData(url);
    
    // 위치 정보를 HTML에 저장
    document.getElementById('latitude-info').textContent = latitude;
    document.getElementById('longitude-info').textContent = longitude;
}

// 위치 정보 가져오기 실패 시 호출
function errorLocation(error) {
    console.warn(`위치 정보 요청 실패: ${error.message}`);
    // 위치 정보를 거부하거나 오류가 발생하면 기본 위치 (대전) 사용
    getWeatherData(buildOpenWeatherUrl(36.3504, 127.3845));
}

// OpenWeather URL 생성 함수
function buildOpenWeatherUrl(lat, lon) {
    const baseUrl = "https://api.openweathermap.org/data/2.5/weather";
    const queryParams = [
        "lat=" + lat,
        "lon=" + lon,
        "appid=" + apiKey,
        "units=metric",
        "lang=kr"
    ];

    return baseUrl + "?" + queryParams.join("&");
}

// OpenWeather API로 날씨 데이터 요청
function getWeatherData(url) {
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log("날씨 데이터:", data);

            // 중요한 날씨 정보 표시
            const location = data.name;
            const temperature = data.main.temp + "°C";
            const description = data.weather[0].description;

            // 날씨 설명에 따른 이미지 설정
            let weatherImage = "/resources/images/default_weather.gif"; // 기본 이미지

            // 특정 단어가 포함된 경우 해당 이미지 설정
            if (description.includes("비")) {
                weatherImage = "/resources/images/rain.gif";
            } else if (weatherImages[description]) {
                weatherImage = weatherImages[description];
            }

            // HTML에 데이터 삽입
            document.getElementById('weather-location').textContent = location;
            document.getElementById('weather-temperature').textContent = temperature;
            document.getElementById('weather-description').textContent = description;
            document.getElementById('weather-icon').src = weatherImage; // 이미지 설정
        })
        .catch(error => {
            console.error("날씨 정보를 가져오는 데 실패했습니다:", error);
        });
}
