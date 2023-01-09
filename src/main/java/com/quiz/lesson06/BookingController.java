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

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
@RequestMapping("/lesson06")
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;

	@GetMapping("/booking/main_view")
	public String mainView() {
		return "lesson06/booking/main";
	}
	
	// 문제3) 예약 내역 조회 - AJAX 통신 요청
	@ResponseBody
	@PostMapping("/booking/search_booking")
	public Map<String, Object> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) { // 파라미터 값들이 잘 넘어오는지 브레이크포인트로 확인하기!!
		
		Map<String, Object> searchResult = new HashMap<>();
		
		// DB select - 최신 예약 정보 한 건. (여러개의 행이 나올 수 있는데 최신걸 가져온다.)
		Booking booking = bookingBO.getBookingByFields(name, phoneNumber); // 여기서도 잘 가져왔는지 브레이크 포인트로 확인하기!
		if (booking != null) {
			// 예약조회 가능
			searchResult.put("code", 1);
			searchResult.put("result", "성공");
			searchResult.put("booking", booking);
			
//			searchResult.put("name", booking.getName());
//			searchResult.put("date", booking.getDate());
//			searchResult.put("day", booking.getDay());
//			searchResult.put("headcount", booking.getHeadcount());
//			searchResult.put("state", booking.getState());
		} else {
			// 예약조회 불가능
			searchResult.put("code", 500);
			searchResult.put("result", "예약 내역이 없습니다");
		}
		
		return searchResult;
	}
	
	@GetMapping("/booking/reservation_view")
	public String reservationView() {
		return "lesson06/booking/reservation";
	}
	
	// 문제2) 예약 추가 - AJAX 요청
	@ResponseBody
	@PostMapping("/booking/add_booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber) { // 여러개 받을 때 객체로 통으로 받아도 됨
		
		Map<String, Object> addResult = new HashMap<>();
		
		// DB insert
		int row = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		if (row > 0) {
			addResult.put("code", 1);
			addResult.put("result", "성공");
		} else {
			addResult.put("code", 500);
			addResult.put("result", "실패");
			addResult.put("error_message", "추가된 행이 없습니다.");
		}
		
		return addResult;
	}
	
	@GetMapping("/booking/bookingList_view")
	public String bookingListView(Model model) {
		
		// DB select
		List<Booking> bookingList = bookingBO.getBookingList(); // 여기서 브레이크포인트로 디버깅으로 select가 되는지 확인
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/booking/bookingList";
	}
	
	// 문제1) 예약 삭제 AJAX 통신 요청
	@ResponseBody
	@DeleteMapping("/booking/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String, Object> delResult = new HashMap<>();
		
		// DB delete
		int row = bookingBO.deleteBookingById(id);
		if(row > 0) {
			delResult.put("code", 1);
			delResult.put("result", "성공");
		} else {
			delResult.put("code", 500);
			delResult.put("result", "실패");
			delResult.put("error_message", "삭제하는데 실패했습니다");
		}
		
		return delResult;
	}
}
