<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
	<!-- 제이쿼리 원본 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- datepicker 라이브러리 -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="/lesson06/booking/bookingList_view" class="nav-link text-light font-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents d-flex justify-content-center">
			<div class="col-5 mb-4">
				<div class="d-flex justify-content-center align-items-center pt-4 pb-4">
					<h2 class="font-weight-bold">예약하기</h2>
				</div>
				<div>
					<div class="form-group">
						<label for="name" class="font-weight-bold">이름</label>
						<input type="text" id="name" class="form-control">
					</div>
					<div class="form-group">
						<label for="date" class="font-weight-bold">예약날짜</label>
						<input type="text" name="date" id="date" class="form-control">
					</div>
					<div class="form-group">
						<label for="day" class="font-weight-bold">숙박일수</label>
						<input type="text" id="day" class="form-control">
					</div>
					<div class="form-group">
						<label for="headcount" class="font-weight-bold">숙박인원</label>
						<input type="text" id="headcount" class="form-control">
					</div>
					<div class="form-group">
						<label for="phoneNumber" class="font-weight-bold">전화번호</label>
						<input type="text" id="phoneNumber" class="form-control">
					</div>
				</div>
				<button type="button" id="reservationBtn" class="btn btn-warning w-100">예약하기</button>
			</div>
		</section>
		<footer>
			<div class="footer-text">
				제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업사지정 / 대표:김통목<br>
				Copyright 2025 tongnamu. All right reserved.
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$('input[name=date]').datepicker({
				dateFormat:"yy-mm-dd"
				, minDate:0 // 오늘부터 그 뒤 날짜 선택
			});
			
			$('#reservationBtn').on('click', function() {
				let name = $('#name').val().trim();
				let date = $('#date').val().trim();
				let day = $('#day').val().trim();
				let headcount = $('#headcount').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if(name == "") {
					alert('이름을 입력해주세요');
					return;
				}
				if(date == '') {
					alert('날짜를 선택해주세요');
					return;
				}
				if(day == '') {
					// 숫자인지 검사도 할 수 있음 isNaN
					alert('숙박일수를 입력해주세요');
					return;
				}
				if(headcount == '') {
					// 숫자인지 검사도 할 수 있음 isNaN
					alert('숙박인원을 입력해주세요');
					return;
				}
				if(phoneNumber == '') {
					alert('전화번호를 입력해주세요');
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/lesson06/booking/add_booking"
					, data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
				
					, success:function(data) {
						if (data.code == 1) {
							alert("예약 되었습니다")
							//location.reload(true);
							location.href = "lesson06/booking/bookingList_view" // 목록 화면으로 이동
						} else if (data.code == 500) {
							alert(data.error_message)
						}
					}
					, error:function(e) {
						alert("예약하는데 실패했습니다 " + e)
					}
				});
			});
		});
	</script>
</body>
</html>