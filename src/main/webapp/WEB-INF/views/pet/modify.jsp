<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<div class="row text-center" style="width: 100%">
	   <div style="width: 30%; float:none; margin:0 auto" >
	       <div>
				<strong>반려 동물 수정</strong>
		   </div>
	  </div>
	</div>
	<form:form role="form" action="/pet/modify" method="post" modelAttribute="pet">
	
		<input type="hidden" name="petNo" value="${pet.petNo}">
		<input type="hidden" name='pageNum' value="${cri.pageNum}">
		<input type="hidden" name='amount' value="${cri.amount}">
	
		<div  class="form-group">
			<label>이름</label>
			<form:input class="form-control" path="petName"  value="${pet.petName}"/>
			<form:errors path="petName"/>
		</div>
		<div class="container" id="select">
			<label>성별</label> 
			<select name="petGender" class="form-control">
				<option value="수컷" <c:if test="${pet.petGender eq '수컷'}">selected</c:if>>수컷</option>
				<option value="암컷" <c:if test="${pet.petGender eq '암컷'}">selected</c:if>>암컷</option>
			</select> 
		</div>
	
		<div class="container" id="select">
			<label>중성화 여부</label> 
			<select name="petNeuter" class="form-control">
				<option value='실시' <c:if test="${pet.petNeuter eq '실시'}">selected</c:if>>실시</option>
				<option value="미실시" <c:if test="${pet.petNeuter eq '미실시'}">selected</c:if>>미실시</option>
			</select> 
		</div>
	
		<div class="form-group">
			<label>몸무게</label>
			<form:input class="form-control" path="petWeight" name="petWeight"/>
			<form:errors path="petWeight"/>
		</div>
	
		<div  class="form-group">
			<label>종류</label>
			<form:input class="form-control" path="petSpecies"/>
			<form:errors path="petSpecies"/>
		</div>

		<div  class="form-group">
			<label>품종</label>
			<form:input class="form-control" path="petBreed"/>
			<form:errors path="petBreed"/>
		</div>	
	
		<div  class="form-group">
			<label>나이</label>
			<form:input class="form-control" path="petAge"/>
			<form:errors path="petAge"/>
		</div>
		
		<div class="form-group">
			<label>마지막 진료일</label> <input class="form-control" type="text" name="treatRegdate" value="<fmt:formatDate value="${pet.petRegdate}" pattern="yyyy/MM/dd"/>" readonly="readonly">
		</div>
	
		<div>
<!-- 			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-default">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-default">목록</button> -->
			<!-- 버튼 모양 변경 -->
			<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-dark">목록</button>
		</div>
	</form:form>
</div>
<script>
$(document).ready(function(){
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", '/pet/remove?petNo=${pet.petNo}');
		}else if(operation === 'list'){
			/*작성예정 임지영*/
			/* formObj.attr("action", "/pet/list").attr("method", "get"); */
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		
		formObj.submit();
	});
});
</script>
</body>
</html>