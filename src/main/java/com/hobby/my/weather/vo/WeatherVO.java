package com.hobby.my.weather.vo;

// 날씨 관련 VO
public class WeatherVO {
	
	private String cityName;           // 지역이름
	private double latitude;           // 위도
    private double longitude;          // 경도
    private String weatherMain;        // 날씨 주요 상태
    private String weatherDescription; // 날씨 설명
    private double temperature;        // 현재 온도
    private double feelsLike;          // 체감 온도
    private int humidity;              // 습도
    private double windSpeed;          // 풍속
    private double windDeg;            // 풍향
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getWeatherMain() {
		return weatherMain;
	}
	public void setWeatherMain(String weatherMain) {
		this.weatherMain = weatherMain;
	}
	public String getWeatherDescription() {
		return weatherDescription;
	}
	public void setWeatherDescription(String weatherDescription) {
		this.weatherDescription = weatherDescription;
	}
	public double getTemperature() {
		return temperature;
	}
	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}
	public double getFeelsLike() {
		return feelsLike;
	}
	public void setFeelsLike(double feelsLike) {
		this.feelsLike = feelsLike;
	}
	public int getHumidity() {
		return humidity;
	}
	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}
	public double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(double windSpeed) {
		this.windSpeed = windSpeed;
	}
	public double getWindDeg() {
		return windDeg;
	}
	public void setWindDeg(double windDeg) {
		this.windDeg = windDeg;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	@Override
	public String toString() {
		return "WeatherVO [cityName=" + cityName + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", weatherMain=" + weatherMain + ", weatherDescription=" + weatherDescription + ", temperature="
				+ temperature + ", feelsLike=" + feelsLike + ", humidity=" + humidity + ", windSpeed=" + windSpeed
				+ ", windDeg=" + windDeg + "]";
	}
	
	

    
    
}