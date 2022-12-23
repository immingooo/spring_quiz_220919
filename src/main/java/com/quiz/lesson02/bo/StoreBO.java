package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service   // 스프링빈 등록
public class StoreBO {

	// input: 컨트롤러가 보내주지 않음 X
	// output: List<Store> => 컨트롤러한테 보냄
	
	@Autowired // 스프링빈은 반드시 DI?를 받아야 함. 스프링빈을 부여받음
	private StoreDAO storeDAO;  // 필드
	
	public List<Store> getStoreList() {
		List<Store> storeList = storeDAO.selectStoreList();
		return storeList;
		// return storeDAO.selectStoreList();
	}
}
