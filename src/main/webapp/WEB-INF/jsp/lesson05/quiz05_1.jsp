<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
	<!-- 제이쿼리 원본 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- datepicker 라이브러리 -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex h-100">
			<aside class="menu col-2">
				<div class="w-100 d-flex justify-content-center pt-3 pb-3">
					<img src="https://www.kma.go.kr/kma/resources/images/sub/sig2.png" alt="기상청 로고1" width="100px">
				</div>
				<nav>
					<ul class="nav flex-column">
						<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">날씨</a></li>
						<li class="nav-item"><a href="/lesson05/quiz05_1" class="nav-link text-light font-weight-bold">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-light font-weight-bold">관측 기후</a></li>
					</ul>
				</nav>
			</aside>
			<section class="content col-10">
				<div class="p-4">
					<h4 class="font-weight-bold">날씨 입력</h4>
					<form method="post" action="/lesson05/quiz05_2" class="p-4">
						<div class="form-group d-flex justify-content-between">
							<div class="d-flex col-4 align-items-center">
								<label for="date" class="col-3 p-0 m-0">날짜</label>
								<input type="text" name="date" id="date" class="form-control col-9">
							</div>
							<div class="d-flex col-4 align-items-center">
								<label class="col-3 p-0 m-0">날씨</label>
								<select name="weather" class="form-control col-9">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="d-flex col-3 align-items-center">
								<label class="col-6 p-0 m-0">미세먼지</label>
								<select name="microDust" class="form-control col-6">
									<option>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div class="form-group d-flex pt-4">
							<div class="d-flex col-4 align-items-center">
								<label class="col-3 p-0 m-0">기온</label>
								<div class="input-group flex-nowrap">
								  <input type="text" class="form-control" name="temperatures">
								  <div class="input-group-prepend">
								    <span class="input-group-text">℃</span>
								  </div>
								</div>
							</div>
							<div class="d-flex col-4 align-items-center">
								<label class="col-3 p-0 m-0">강수량</label>
								<div class="input-group flex-nowrap">
								  <input type="text" class="form-control" name="precipitation">
								  <div class="input-group-prepend">
								    <span class="input-group-text">mm</span>
								  </div>
								</div>
							</div>
							<div class="d-flex col-4 align-items-center">
								<label class="col-3 p-0 m-0">풍속</label>
								<div class="input-group flex-nowrap">
								  <input type="text" class="form-control" name="windSpeed">
								  <div class="input-group-prepend">
								    <span class="input-group-text">km/h</span>
								  </div>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end pr-3 pt-2">
							<input type="submit" class="btn btn-success" value="저장">
						</div>
					</form>
				</div>
			</section>
		</section>
		<footer>
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="col-2 d-flex justify-content-center">
					<img src="https://www.weather.go.kr/plus/resources/image/foot_logo.png" alt="기상청 로고2" width="120px">
				</div>
				<div class="col-10 text-secondary">
					<small>(07062) 서울시 동작구 여의대방로16길 61<br>Copyright@2020 KMA. All Rights RESERVED.</small>
				</div>
			</div>
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			$('input[name=date]').datepicker({
				dateFormat:"yy년 m월 d일"
			});
		});
	</script>
</body>
</html>