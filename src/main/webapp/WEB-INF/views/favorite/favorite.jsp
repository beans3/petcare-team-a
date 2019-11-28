<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Favorite 리스트 페이지
	
		
		<table border="1">
				<tr>
					<th>No</th>
					<th>User</th>
					<th>Hospital</th>
					<th>삭제<th>
				</tr>
				<c:forEach items="${favorites}" var="favorites">
				<!-- HSJ form 위치? -->
				<form method="get" action="/favorite/delete"> 
				<tr>
					<td>${favorites.favoriteNo}</td>
					<td>${favorites.userId}</td>
					<td><a href='<c:out value="/hospital/get?hospitalId=${favorites.hospitalId}"/>'>${favorites.hospitalId}</a></td>
					<td><input type="submit" value="삭제">
					<input type="hidden" name="favoriteNo" value="${favorites.favoriteNo}">
				</tr>
				</form>
			</c:forEach>
			
		</table>
	
</body>
</html>