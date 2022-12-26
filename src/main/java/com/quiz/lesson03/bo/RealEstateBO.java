package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;

	// input: controller가 넘겨주는 id
	// output: RealEstate 한 행(단건) => 컨트롤러한테 넘김
	public RealEstate getRealEstateById(int id) { // BO의 입장에서도 id가 필수여서 int id로 해준다.
		return realEstateDAO.selectRealEstateById(id);
	}
	
	// input: controller 넘겨준 rentPrice
	// output: List<RealEstate> => 컨트롤러한테 넘김
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) { // rentPrice가 있어야만 결과를 가져올 수 있어서 BO의 입장에서도 필수적이다.(?)
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	// input: controller 넘겨준 area, price
	// output: List<RealEstate> => 컨트롤러한테 넘김
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price) { // input이 있어야만 결과를 가져올 수 있어서 int area랑 int price로 해준다.
		return realEstateDAO.selectRealEstateListByAreaPrice(area, price);
	}
	
	// input: RealEstate
	// output: int(성공한 행의 개수)
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	// addRealEstateAsFiled(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120)
	public int addRealEstateAsFiled(int realtorId, String address, int area, String type, int price, Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsFiled(realtorId, address, area, type, price, rentPrice);
	}
}
