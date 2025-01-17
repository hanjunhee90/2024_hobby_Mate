package com.hobby.my.weather.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.hobby.my.recommend.vo.ActivityVO;
import com.hobby.my.recommend.vo.CulturalVO;
import com.hobby.my.recommend.vo.LocalClubVO;
import com.hobby.my.recommend.vo.SportInfoVO;

@Mapper
public interface IWeatherDAO {
	
	public String transCity(String englishName);
	
	// Sports Info 검색
    public ArrayList<SportInfoVO> searchSportsInfoByLocation(String koreanName);

    // Cultural Class 검색
    public ArrayList<CulturalVO> searchCulturalClassDataByLocation(String koreanName);

    // Activity 검색
    public ArrayList<ActivityVO> searchActivityByLocation(String koreanName);

    // Local Club 검색
    public ArrayList<LocalClubVO> searchLocalClubByLocation(String koreanName);

}
