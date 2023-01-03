<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
	<!-- 제이쿼리 원본, 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
					<h4 class="font-weight-bold">과거 날씨</h4>
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
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
</body>
</html>