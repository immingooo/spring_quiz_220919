package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller // request를 제일 먼저 받을 수 있는 내가 만든 클래스
public class Lesson01Quiz01Controller {

	// http://localhost:8080/lesson01/quiz01/1
	@ResponseBody
	@RequestMapping("/1")
	public String printString() {
		String text ="<h1>테스트 프로젝트 완성</h1><h3>해당 프로젝트를 통해서 문제풀이를 진행 합니다.</h3>";
		return text;
	}
	
	// http://localhost:8080/lesson01/quiz01/2
	@ResponseBody
	@RequestMapping("/2")
	public Map<String, Object> printMap(){
		Map<String, Object> map = new HashMap<>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		return map; // jackson 라이브러리로 인해 map -> json 으로 변환됨
	}
}
