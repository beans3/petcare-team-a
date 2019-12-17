<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:hover{color:red;}
	.screen{margin-left:200px; margin-right:200px;}
	#search{margin-bottom:15px;}
	#null{text-align:center;}
</style>
</head>
<body>

<form id="actionForm" action="/appointment/list" method="get">
	<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
	<input type='hidden' name='searchType' value = '${pageMaker.cri.searchType}'>
	<input type='hidden' name='keyword' value = '${pageMaker.cri.keyword}'>
</form>

<div class="screen">
	<div class="panel panel-default">
		<div class="panel-heading">예약내역</div>
	</div>
	
<%-- 	<div id="search" class="form-inline">
		<select id="searchTypeSel" name="searchType">
			<option value="">검색조건</option>
			<option value="i">예약아이디</option>
			<option value="p">동물이름</option>
		</select>
		<input class="form-control" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
		<button id="searchBtn" class="btn btn-primary">검색</button>
	</div> --%>
	<div>
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>예약일련번호</th>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>동물이름</th>
				<th>예약아이디</th>
				<th>전화번호</th>
				<th>예약상태</th>
			</tr>
			
			<c:forEach items="${apptLists}" var="apptList">
				<tr>
					<td>${apptList.apptNo}</td>
					<td><fmt:formatDate value="${apptList.apptDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${apptList.apptTime}" pattern="HH:mm"/></td>
					<td>${apptList.petName}</td>
					<td>${apptList.userId}</td>
					<td>${apptList.userPhone}</td>
					<!-- 현재 날짜, 예약날짜 비교하기 위해 생성 -->
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${apptList.apptDate}" pattern="yyyyMMdd" var="apptDay"/>
					<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />  
					<!-- 오늘날짜보다 큰 것만 활성화, 나머지는 비활성화-->
					<c:if test="${(apptList.apptStatus == 0) and (today<=apptDay)}">
						<td><a class='move' href='<c:out value="${apptList.apptNo}"/>'>예약완료</a></td>
					</c:if>
					<c:if test="${(apptList.apptStatus == 0) and (today>apptDay)}">
						<td bgcolor="#F78181" style="color: black;">날짜경과</td>
					</c:if>
					<c:if test="${apptList.apptStatus == 1}">
						<td bgcolor="#F78181" style="color: black;">예약취소</td>
					</c:if>
					<c:if test="${apptList.apptStatus == 2}">
						<td bgcolor="#333333" style="color: white;">진료완료</td>
					</c:if>
				</tr>	
			</c:forEach>
			<tr>
				<c:if test="${empty apptLists}">
					<td colspan='6' id="null">예약된 내역이 없습니다.</td>
				</c:if>
			</tr>
		</table>
		
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage -1}">이전</a>
					</li>
				</c:if>
				
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}&nbsp;</a></li>
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
	
	var modify = '<c:out value="${modify}"/>';
	
	checkModify(modify);
	
	history.replaceState({}, null, null); //alert창 중복 방지
	
	function checkModify(modify){
		
		if(modify === '' || history.state){
			return;
		}
		
		alert("예약상태를 수정했습니다.");
	}
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='apptNo' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action", "/appointment/modify");
		actionForm.submit();
	});
	
	setSearchTypeSelect();
	
	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');
		
		$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
		//검색 버튼이 눌리면
		$('#searchBtn').on('click',function(){
			var searchTypeVal = $searchTypeSel.val();
			var keywordVal = $keyword.val();
			//검색 조건 입력 안했으면 경고창 
			if(!searchTypeVal){
				alert("검색 조건을 선택하세요");
				$searchTypeSel.focus();
				return;
			//검색어 입력 안했으면 검색창
			}else if(!keywordVal){
				alert("검색어를 입력하세요");
				$('#keyword').focus();
				return;
			}
			var url = "list?pageNum=1"
					+ "&amount=" + "${pageMaker.cri.amount}"
					+ "&searchType=" + searchTypeVal
					+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		});
	}
});
</script>
</body>
</html>