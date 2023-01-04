<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
	<!-- 제이쿼리 원본 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<label for="name">제목</label>
		<input type="text" id="name" class="form-control">
		<label for="url">주소</label>
		<input type="text" id="url" class="form-control">
		
		<input type="button" id="add" class="btn btn-success mt-3 w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {
			$('#add').on('click', function() {
				//alert('얼럿창 확인하기');
				// validation 처리
				let name = $('#name').val().trim();
				console.log(name);
				
				let url = $('#url').val().trim();
				console.log(url);
				
				if (name.length == '') {
					alert("제목을 입력해주세요")
					return;
				}
				
				if (url.length < 1) {
					alert("주소를 입력해주세요")
					return;
				}
				
				if (!url.startsWith("http") && !url.startsWith("https")) {
					alert("http또는 https프로토콜로 시작하는 주소를 입력해주세요")
					return;
				}
				
				//alert("즐겨찾기 추가완료");
				
				$.ajax({
					// Request
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite"
					, data:{"name":name, "url":url}
				
					// Response
					, success:function(data) {
						console.log(data);
						location.href="/lesson06/quiz01/after_add_favorite_view";
					}
					, error:function(e) {
						alert("에러");
					}
				});
			});
		});
	</script>
</body>
</html>