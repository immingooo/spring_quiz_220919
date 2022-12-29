package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
@RequestMapping("/lesson04/quiz02")
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;

	// 정보 추가 화면
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// 방금추가된 정보 출력 화면
	@PostMapping("/add_realtor")
	public String addRealtor( // 파라미터값 나오는지, 응답값 페이지이동 잘 되는지 디버깅으로 확인하기(return에 브레이크포인트)
			@ModelAttribute Realtor realtor, // 지금은 객체로 받음(Map으로 받을 수도 있음)
			Model model) {
		
		realtorBO.addRealtor(realtor); // 디버깅으로 확인하기(id가 들어왔는지)
		
		Realtor realtor1 = realtorBO.getRealtorById(realtor.getId());
		
		model.addAttribute("result", realtor1);
		model.addAttribute("subject", "공인중개사 정보");
		
		return "lesson04/afterAddRealtor";
	}
}
