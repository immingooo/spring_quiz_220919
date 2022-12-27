package com.quiz.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson04Quiz01Controller {

	// http://localhost/lesson04/quiz01/add_seller_view
	@RequestMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/add_seller";
	}
}
