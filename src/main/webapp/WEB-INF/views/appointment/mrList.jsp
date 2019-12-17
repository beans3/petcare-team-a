<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:hover{color:red;}
	.screen{margin-left:200px; margin-right:200px;}
	#search{margin-bottom:15px;}
	#null{text-align:center;}
</style>
</head>
<body>

		
<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">진료기록</div>
	</div>
		<table class="table table-striped table-bordered table-hover" style="text-align: center;">
			<tr>
				<th bgcolor="#585858">예약일련번호</th>
				<th bgcolor="#585858">동물번호</th>
				<th bgcolor="#585858">진료날짜</th>
				<th bgcolor="#585858">진료내용</th>
			</tr>
			<c:forEach items="${medicalRecords}" var="mrs">
			<tr>
				<td width="10%" >${mrs.apptNo}</td>
				<td width="10%">${mrs.petNo}</td>
				<td width="20%"><fmt:parseDate value="${mrs.treatRegdate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${dateFmt}"  pattern="yyyy년 MM월 dd일 hh시 mm분"/></td>
				<td width="60%" style="text-align: left;">${mrs.treatContent}</td>
			</tr>
			</c:forEach>
		</table>
</div>
		
</body>
</html>