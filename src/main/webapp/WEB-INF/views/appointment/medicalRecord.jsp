<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원예약</title>
<link href='<spring:url value="/resources/css/custom.css"/>'
	rel="stylesheet" />
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />

<script src='<spring:url value="/resources/js/user/Join.js"/>'></script>

</head>

<body>

		<!--  가운데 정렬  -->
		<div class="row text-center" style="width: 100%">
            <div style="width: 30%; float:none; margin:0 auto; margin-left: 20%;" >
                <div>
                	<h1>진료차트 작성</h1>
						<form id="reserve" action="/mr/insertMedicalRc" method="post" onsubmit="return goconfirm(this);">
							<input type="hidden" name="hospitalId" id = "hospitalId" value="${hospitalId}">
							<input type="hidden" name="apptNo" id = "apptNo" value="${apptNo}">
							<input type="hidden" name="petNo" value="${petNo}">
							<br>
							<textarea id="recordCntn" name="recordCntn" rows="10"
								style="width: 180%; margin-bottom: 10%;"></textarea>
							<br>
							<button type="submit" class="btn btn-primary">진료기록 작성</button>
						</form>
            	</div>
         	</div>
    	</div>

</body>
<script type="text/javascript">

//전송 누르기 전에 확인
function goconfirm() {
	var recordCntnRgst = $('#recordCntn').val();

	if(recordCntnRgst == null || recordCntnRgst =="") {
		alert('진료 내용을 입력하셔야 합니다.');
		return false;
	}
	if(!confirm("진료내용을 작성하시겠습니까?")){
		return false;
	}
		
}
</script>
</html>