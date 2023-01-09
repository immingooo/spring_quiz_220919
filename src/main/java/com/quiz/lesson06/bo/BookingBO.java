package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
//	@RequestParam("name") String name,
//	@RequestParam("date") String date,
//	@RequestParam("day") int day,
//	@RequestParam("headcount") int headcount,
//	@RequestParam("phoneNumber") String phoneNumber)
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public Booking getBookingByFields(String name, String phoneNumber) {
		return bookingDAO.selectBookingByFields(name, phoneNumber);
	}
}
