package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;

	// 판매자 추가 화면
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// 판매자 insert => 입력 성공 jsp
	@PostMapping("/add_seller")
	public String addSeller( // 파라미터들이 잘 들어오나 확인하고 응답값화면으로 연결이 잘 됐나(넘어가는지) 디버깅으로 확인하기
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl, // 대문자로 시작하는 자료형은 모두 null허용 가능(String은 원래 null허용)
			@RequestParam(value="temperature", required=false) Double temperature) { // 사용자가 아무것도 입력하지 않았을 때 null로 들어올 수 있어서 Double(default값은 DB에서 채워질걸.?)
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// 응답값 jsp
		return "lesson04/afterAddSeller"; // 여기에 브레이크포인트 걸어서
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info_view
	// http://localhost:8080/lesson04/quiz01/seller_info_view?id=1
	@GetMapping("/seller_info_view")
	public String sellerInfoView(
			@RequestParam(value="id", required=false) Integer id,
			Model model) { // , defaultValue="1"
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSellerInfo();
		} else {
			seller = sellerBO.getSellerInfoById(id);
		}
		
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		
		return "lesson04/sellerInfo";
	}
}
