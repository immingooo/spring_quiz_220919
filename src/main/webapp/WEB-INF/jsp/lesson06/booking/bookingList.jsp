<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
	<!-- 제이쿼리 원본 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/booking/style.css">
</head>
<body>
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center">
			<div class="display-4">
				<a href="/lesson06/booking/main_view" class="text-dark">통나무 팬션</a> 
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="/lesson06/booking/reservation_view" class="nav-link text-light font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents">
			<div class="d-flex justify-content-center align-items-center pt-4 pb-4">
					<h2 class="font-weight-bold">예약 목록 보기</h2>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td>
							<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일"/>
						</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state eq '대기중'}">
									<span class="text-info">${booking.state}</span>
								</c:when>
								<c:when test="${booking.state eq '확정'}">
									<span class="text-success">${booking.state}</span>
								</c:when>
							</c:choose>
						</td>
						<td>
							<button type="button" class="delBtn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</section>
		<footer>
			<div class="footer-text">
				제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업사지정 / 대표:김통목<br>
				Copyright 2025 tongnamu. All right reserved.
			</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$('.delBtn').on('click', function() {
				let id = $(this).data('booking-id');
				
				$.ajax({
					// Request
					type:"delete"
					, url:"/lesson06/booking/delete_booking"
					, data:{"id":id}
				
					// Response
					, success:function(data) {
						if (data.code == 1) {
							location.reload(true);
						} else if (data.code == 500) {
							alert(data.error_message);
						}
					}
					, error:function(e) {
						alert("에러 " + e);
					}
				});
			});
		});
	</script>
</body>
</html>