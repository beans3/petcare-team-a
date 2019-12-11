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

<form id="actionForm" action="/appointment/list" method="get">
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
	<input type='hidden' name='searchType' value = '${pageMaker.cri.searchType}'>
	<input type='hidden' name='keyword' value = '${pageMaker.cri.keyword}'>
</form>

<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">진료기록</div>
	</div>
	

	<div>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>동물이름</th>
				<th>진료날짜</th>
				<th>진료내용(일부표기)</th>
			</tr>
			
	
			<tr>
				
			</tr>
		</table>
		
	</div>
</div>

</body>
</html>