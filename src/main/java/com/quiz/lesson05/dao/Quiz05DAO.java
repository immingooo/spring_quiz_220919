package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface Quiz05DAO {

	public List<WeatherHistory> selectWeatherHistory();
	
	public void insertWheatherHistory(WeatherHistory weatherHistory);
}
