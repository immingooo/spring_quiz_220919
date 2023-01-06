package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lesson06")
public class BookingController {

	@GetMapping("/booking/main_view")
	public String mainView() {
		return "lesson06/booking/main";
	}
}
