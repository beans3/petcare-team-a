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
            <div style="width: 30%; float:none; margin:0 auto" >
                <div>
                	<h1>병원예약</h1>
					<div class="row text-center" style="margin-bottom: 5%;">
						<h4>예약할 날짜를 입력해주세요</h4><br>
						<p>예약이 확정되면 유선상으로 알려드립니다.</p><br>
						<form id="reserve" action="/reserv/reservationForm" method="post" onsubmit="return goconfirm(this);">
							<input type="hidden" name="hospitalId" value="${hospitalId}">
							<select id="petNo" name="petNo">
							<c:forEach items="${pets}"  var="pet">
								<option value="${pet.pet_no}">${pet.pet_name} </option>
							</c:forEach>
							</select>
							<input type="text" id="datepicker" name="apptDate"> 
							<select id="apptTime" name="apptTime">
								<option value="09:00:00">09:00</option>
								<option value="09:30:00">09:30</option>
								<option value="10:00:00">10:00</option>
								<option value="10:30:00">10:30</option>
								<option value="11:00:00">11:00</option>
								<option value="11:30:00">11:30</option>
								<option value="12:00:00">12:00</option>
								<option value="12:30:00">12:30</option>
								<option value="14:00:00">14:00</option>
								<option value="14:30:00">14:30</option>
								<option value="15:00:00">15:00</option>
								<option value="15:30:00">15:30</option>
								<option value="16:00:00">16:00</option>
								<option value="16:30:00">16:30</option>
								<option value="17:00:00">17:00</option>
								<option value="17:30:00">17:30</option>
								<option value="18:00:00">18:00</option>
								<option value="18:30:00">18:30</option>
								<option value="00:00:00">야간예약(시간협의)</option>
							</select> 
							<br>
							<p style="margin-top: 2%;">예약 메모를 남겨주세요</p>
							<textarea id="apptNote" name="apptNote" rows="5"
								style="width: 60%; margin-bottom: 10%;"></textarea>
							<br>
							<button type="submit" class="btn btn-primary"> 예약</button>
						</form>
					</div>
            	</div>
         	</div>
    	</div>

	<!--validate JQuery  -->
	<script src='<spring:url value="/resources/js/jquery.validate.js"/>'></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<!-- jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
		//캘린더 설정, 20일까지 예약가능, 일요일 예약 불가S
		$(function() {
			console.log("왜안되는거지..");
			$("#datepicker").datepicker({
				minDate : 0,
				maxDate : 20,
				beforeShowDay : noSundays
			});
		});
		
		function noSundays(date) {
			return [ date.getDay() != 0, '' ];
		}
		//한글로 변경
		$.datepicker.regional['kr'] = {
			closeText : '닫기', // 닫기 버튼 텍스트 변경
			currentText : '오늘', // 오늘 텍스트 변경
			monthNames : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월', '7 월',
					'8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
			monthNamesShort : [ '1 월', '2 월', '3 월', '4 월', '5 월', '6 월',
					'7 월', '8 월', '9 월', '10 월', '11 월', '12 월' ], // 개월 텍스트 설정
			dayNames : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ], // 요일 텍스트 설정
			dayNamesShort : [ '월', '화', '수', '목', '금', '토', '일' ], // 요일 텍스트 축약 설정&nbsp;   dayNamesMin: ['월','화','수','목','금','토','일'], // 요일 최소 축약 텍스트 설정
			dateFormat : 'yy-mm-dd' // 날짜 포맷 설정
		};

		// Seeting up default language, Korean
		$.datepicker.setDefaults($.datepicker.regional['kr']);
		
	</script>
	<script type="text/javascript">
	
	//전송 누르기 전에 확인
	function goconfirm() {
		var reserveDate = $('#datepicker').val();
		var reserveTime = $('#apptTime').val();
		console.log(reserveDate);
		if(reserveDate == null || reserveDate == '') {
			alert('예약하실 날짜를 입력해주세요');
			return false;
		}
		if(reserveTime == null) {
			alert('예약하실 시간을 입력해주세요');
			return false;
		}
		var Yn = confirm("현재 예약하신 날짜는 "+reserveDate+", 시간은 "+reserveTime+"입니다. 예약을 확정하시겠습니까?");
		if(Yn == false){
			return false;
		}
		
	}
	</script>
</body>
</html>