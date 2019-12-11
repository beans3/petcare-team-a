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

<div class="row text-center" style="width: 100%">
            <div style="width: 30%; float:none; margin:0 auto" >
                <div>
                	<h2>즐겨찾기한 병원</h2>
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
            	</div>
         	</div>
    	</div>
	
		
	
</body>
</html>