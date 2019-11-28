<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#select{margin-left:-15px; margin-bottom:15px; width:200px;}
	.screen{margin-left:200px; margin-right:200px;}
</style>
</head>
<body>
<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">반려 동물 등록</div>
	</div>
	<form:form action="/pet/register" method="post" modelAttribute="pet">
		<div class="form-group">
			<label>이름</label>
			<form:input class="form-control" path="petName" name="petName"/>
			<form:errors path="petName"/>
		</div>

		<div class="container" id="select">
			<label>성별</label> 
			<select class="form-control" name="petGender">
				<option value="수컷">수컷</option>
				<option value="암컷">암컷</option>
			</select> 
		</div>
	
		<div class="container" id="select">
			<label>중성화 여부</label> 
			<select class="form-control" name="petNeuter">
				<option value="미실시">미실시</option>
				<option value="실시">실시</option>
			</select> 
		</div>
	
		<div class="form-group">
			<label>몸무게</label>
				<form:input class="form-control" path="petWeight" name="petWeight"/>
			  	<form:errors path="petWeight"/>
		</div>
	
		<div class="form-group">
			<label>종류</label>
			<form:input class="form-control" path="petSpecies"/>
			<form:errors path="petSpecies"/>
		</div>

		<div class="form-group">
			<label>품종</label>
			<form:input class="form-control" path="petBreed"/>
			<form:errors path="petBreed"/>
		</div>	
	
		<div class="form-group">
			<label>나이</label>
			<form:input class="form-control" path="petAge"/>
			<form:errors path="petAge"/>
		</div>
	
	<div>
		<input type="hidden" name="userId" value="${user.userId}">
	</div>
	
		<button type="submit" class="btn btn-default">등록</button>
		<button type="button" class="btn btn-default" onclick="self.location='/pet/list'">취소</button>
		</form:form>
</div>
</body>
</html>