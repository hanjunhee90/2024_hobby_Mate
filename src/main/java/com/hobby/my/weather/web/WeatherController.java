package com.hobby.my.weather.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hobby.my.recommend.vo.ActivityVO;
import com.hobby.my.recommend.vo.CulturalVO;
import com.hobby.my.recommend.vo.LocalClubVO;
import com.hobby.my.recommend.vo.SportInfoVO;
import com.hobby.my.weather.service.WeatherService;
import com.hobby.my.weather.vo.WeatherVO;

@Controller
public class WeatherController {

	@Autowired
	WeatherService wService;
	
	@RequestMapping("/test")
	public String testview() {
		return "map/weather";
	}
	
	
    @GetMapping("/weather")
    public String getWeather(Model model) {
        // 날씨 정보를 가져오는 기본 페이지 로드 시 View를 반환하는 로직
        return "map/weatherMap";  // JSP 경로
    }

    @PostMapping("/submitWeather")
    @ResponseBody
    public Map<String, Object> submitWeather(@RequestBody WeatherVO weatherVO) {
        //double userLat = weatherVO.getLatitude(); // 나의 위도
        //double userLon = weatherVO.getLongitude(); // 나의 경도
        //double maxDistance = 5.0; // 검색할 최대 거리 (5km로 설정)
        // 영어 지역명을 한글로 변환
        String cityName = wService.transCity(weatherVO.getCityName());

        // 서비스 호출로 각 데이터를 조회
        ArrayList<SportInfoVO> sportsList = wService.searchSportsInfoByLocation(cityName);
        ArrayList<CulturalVO> classList = wService.searchCulturalClassDataByLocation(cityName);
        ArrayList<ActivityVO> activityList = wService.searchActivityByLocation(cityName);
        ArrayList<LocalClubVO> clubList = wService.searchLocalClubByLocation(cityName);
        
        

        // 스포츠 정보 필터링
		
		/*
		 * for (SportInfoVO sport : sportsList) { try { double sportLat =
		 * Double.parseDouble(sport.getLcLa()); double sportLon =
		 * Double.parseDouble(sport.getLcLo()); System.out.println("스포츠 위치: 위도 = " +
		 * sportLat + ", 경도 = " + sportLon);
		 * 
		 * double distance = DistanceUtil.calculateDistance(userLat, userLon, sportLat,
		 * sportLon); System.out.println("계산된 거리: " + distance + " km");
		 * 
		 * if (distance <= maxDistance) { nearbySports.add(sport); } } catch
		 * (NumberFormatException e) { System.err.println("잘못된 위도/경도 값: " +
		 * sport.getLcLa() + ", " + sport.getLcLo()); } }
		 * 
		 * // 액티비티 정보 필터링 for (ActivityVO activity : activityList) { double activityLat
		 * = Double.parseDouble(activity.getLcLa()); double activityLon =
		 * Double.parseDouble(activity.getLcLo()); double distance =
		 * DistanceUtil.calculateDistance(userLat, userLon, activityLat, activityLon);
		 * if (distance <= maxDistance) { nearbyActivities.add(activity); } }
		 */
		 

        // JSON 형태로 반환할 데이터 맵에 담기
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("sportsList", sportsList);
        resultMap.put("classList", classList);

        resultMap.put("activityList", activityList);
        resultMap.put("clubList", clubList);

        return resultMap;  // JSON 데이터로 반환
    }

}