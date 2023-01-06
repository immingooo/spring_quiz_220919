<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
	<!-- 제이쿼리 원본 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="favorite" items="${favoriteList}">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td><a href="${favorite.url}">${favorite.url}</a></td>
					<%-- <input type="hidden" value="${favorite.id}"> --%>
					<td>
						<%-- 1) name속성 + value속성 삭제 --%>
						<%-- <button type="button" name="delBtn" class="del-btn btn btn-danger" value="${favorite.id}">삭제</button> --%>
						
						<%-- 2) data를 이용해서 태그에 임시 저장하기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function() {
			// 1) name속성 + value속성 삭제 - 딱하나의 값으로 삭제할 때만 가능
			/* $('button[name=delBtn]').on('click', function(e) { // e:지금 클릭된 객체에 대한 모든 정보가 있음
				//let id = $(this).val();
				//let id = $(this).attr('value');
				let id = e.target.value;
				alert(id);
			}); */
			
			// 2) data를 이용해서 태그에 임시 저장하기 - 많이 사용
			// 태그: data-favorite-id     data-뒤에 우리가 이름을 정한다.(대문자 절대 안됨)
			// 스크립트: $(this).data('favorite-id');
			$('.del-btn').on('click', function() {
				let id = $(this).data('favorite-id');
				//alert(id);
				
				$.ajax({
					// Request
					type:"delete"
					, url:"/lesson06/quiz02/delete_favorite"
					, data:{"id":id}
				
					// Response
					, success:function(data) {
						if (data.code == 1) {
							// 성공
							window.location.reload(true); // 새로고침. 스크롤로 다시 위로 안올라가고 데이터만 새로고침됨. window.나 document.은 개인프로젝트 하다가 안될 때 붙여서 사용하기
							// location.href으로 다시 주소 요청을 하면 스크롤이 다시 위로 올라감
						} else if (data.code == 500) {
							// 에러
							alert(data.error_message);
						}
					}
					, error:function(e) {
						alert("삭제에러" + e);
					}
					
				});
			});
			
			// 내가 푼 방식
			/* $('.del-btn').on('click', function() {
				//alert('1111');				
				let currentRow = $(this).closest('tr');
				
				let id = currentRow.find('td:eq(0)').text().trim();
				console.log(id);
				
				$.ajax({
					// Request
					type:"delete"
					, url:"/lesson06/quiz02/delete_favorite"
					, data:{"id":id}
				
					// Response
					, success:function(data) {
						if (data.code == 1) {
							location.reload();
						}
					}
					, error:function(e) {
						alert("삭제에러" + e);
					}
					
				});
			}); */
		});
	</script>
</body>
</html>