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
						<form id="insertMedicalRc" action="/mr/insertMedicalRc" method="post" onsubmit="return goconfirm(this);">
						
							<input type='hidden' name='apptNo' id='apptNo' >
							<!-- session값 넘기기 -->
							<%-- <c:set var="hospitalId" value="${hospital.hospitalId}" scope="session"  /> --%>
							<input type='hidden' name='hospitalId' id='hospitalId' value='${hospitalId}' >
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
</script>
<script type="text/javascript">
//예약번호
var apptNoVar = "";

$(window).load(function(){

	var getParameters = function (paramName) {
		// 리턴값을 위한 변수 선언 
		var returnValue;
		// 현재 URL 가져오기 
		var url = location.href; 
		// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔 
				var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&'); 
		// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return 
		for (var i = 0; i < parameters.length; i++) { 
			var varName = parameters[i].split('=')[0]; 
			if (varName.toUpperCase() == paramName.toUpperCase()) { 
				returnValue = parameters[i].split('=')[1]; 
				return decodeURIComponent(returnValue); 
			} 
		} 
	};
	//변수에 저장
	apptNoVar = getParameters('apptNo');
	//input값에 넣어준다.
	document.getElementById("apptNo").value=(apptNoVar);
});

//전송 누르기 전에 확인
function goconfirm() {
	var recordCntnRgst = $('#recordCntn').val();
	alert(apptNoVar);
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