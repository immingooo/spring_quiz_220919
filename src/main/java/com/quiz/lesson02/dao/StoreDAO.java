package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO { // 원래 빈이 없지만 Mybatis에 의해 빈이 만들어짐

	// input: BO가 아무것도 주지 않음 X
	// output: List<Store> => BO에게 전달
	
	public List<Store> selectStoreList();
}
