<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 회원가입</title>
<link href='<spring:url value="/resources/css/custom.css"/>' rel="stylesheet" />
<script src='<spring:url value="/resources/js/user/Join.js"/>'></script>
</head>
<body>
<div class="row text-center" style="width: 100%">
   <div style="width: 30%; float:none; margin:0 auto" >
       <div>
			<strong>병원 회원가입</strong>
				<p>회원정보를 입력하여주세요.</p>
	   </div>
  </div>
</div>

<div class="container-fluid text-center m-t-30 m-b-20">
	<div class="row content">
		<div class="col-sm-2 sidenav">
		</div>
		<div class="col-sm-8 text-left" style="height:100%;">
			<form id="hospitalJoin" action="/hospital/Join" method="post">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" placeholder="아이디를 입력하세요." id="hospitalId" name="hospitalId">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." id="hospitalPw" name="hospitalPw">
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" placeholder="비밀번호 확인을 입력하세요." id="hospitalPw2" name="hospitalPw2">
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" placeholder="이름을 입력하세요." id="hospitalName" name="hospitalName">
				</div>				
				<div class="form-group">
					<label>이메일</label>
					<input type="email" class="form-control" placeholder="이메일을 입력하세요." id="hospitalEmail" name="hospitalEmail">
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<input type="text" class="form-control" placeholder="전화번호를 입력하세요." id="hospitalPhone" name="hospitalPhone">
				</div>
				<div class="form-group">
					<label>주소</label>
					<input type="text" class="form-control" placeholder="주소를 입력하세요." id="hospitalAddress" name="hospitalAddress">
				</div>
				
				<div class="row">
					<div class="form-group col-md-6">
						<label style="font-weight: bold;">문여는 시간</label>
						<select class="form-control" id="hospitalOpen" name="hospitalOpen">
							<c:forEach begin="0" end="24" step="1" var="hour">
								<c:if test="${hour < 10 }">
									<c:set value="0${hour}" var="hour"></c:set>
								</c:if>
								<option>${hour}:00</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group col-md-6">
						<label style="font-weight: bold;">문닫는 시간</label>
						<select class="form-control" id="hospitalClose" name="hospitalClose">
							<c:forEach begin="0" end="24" step="1" var="hour">
								<c:if test="${hour < 10 }">
									<c:set value="0${hour}" var="hour"></c:set>
								</c:if>
								<option>${hour}:00</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<p style="font-weight: bold;">특성을 골라주세요.</p>
					<div class="form-check form-check-inline col-md-3">
						<label class="form-check-label" for="cCode1">
							<input type="checkbox" class="form-check-input" name="cCode" id="cCode1" value="1">야간진료
						</label>
					</div>
					<div class="form-check form-check-inline col-md-3">
						<label class="form-check-label" for="cCode2">
							<input type="checkbox" class="form-check-input" name="cCode" id="cCode2" value="2">특수동물취급
						</label>
					</div>
					<div class="form-check form-check-inline col-md-3">
						<label class="form-check-label" for="cCode3">
							<input type="checkbox" class="form-check-input" name="cCode" id="cCode3" value="3">응급실
						</label>
					</div>	
					<div class="form-check form-check-inline col-md-3">
						<label class="form-check-label" for="cCode4">
							<input type="checkbox" class="form-check-input" name="cCode" id="cCode4" value="4">수술전문
						</label>
					</div>
				</div>

				<div class="form-group">
					<label style="font-weight: bold;">세부사항</label>
					<textarea class="form-control" placeholder="병원에 대해서 간단한 소개를 적어주세요." name="hospitalIntro" id="hospitalIntro" maxlength="2048" style="height: 350px;" ></textarea>
				</div>
				
				<div class="col text-center">
					<input type="submit" class="btn btn-primary" value="회원가입">
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