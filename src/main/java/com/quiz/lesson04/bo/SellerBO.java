package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;

	public void addSeller(String nickname, String profileImageUrl, Double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSellerInfo() {
		return sellerDAO.selectLastSellerInfo();
	}
	
	public Seller getSellerInfoById(int id) { // Controller입장하고 아무상관없음
		return sellerDAO.selectSellerInfoById(id);
	}

}
