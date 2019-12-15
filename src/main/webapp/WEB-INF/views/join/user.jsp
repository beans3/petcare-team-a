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
<script src='<spring:url value="/resources/js/user/Join.js"/>'></script>
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

<div class="container-fluid text-center m-t-30 m-b-20">
	<div class="row content">
		<div class="col-sm-2 sidenav">
		</div>
		<div class="col-sm-8 text-left" style="height:100%;">
			<form id="userJoin" method="post" action="/member/join">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요." />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요." />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="userPw2" name="userPw2" placeholder="비밀번호 확인을 입력하세요."/>
				</div>				
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요."/>
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일을 입력하세요."/>
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호를 입력하세요."/>
				</div>
				<div class="form-group">
					<label>주소</label>
					<input type="text" class="form-control" id="userAddress" name="userAddress" placeholder="주소를 입력하세요."/>
				</div>				
				<div class="col text-center">
					<input type="submit" class="btn btn-primary" value="회원가입">
				</div>
			</form>			
<%-- 			<form:form id="userJoin" action="/member/user" method="post" modelAttribute="user">
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
			</form:form> --%>
	    <div class="col-sm-2 sidenav">
	    </div>
		</div>
	</div>
</div>
<!--validate JQuery  -->
<script src='<spring:url value="/resources/js/jquery.validate.js"/>'></script>
</body>
</html>