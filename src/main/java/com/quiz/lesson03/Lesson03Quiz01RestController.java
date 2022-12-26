package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController // @Controller + @ResponseBody
@RequestMapping("/lesson03/quiz01")
public class Lesson03Quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;

	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/1")
	public RealEstate quiz01_1(
			@RequestParam("id") int id
	) {
		return realEstateBO.getRealEstateById(id); // 만약 id말고 여러개를 받아와도 BO한테 요청할 때 보내고 싶은 것만 보낼 수 있음
	}
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/2")
	public List<RealEstate> quiz01_2(
				@RequestParam(value="rent_price") int rentPrice
	) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
				@RequestParam("area") int area, // 거의 대부분 필수로 받기
				@RequestParam("price") int price
			) {
		return realEstateBO.getRealEstateListByAreaPrice(area, price);
	}
}
