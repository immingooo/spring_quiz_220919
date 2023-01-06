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
		<div class="d-flex">
			<input type="text" id="url" class="form-control">
			<button type="button" id="urlCheckBtn" class="btn btn-info ml-3">중복확인</button>
		</div>
		<small id="duplicationText" class="text-danger d-none">중복된 URL입니다.</small>
		<small id="avaliableText" class="text-success d-none">저장 가능한 URL입니다.</small>
		<small id="urlStatusArea"></small>
		
		<input type="button" id="add" class="btn btn-success mt-3 w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function() {			
			// 중복확인
			$('#urlCheckBtn').on('click', function() {
				$('#urlStatusArea').empty();
				
				let url = $('#url').val().trim();
				//console.log(url);
				
				if (url == '') {
					alert("url이 비어있습니다")
					return;
				}
				
				if (!url.startsWith("http") && !url.startsWith("https")) {
					alert("http또는 https프로토콜로 시작하는 주소를 입력해주세요") // 주소 형식이 잘못되었습니다.
					return;
				}
				
				$.ajax({
					// Request
					// get방식은 크기의 한계(url길이)가 있을 수 있기때문에 post로 보내기
					type:"post"
					, url:"/lesson06/quiz02/is_Duplication"
					, data:{"url":url}
				
					// Response
					, success:function(data) { // String JSON => object으로 변환해줌.
						//alert(data); {딕셔너리}형태로 
						//alert(data.is_duplication)
						if (data.is_duplication) {
							// 중복
							//$('#urlStatusArea').append('<span class="text-danger">중복된 url입니다</span>');
							$('#avaliableText').addClass("d-none"); // 숨기기
							$('#duplicationText').removeClass("d-none");
						} else if (!data.is_duplication) {
							// 사용 가능한 URL
							//$('#urlStatusArea').append('<span class="text-danger">저장 가능한 url입니다</span>');
							$('#duplicationText').addClass("d-none"); // 숨기기
							$('#avaliableText').removeClass("d-none");
						}
					}
					, error:function(e) {
						alert("중복확인 에러 " + e);
					}
				});
			});
			
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
				
				// http로 시작하지 않고, https로도 시작하지 않으면 alert
				if (!url.startsWith("http") && !url.startsWith("https")) {
					alert("http또는 https프로토콜로 시작하는 주소를 입력해주세요") // 주소 형식이 잘못되었습니다.
					return;
				}
				
				//alert("즐겨찾기 추가완료");
				
				$.ajax({
					// Request
					type:"POST"
					, url:"/lesson06/quiz01/add_favorite"
					, data:{"name":name, "url":url}
				
					// Response
					, success:function(data) { // String JSON => object으로 변환해줌.
						//alert(data); {딕셔너리}형태로 
						if (data.result == "성공") {
							location.href="/lesson06/quiz01/after_add_favorite_view";
						}
					}
					, error:function(e) {
						alert("insert 에러" + e);
					}
				});
			});
		});
	</script>
</body>
</html>