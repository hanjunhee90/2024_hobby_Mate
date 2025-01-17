package com.hobby.my.weather.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hobby.my.recommend.vo.ActivityVO;
import com.hobby.my.recommend.vo.CulturalVO;
import com.hobby.my.recommend.vo.LocalClubVO;
import com.hobby.my.recommend.vo.SportInfoVO;
import com.hobby.my.weather.dao.IWeatherDAO;

@Service
public class WeatherService {

   @Autowired
   IWeatherDAO weatherDao;

   public String transCity(String englishName) {
	   return weatherDao.transCity(englishName);
   }
   
   
   public ArrayList<SportInfoVO> searchSportsInfoByLocation(String koreanName) {
	   
       return weatherDao.searchSportsInfoByLocation(koreanName);
   }

   
   public ArrayList<CulturalVO> searchCulturalClassDataByLocation(String koreanName) {
       return weatherDao.searchCulturalClassDataByLocation(koreanName);
   }

   
   public ArrayList<ActivityVO> searchActivityByLocation(String koreanName) {
       return weatherDao.searchActivityByLocation(koreanName);
   }

   
   public ArrayList<LocalClubVO> searchLocalClubByLocation(String koreanName) {
       return weatherDao.searchLocalClubByLocation(koreanName);
   }
    
}