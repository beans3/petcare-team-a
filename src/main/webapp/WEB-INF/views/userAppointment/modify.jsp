<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#status{margin-left:-15px; margin-bottom:15px; width:200px;}
	.screen{margin-left:200px; margin-right:200px;}
</style>
</head>
<body>
<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">예약정보</div>
	</div>
	
	<form role="form" action="/userAppointment/modify" method="post">
		<input type='hidden' name='apptNo' value="${appt.apptNo}">
		<input type="hidden" name='pageNum' value="${cri.pageNum}">
		<input type="hidden" name='amount' value="${cri.amount}">
		<input type="hidden" name='searchType' value="${cri.searchType}">
		<input type="hidden" name='keyword' value="${cri.keyword}">
		
		<div class="form-group">
			<label>예약날짜</label> <input class="form-control" value=<fmt:formatDate value="${appt.apptDate}" pattern="yyyy/MM/dd"/> readonly="readonly">
		</div>
		<div class="form-group">
			<label>예약시간</label> <input class="form-control" value=<fmt:formatDate value="${appt.apptTime}" pattern="HH:mm"/> readonly="readonly">
		</div>
		<div class="form-group">
			<label>병원</label> <input class="form-control" value="${appt.hospitalName}" readonly="readonly">
		</div>
		<div class="form-group">
			<label>동물이름</label> <input class="form-control" value="${appt.petName}" readonly="readonly">
		</div>
		<div class="container" id="status">
			<label>예약상태</label>
			<select  class="form-control" name="apptStatus">
				<option value="0" <c:if test="${appt.apptStatus == 0}">selected</c:if>>예약완료</option>
				<option value="1" <c:if test="${appt.apptStatus == 1}">selected</c:if>>에약취소</option>
			</select>
		</div>
			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			<button type="button" data-oper='remove' class="btn btn-default">삭제</button>
			<button type="button" data-oper='list' class="btn btn-default">목록</button>
		<div>
		
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", '/userAppointment/remove?apptNo=${appt.apptNo}');
		}else if(operation === 'list'){
			formObj.attr("action", "/userAppointment/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var searchTypeTag = $("input[name='searchType']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(searchTypeTag);
			formObj.append(keywordTag);
		}
		
		formObj.submit();
	});
});
</script>
</body>
</html>