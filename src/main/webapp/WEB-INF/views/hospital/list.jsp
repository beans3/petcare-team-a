<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 검색</title>
</head>
<body>
<!-- HSJ 주소, 선택지, species 검색기능 -->
<div>
	<div>
	<h3>동물병원 목록</h3>
	<form method="get" action="/hospital/search">
		<select name="searchValue">
		  <option value="name">병원 이름</option>
		  <option value="address">병원 주소</option>
		</select>
		<input type="text" name="searchWord" placeholder="검색어를 입력하세요"><br>
		  <input type="checkbox" name="choice" value="1">야간진료
		  <input type="checkbox" name="choice" value="2">특수동물
		  <input type="checkbox" name="choice" value="3">응급실
		  <input type="checkbox" name="choice" value="4">애견호텔
		<input type="submit" value="검색">
	</form>
	</div>
	<div>
	<c:if test="${!empty list}">
	<h3>전체 리스트</h3>
		<c:forEach items="${list}" var="list">
		<a href='<c:out value="get?hospitalId=${list.hospital_id}"/>'>이름: ${list.hospital_name}</a><br>
			주소: ${list.hospital_address}<br>
			전화번호: ${list.hospital_phone}<br>
			이메일: ${list.hospital_email}<br>
			영업시작: ${list.hospital_open}<br>
			영업마감: ${list.hospital_close}<br>
			종류: ${list.hospital_species}<br>
			사진: ${list.hospital_photo}<br>
			소개: ${list.hospital_intro}<br>
			* CODE NAME *<br>
			<c:forEach items="${ codename }" var="codename">
				<c:if test="${list.hospital_id == codename.key}">
					${codename.value}
				</c:if>
			</c:forEach><br><br><br>
		</c:forEach>
	</c:if>
	</div>
	<div>
	<c:if test="${!empty search}">
	<h3>검색 결과</h3>
		<c:forEach items="${search}" var="list">
		<a href='<c:out value="get?hospitalId=${list.hospital_id}"/>'>이름: ${list.hospital_name}</a><br>
			주소: ${list.hospital_address}<br>
			전화번호: ${list.hospital_phone}<br>
			이메일: ${list.hospital_email}<br>
			영업시작: ${list.hospital_open}<br>
			영업마감: ${list.hospital_close}<br>
			종류: ${list.hospital_species}<br>
			사진: ${list.hospital_photo}<br>
			소개: ${list.hospital_intro}<br>
			* CODE NAME *<br>
			<c:forEach items="${ codename }" var="codename">
				<c:if test="${list.hospital_id == codename.key}">
					${codename.value}
				</c:if>
			</c:forEach><br><br><br>
		</c:forEach>
	</c:if>
	</div>
</div>

</body>
</html>