<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a:hover{color:red;}
	.screen{margin-left:200px; margin-right:200px;}
	#pets{text-align:center;}
</style>
</head>
<body>

<form id="actionForm" action="/pet/list" method="get">
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
</form>

<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">${user.userId}님의 반려동물
			<button id="regBtn" class="btn btn-xs pull-right btn btn-primary">추가</button>
		</div>
	</div>
	<div>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>등록일</th>
				<th>이름</th>
				<th>마지막 진료일</th>
			</tr>
			
			<c:forEach items="${list}" var="pet">
			<tr>
				<td><fmt:formatDate value="${pet.petRegdate}" pattern="yyyy/MM/dd"/></td>
				<td><a class='move' href='<c:out value="${pet.petNo}"/>'>${pet.petName}</a></td>
				<c:if test="${empty pet.treatRegdate}">
					<td>없음</td>
				</c:if>
				<c:if test="${!empty pet.treatRegdate}">
				<td><fmt:formatDate value="${pet.treatRegdate}" pattern="yyyy/MM/dd"/></td>
				</c:if>
			</tr>
			</c:forEach>

			<c:if test="${empty list}">
			 	<td colspan="3" id="pets">등록된 동물이 없습니다.</td>
			</c:if>
		</table>
		
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage -1}">이전</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next}">
					<li><a href="${pageMaker.endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>	
</div>

<script>
$(document).ready(function(){
	var regist = '<c:out value="${regist}"/>';
	var remove = '<c:out value="${remove}"/>';
	var modify = '<c:out value="${modify}"/>';
	var msg = "${msg}";
	
	console.log(remove);
	
	check(regist);
	checkRemove(remove);
	checkModify(modify);
	checkModifyUser(msg);
		
	history.replaceState({}, null, null); //alert창 중복 방지
	
	function checkModifyUser(msg){
		
		if(msg === '' || history.state){
			return;
		}
		
		alert("회원정보를 수정했습니다.");
	}
	//동물삭제 alert
	function checkRemove(remove){
		
		if(remove === '' || history.state){
			return;
		}
		
		if(parseInt(remove) > 0){
			alert("동물정보를 삭제완료했습니다.");
		}
	}
	
	//동물수정 alert
	function checkModify(modify){
		
		if(modify === '' || history.state){
			return;
		}
		
		if(parseInt(modify) > 0){
			alert("동물정보를 수정완료했습니다.");
		}
	}
	
	//동물 등록 완료 후 alert창 이벤트
	function check(regist){
		
		if(regist === '' || history.state){
			return;
		}
		
		if(parseInt(regist) > 0){
			alert("동물등록이 완료되었습니다.");
		}
	}
	
	//동물 등록 페이지 이동 버튼 이벤트
	$("#regBtn").on("click", function(){
		self.location = "/pet/register";
	});
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	//게시글 조회 시 pageNum, amount 파라미터 값 추가
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='petNo' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action", "/pet/get");
		actionForm.submit();
	});
});
</script>
</body>
</html>