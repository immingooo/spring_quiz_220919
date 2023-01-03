package com.quiz.lesson05.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface Quiz05DAO {

	public List<WeatherHistory> selectWeatherHistoryList();
	
	public void insertWeatherHistory(WeatherHistory weatherHistory);
	
	public void insertWeatherHistoryAsFiled(
			@Param("date") Date date,
			@Param("weather") String weather,
			@Param("microDust") String microDust,
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation,
			@Param("windSpeed") double windSpeed);
}
