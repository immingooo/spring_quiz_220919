package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	// url 중복확인 - AJAX 통신 요청
	@ResponseBody // model을 사용할 수 없음
	@PostMapping("/quiz02/is_Duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) { // url이 넘어오는지 디버깅으로 확인하기
		
		Map<String, Boolean> result = new HashMap<>(); // 여기에 브레이크포인트
		// 중복확인 select(기존 테이블에 중복되는 url이 없다는 가정하에. 이미 중복되는 url이 있으면 TooManyResult에러가 나옴) - 이 방식이 재활용성이 좋음
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) { 
			// 중복일 때
			result.put("is_duplication", true);
		} else {
			result.put("is_duplication", false);
		}
		
		//favoriteBO.existFavoriteByUrl(url) - 재활용성이 안좋음
		
		return result;
	}
	
	// 즐겨찾기 추가 - AJAX 통신 요청
	@ResponseBody // 응답값이 jsp가 아니다.
	@PostMapping("/quiz01/add_favorite")
	public Map<String, String> addFavorite( // Object
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// DB insert
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		
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
	
	// 삭제버튼 화면 - AJAX 통신 요청
	@ResponseBody
	@DeleteMapping("/quiz02/delete_favorite") // 주소로 치고 들어갈 수 없음
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		//result.put("result", "삭제성공");

		// DB delete
		//favoriteBO.deleteFavoriteById(id); // void로 했었음
		int row = favoriteBO.deleteFavoriteById(id);
		if (row > 0) {
			// 성공
			// 정의하는 건 개발자 마음
			result.put("code", 1); // 성공
			result.put("result", "성공");
		} else {
			// 실패(로직에러)
			result.put("code", 500); // 실패
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}
}
