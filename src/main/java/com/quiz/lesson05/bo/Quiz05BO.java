package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.Quiz05DAO;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class Quiz05BO {
	
	@Autowired
	private Quiz05DAO quiz05DAO;
	
	public List<WeatherHistory> getWeatherHistory() {
		 return quiz05DAO.selectWeatherHistory();
	}
	
	public void addWheatherHistory(WeatherHistory weatherHistory) {
		
	}
}
