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
					<td class="id">${favorite.id}</td>
					<td>${favorite.name}</td>
					<td><a href="${favorite.url}">${favorite.url}</a></td>
					<td><button type="button" class="btn btn-danger deleteFavoriteBtn">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function() {
			$('.deleteFavoriteBtn').on('click', function() {
				//alert('1111');
				let currentRow = $(this).closest('tr');
				
				let id = currentRow.find('td:eq(0)').text().trim();
				console.log(id);
				
				$.ajax({
					// Request
					type:"get"
					, url:"/lesson06/quiz01/delete_favorite"
					, data:{"id":id}
				
					// Response
					, success:function(data) {
						if (data.result == "삭제성공") {
							location.href="/lesson06/quiz01/after_add_favorite_view";
						}
					}
					, error:function(e) {
						alert("삭제에러" + e);
					}
					
				});
			});
		});
	</script>
</body>
</html>