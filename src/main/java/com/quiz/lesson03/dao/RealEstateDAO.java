package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate selectRealEstateById(int id);
	
	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	public List<RealEstate> selectRealEstateListByAreaPrice(
			// @Param 어노테이션에 의해서 하나의 맵이 된 것
			@Param("area") int area, 
			@Param("price") int price);
	
	public int insertRealEstate(RealEstate realEstate);
	
	public int insertRealEstateAsFiled(
			@Param("realtorId") int realtorId, // realtorId1111 여기 변수이름은 아무거나 해도 상관없음
			@Param("address") String address, 
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice);
	
	public int updateRealEstateById(
			@Param("id") int id, 
			@Param("type") String type, 
			@Param("price") int price);
	
	public void deleteRealEstateById(int id);
}
