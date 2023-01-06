<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
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
				통나무 팬션
			</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section class="contents bg-warning">
			<div>
				<img src="/img/booking/test06_banner1.jpg" alt="홈페이지 사진">
			</div>
			<div class="d-flex">
				<div class="col-4 box1 d-flex justify-content-center align-items-center">
					<div class="display-4 text-light">
						실시간<br> 
						예약하기
					</div>
				</div>
				<div class="col-4 box2 text-light">
					<div class="p-2">
						<h4>예약 확인</h4>
						<div class="form-group d-flex">
							<label for="name" class="col-4">이름:</label>
							<input type="text" id="name" class="form-control col-8">
						</div>
						<div class="form-group d-flex">
							<label for="phoneNumber" class="col-4">전화번호:</label>
							<input type="text" id="phoneNumber" class="form-control col-8">
						</div>
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-success">조회하기</button>
						</div>
					</div>
				</div>
				<div class="col-4 box1 d-flex justify-content-center align-items-center">
					<div class="text-light font-weight-bold">
						<h4>예약문의:</h4>
						<h1>010-</h1>
						<h1>0000-1111</h1>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<div class="footer-text">
				제주특별자치도 제주시 애월읍<br>
				사업자등록번호: 111-22-255222 / 농어촌민박사업사지정 / 대표:김통목<br>
				Copyright 2025 tongnamu. All right reserved.
			</div>
		</footer>
	</div>
</body>
</html>