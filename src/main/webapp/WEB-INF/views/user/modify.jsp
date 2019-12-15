<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 개인정보</title>
<link href='<spring:url value="/resources/css/custom.css"/>' rel="stylesheet" />
<script src='<spring:url value="/resources/js/user/update.js"/>'></script>
</head>
<body>

<div class="row text-center" style="width: 100%">
   <div style="width: 30%; float:none; margin:0 auto" >
       <div>
			<strong>유저 개인정보</strong>
	   </div>
  </div>
</div>

<div class="container-fluid text-center m-t-30 m-b-20">
	<div class="row content">
		<div class="col-sm-2 sidenav">
		</div>
		<div class="col-sm-8 text-left" style="height:100%;">
<%-- 			<form:form id="userModify" action="/member/modify" method="post" modelAttribute="user">
				<div class="form-group">
					<form:label path="userId">아이디</form:label>
					<form:input path="userId" required="required" type="text" class="form-control" value="${list.userId}"/>
					<form:errors path="userId" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userPw">비밀번호</form:label>
					<form:password path="userPw" required="required" class="form-control" value="${list.userPw}"/>
					<form:errors path="userPw" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userName">이름</form:label>
					<form:input path="userName" required="required" type="text" class="form-control" value="${list.userName}"/>
					<form:errors path="userName" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userEmail">이메일</form:label>
					<form:input path="userEmail" required="required" type="email" class="form-control" value="${list.userEmail}"/>
					<form:errors path="userEmail" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userPhone">전화번호</form:label>
					<form:input path="userPhone" required="required" type="text" class="form-control" value="${list.userPhone}"/>
					<form:errors path="userPhone" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userAddress">주소</form:label>
					<form:input path="userAddress" required="required" type="text" class="form-control" value="${list.userAddress}"/>
					<form:errors path="userAddress" cssClass="text-danger"/>
				</div>
				<div class="col text-center">
					<input type="submit" class="btn btn-primary" value="수정">
				</div>											
			</form:form> --%>
			<form id="userModify" method="post" action="/member/modify">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" readonly="readonly" name="userId" value="${list.userId}">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="userPw" value="${list.userPw}">
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" readonly="readonly" name="userName" value="${list.userName}">
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input type="email" class="form-control" name="userEmail" value="${list.userEmail}">
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<input type="text" class="form-control" name="userPhone" value="${list.userPhone}">
				</div>
				<div class="form-group">
					<label>주소</label>
					<input type="text" class="form-control" name="userAddress" value="${list.userAddress}">
				</div>				
				<div class="col text-center">
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</form>													
	    <div class="col-sm-2 sidenav">
	    </div>
		</div>
	</div>
</div>
<!--validate JQuery  -->
<script src='<spring:url value="/resources/js/jquery.validate.js"/>'></script>
</body>
</html>