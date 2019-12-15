<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.screen{margin-left:200px; margin-right:200px;}
</style>
</head>
<body>
<div class="screen">
<div class="row text-center" style="width: 100%">
   <div style="width: 30%; float:none; margin:0 auto" >
       <div>
			<strong>반려 동물 정보</strong>
	   </div>
  </div>
</div>
	<div class="form-group">
		<label>이름</label> <input class="form-control" type="text" name="petName"  value="${pet.petName}" readonly="readonly">
	</div>

	<div class="form-group">
		<label>성별</label> <input class="form-control" type="text" name="petGender" value="${pet.petGender}" readonly="readonly">
	</div>

	<div class="form-group"> 
		<label>중성화 여부</label> <input class="form-control" type="text" name="petNeuter" value="${pet.petNeuter}" readonly="readonly">
	</div>
		
	<div class="form-group">
		<label>몸무게</label> <input class="form-control" type="text" name="petWeight" value="${pet.petWeight}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>종류</label> <input class="form-control" type="text" name="petSpecies" value="${pet.petSpecies}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>품종</label> <input class="form-control" type="text" name="petBreed" value="${pet.petBreed}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>나이</label> <input class="form-control" type="text" name="petAge" value="${pet.petAge}" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label>마지막 진료일</label> <input class="form-control" type="text" name="treatRegdate" value="<fmt:formatDate value="${pet.petRegdate}" pattern="yyyy/MM/dd"/>" readonly="readonly">
	</div>
	
	<div>
		<button data-oper='modify' class="btn btn-default">수정</button>
		<button data-oper='list' class="btn btn-default">목록</button>
	</div>
</div>
	<form id='operForm' action="/petl/modify" method="get">
		<input type="hidden" id='petNo' name='petNo' value="${pet.petNo}">
		<input type='hidden' name='pageNum' value="${cri.pageNum}">
		<input type='hidden' name='amount' value="${cri.amount}">
	</form>

<script>
$(document).ready(function(e){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/pet/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#petNo").remove();
		operForm.attr("action", "/pet/list")
		operForm.submit();
	});	
});

</script>
</body>
</html>