<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료차트 작성</title>
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
						<form name="medicalRc" id="medicalRc" action="/mr/insertMedicalRc" method="post" onsubmit="return goconfirm(this);">
							<c:set var="hospitalId" value="${hospital.hospitalId }" scope="session"></c:set>
							<input type="hidden" name="hospitalId" id = "hospitalId" value="${hospitalId}">
							<input type="hidden" name="apptNo" id = "apptNo" value="">
							<br>
							<textarea id="treatContent" name="treatContent" rows="10"
								style="width: 180%; margin-bottom: 10%;"></textarea>
							<br>
							<button type="submit" class="btn btn-primary">진료기록 작성</button>
						</form>
            	</div>
         	</div>
    	</div>

</body>
<script type="text/javascript">
//로드될 때 파라미터값 apptNo을 변수로 갖고온다.
window.onload = function(){
	var p = getParams();
	var apptNoVar = (p["apptNo"]); 
	document.medicalRc.apptNo.value=apptNoVar;
}


function getParams() {
    // 파라미터가 담길 배열
    var param = new Array();
 
    // 현재 페이지의 url
    var url = decodeURIComponent(location.href);
    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
    url = decodeURIComponent(url);
 
    var params;
    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
    params = url.substring( url.indexOf('?')+1, url.length );
    // 파라미터 구분자("&") 로 분리
    params = params.split("&");
 
    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
    var size = params.length;
    var key, value;
    for(var i=0 ; i < size ; i++) {
        key = params[i].split("=")[0];
        value = params[i].split("=")[1];
 
        param[key] = value;
    }
 
    return param;
}

//전송 누르기 전에 확인
function goconfirm() {
	
	
	var treatContent = $('#treatContent').val();

	if(treatContent == null || treatContent =="") {
		alert('진료 내용을 입력하셔야 합니다.');
		return false;
	}
	if(!confirm("진료내용을 작성하시겠습니까?")){
		return false;
	}
		
}
</script>
</html>