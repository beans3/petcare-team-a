<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 정보수정</title>
<link href='<spring:url value="/resources/css/custom.css"/>' rel="stylesheet" />
<script src='<spring:url value="/resources/js/hospital/update.js"/>'></script>
<script type="text/javascript">
//checkbox값 불려오기 위한 함수
window.onload = function() {
	//c:forEach문을 이용해서 list배열에 code정보 저장
	var list1 = new Array();
	<c:forEach items="${code}" var="code">
		list1.push("${code.cCode}");
		list1.push("${code.cName}");
	</c:forEach>
	//for문을 이용해서 checked 표시
	for(var i = 0; i < list1.length;i++){
		if(list1[i] == 1){
			document.getElementById("cCode1").checked = true;
		}else if(list1[i] == 2){
			document.getElementById("cCode2").checked = true;
		}else if(list1[i] == 3){
			document.getElementById("cCode3").checked = true;
		}else if(list1[i] == 4){
			document.getElementById("cCode4").checked = true;
		}
	}
};
</script>
</head>
<body>
<div>
	<div class="page-title">
		<div>
			<strong>병원 정보수정</strong>
		</div>
	</div>
</div>
<div class="container-fluid text-center m-t-30 m-b-20">
	<div class="row content">
		<div class="col-sm-2 sidenav">
		</div>
		<div class="col-sm-8 text-left" style="height:100%;">
			<form id="hospitalModify" action="/hospital/modify" method="post">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" readonly="readonly" id="hospitalId" name="hospitalId" value="${list.hospitalId}">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="hospitalPw" name="hospitalPw" value="${list.hospitalPw}">
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" readonly="readonly" id="hospitalName" name="hospitalName" value="${list.hospitalName}">
				</div>				
				<div class="form-group">
					<label>이메일</label>
					<input type="email" class="form-control" id="hospitalEmail" name="hospitalEmail" value="${list.hospitalEmail}">
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<input type="text" class="form-control" id="hospitalPhone" name="hospitalPhone" value="${list.hospitalPhone}">
				</div>
				<div class="form-group">
					<label>주소</label>
					<input type="text" class="form-control" id="hospitalAddress" name="hospitalAddress" value="${list.hospitalAddress}">
				</div>
				
				<div class="form-group">
						<label style="font-weight: bold;">문여는 시간</label>
						<input class="form-control" id="hospitalOpen" name="hospitalOpen" value="${list.hospitalOpen}" readonly="readonly">
				</div>
				<div class="form-group">
						<label style="font-weight: bold;">문닫는 시간</label>
						<input class="form-control" id="hospitalOpen" name="hospitalOpen" value="${list.hospitalClose}" readonly="readonly">
				</div>				
<%-- 				<div class="row">
					<div class="form-group col-md-6">
						<label style="font-weight: bold;">문여는 시간</label>
						<select class="form-control" id="hospitalOpen" name="hospitalOpen" value="${list.hospitalOpen}">
							<c:forEach begin="0" end="24" step="1" var="hour">
								<c:if test="${hour < 10 }">
									<c:set value="0${hour}" var="hour"></c:set>
								</c:if>
								<option value="${hour}" selected="<c:if test="${fn:contains(list.hospitalOpen,hour)}">selected</c:if>">${hour}:00</option>
							</c:forEach>
						</select>						
					</div>
					<div class="form-group col-md-6">
						<label style="font-weight: bold;">문닫는 시간</label>
						<select class="form-control" id="hospitalClose" name="hospitalClose" value="${list.hospitalClose}">
							<c:forEach begin="0" end="24" step="1" var="hour">
								<c:if test="${hour < 10 }">
									<c:set value="0${hour}" var="hour"></c:set>
								</c:if>
								<option>${hour}:00</option>
							</c:forEach>
						</select>						
					</div>
				</div> --%>
				
				<div class="form-group">
					<p><label style="font-weight: bold;">특성을 골라주세요.</label></p>
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
				
				<div class="from-group">
					<label style="font-weight: bold;">취급 동물</label> 
					<select class="form-control" name="hospitalSpecies">
						<option value="개" <c:if test="${list.hospitalSpecies eq '개'}">selected</c:if>>개</option>
						<option value="고양이" <c:if test="${list.hospitalSpecies eq '고양이'}">selected</c:if>>고양이</option>
						<option value="말" <c:if test="${list.hospitalSpecies eq '말'}">selected</c:if>>말</option>
						<option value="새" <c:if test="${list.hospitalSpecies eq '새'}">selected</c:if>>새</option>
						<option value="햄스터" <c:if test="${list.hospitalSpecies eq '햄스터'}">selected</c:if>>햄스터</option>
						<option value="기니피그" <c:if test="${list.hospitalSpecies eq '기니피그'}">selected</c:if>>기니피그</option>
					</select> 
				</div>
				
				<div class="form-group">
					<label style="font-weight: bold;">세부사항</label>
					<textarea class="form-control" maxlength="2048" style="height: 350px;" name="hospitalIntro" id="hospitalIntro">${list.hospitalIntro}</textarea>
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