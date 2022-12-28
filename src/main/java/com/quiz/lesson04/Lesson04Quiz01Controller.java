package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;

@Controller
@RequestMapping("/lesson04/quiz01")
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;

	// http://localhost:8080/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSellerView() {
		return "lesson04/add_seller";
	}
	
	@PostMapping("add_seller")
	public String addSeller( // 파라미터들이 잘 들어오나 디버깅으로 확인하기
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false) double temperature) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/after_add_seller"; // 먼저 연결이 잘 됐나 확인하기
	}
}
