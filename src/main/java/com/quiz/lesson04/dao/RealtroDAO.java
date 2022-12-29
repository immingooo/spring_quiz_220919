package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Realtor;

@Repository
public interface RealtroDAO {

	public void insertRealtor(Realtor realtor);
	
	public Realtor selectRealtorById(int id);
}
