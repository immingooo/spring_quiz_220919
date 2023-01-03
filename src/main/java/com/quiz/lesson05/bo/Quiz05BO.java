package com.quiz.lesson05.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.Quiz05DAO;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class Quiz05BO {
	
	@Autowired
	private Quiz05DAO quiz05DAO;
	
	public List<WeatherHistory> getWeatherHistoryList() {
		 return quiz05DAO.selectWeatherHistoryList();
	}
	
	public void addWeatherHistory(WeatherHistory weatherHistory) {
		quiz05DAO.insertWeatherHistory(weatherHistory);
	}
	
	public void addWeatherHistoryAsFiled(
			Date date,
			String weather,
			String microDust,
			double temperatures,
			double precipitation,
			double windSpeed) {
		quiz05DAO.insertWeatherHistoryAsFiled(date, weather, microDust, temperatures, precipitation, windSpeed);
	}
}
