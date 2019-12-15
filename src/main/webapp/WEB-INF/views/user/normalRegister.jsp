<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 회원가입</title>
<link href='<spring:url value="/resources/css/custom.css"/>' rel="stylesheet" />

</head>
<body>
<div class="row text-center" style="width: 100%">
   <div style="width: 30%; float:none; margin:0 auto" >
       <div>
			<strong>회원가입</strong>
			<p>회원정보를 입력하여주세요.</p>
	   </div>
  </div>
</div>

<div class="container">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="jumbotron" style="padding-top: 20px;">
			<form:form id="userJoin" action="/member/user" method="post" modelAttribute="user">
				<div class="form-group">
					<form:label path="userId">아이디</form:label>
					<form:input path="userId" required="required" type="text" class="form-control" placeholder="아이디를 입력하세요."/>
					<form:errors path="userId" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userPw">비밀번호</form:label>
					<form:password path="userPw" required="required" class="form-control" placeholder="비밀번호를 입력하세요."/>
					<form:errors path="userPw" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userPw">비밀번호 확인</form:label>
					<form:password path="userPw2" required="required" class="form-control" placeholder="비밀번호 확인을 입력하세요."/>
					<form:errors path="userPw2" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userName">이름</form:label>
					<form:input path="userName" required="required" type="text" class="form-control" placeholder="이름을 입력하세요."/>
					<form:errors path="userName" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userEmail">이메일</form:label>
					<form:input path="userEmail" required="required" type="email" class="form-control" placeholder="이메일을 입력하세요."/>
					<form:errors path="userEmail" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userPhone">전화번호</form:label>
					<form:input path="userPhone" required="required" type="text" class="form-control" placeholder="전화번호를 입력하세요."/>
					<form:errors path="userPhone" cssClass="text-danger"/>
				</div>
				<div class="form-group">
					<form:label path="userAddress">주소</form:label>
					<form:input path="userAddress" required="required" type="text" class="form-control" placeholder="주소를 입력하세요."/>
					<form:errors path="userAddress" cssClass="text-danger"/>
				</div>
				<div class="col text-center">
					<input type="submit" class="btn btn-primary" value="회원가입">
				</div>															
			</form:form>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>
<!--validate JQuery  -->
<script src='<spring:url value="/resources/js/jquery.validate.js"/>'></script>
</body>
</html>