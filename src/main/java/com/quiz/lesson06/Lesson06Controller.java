package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@Controller
@RequestMapping("/lesson06")
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;

	// 즐겨찾기 추가 화면
	// http://localhost:8080/lesson06/quiz01/add_favorite_view
	@GetMapping("quiz01/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/quiz01/addFavorite";
	}
	
	@ResponseBody
	@GetMapping("/quiz01/isDuplication")
	public Map<String, Boolean> isDuplication() {
		
	}
	
	// 즐겨찾기 추가 - AJAX 통신 요청
	@ResponseBody // 응답값이 jsp가 아니다.
	@PostMapping("/quiz01/add_favorite")
	public Map<String, Boolean> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", favoriteBO.existFavoriteByUrl(url));
		
		// DB insert
		//favoriteBO.addFavorite(name, url);
		
		//return "성공";
		return result; // jackson라이브러리 => JSON String으로 내려간다.
	}
	
	// 즐겨찾기 목록 화면
	@GetMapping("/quiz01/after_add_favorite_view")
	public String afterAddFavoriteView(Model model) {
		
		// DB select
		List<Favorite> favoriteList = favoriteBO.getFavoriteList(); // 여기서 브레이크포인트 디버깅으로 검사해보기
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/quiz01/afterAddFavorite";
	}
}
