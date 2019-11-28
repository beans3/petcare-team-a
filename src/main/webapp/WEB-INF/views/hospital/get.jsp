<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>병원 상세</title>

    <!-- Bootstrap Core CSS -->
<!--      <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!--    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="/resources/css/star.css">
    
    <style>
    	#red_rating{color:#CC0000; margin-left:7px;}
    	#gray_rating{color:#b4b4b4;}
    	#del_review{float:right; margin-right:15px;}
    	#content{margin-left:15px;}
    	#userid{margin-left:107px; color:#a0a0a0;}
    	#rating{margin-left:7px;}
    	#top{padding: 0 0 10px 0;}
    	#review_bottom{padding-bottom:20px;}
    </style>
</head>
<body>

	<div>
	<h3>"<c:out value="${hospital.hospitalName}"/>" 병원</h3>
			이름: <c:out value="${hospital.hospitalName}"/><br>
			주소: <c:out value="${hospital.hospitalAddress}"/><br>
			전화번호: <c:out value="${hospital.hospitalPhone}"/><br>
			이메일: <c:out value="${hospital.hospitalEmail}"/><br>
			영업시작: <c:out value="${hospital.hospitalOpen}"/><br>
			영업마감: <c:out value="${hospital.hospitalClose}"/><br>
			종류: <c:out value="${hospital.hospitalSpecies}"/><br>
			사진: <c:out value="${hospital.hospitalPhoto}"/><br>
			소개: <c:out value="${hospital.hospitalIntro}"/><br>
			전문분야: <c:forEach items="${codename}" var="codename">
					${codename} <!-- HSJ 아이콘으로 교체 -->
			</c:forEach><br>
			
			<c:if test="${not empty sessionScope.user}">
				<form method="get" action="/favorite/register">
					<input type=hidden name="hospitalId" value="${hospital.hospitalId}">
					<input type="submit" value="즐겨찾기">
					즐겨찾기 상태 (추가 안함 0/ 추가함 1): <c:out value="${check}"/>
					<!-- HSJ 즐겨찾기 버튼, on/off 기능 -->
				</form>
				
				<form method="get" action="/reserv/go_reservation">
					<input type=hidden name="hospitalId" value="${hospital.hospitalId}">
					<input type="submit" value="예약">
					<!-- HSJ 예약 버튼, on/off 기능 -->
				</form>
			</c:if>
			
			
			
	</div>

<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
			<i class="fa fa-apple"></i> 병원 리뷰
			<c:if test="${!empty user}">
				<button id='addReviewBtn' class='btn btn-primary btn-xs pull-right'>리뷰 작성</button>
			</c:if>
		</div>
		
		<ul class="chat">
			<li class="left clearfix">
				<div>
					<div class="header">
						<strong class="primary-font"></strong>
						<small class="pull-right text-muted"></small>
					</div>
					<p></p>
				</div>
			</li>
		</ul>
		<div class="panel-footer"></div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
  		<div class="modal-content">
   			<div class="modal-header">
    			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
   			 	<h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
   			</div>
   			<div class="modal-body">
				<div class = "form-group">
					<label>평점</label>
					<span class="star-input">
						<span class="input">
    						<input type="radio" name="reviewRating" value="1" id="p1">
    						<label for="p1">1</label>
    						<input type="radio" name="reviewRating" value="2" id="p2">
    						<label for="p2">2</label>
    						<input type="radio" name="reviewRating" value="3" id="p3">
    						<label for="p3">3</label>
    						<input type="radio" name="reviewRating" value="4" id="p4">
   					 		<label for="p4">4</label>
    						<input type="radio" name="reviewRating" value="5" id="p5">
    						<label for="p5">5</label>
  						</span>
  						<output for="star-input"><b>0</b>점</output>
					</span>
				</div>
    			<div class ="form-group">
     				<label>내용</label>
     				<textarea class ="form-control" name='reviewContent' rows="3" style="resize: none;"></textarea>
   				</div>
   			</div>
   
			<div class="modal-footer">
    			<button id = 'modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
    			<button id = 'modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
    			<button id = 'modalCloseBtn' type="button" class="btn btn-default">닫기</button>
   			</div>
  		</div>
 	</div>
</div>

<script type="text/javascript" src="/resources/js/review.js"></script>
<script src="/resources/js/star.js"></script>
<script>
$(document).ready(function(){
	
	//병원아이디
	var hospital = '<c:out value="${hospital.hospitalId}"/>'
	var reviewUL = $(".chat");
	
	console.log(hospital);
	
	showList(1);

	//리뷰 리스트 출력
	function showList(page) {
		
		console.log("show list " + page);
		
		reviewService.getList({hospitalId:hospital,page: page|| 1 }, function(reviewCnt, list) {
			
			console.log("reviewCnt: " + reviewCnt);
			
			if(page == -1){
				page = Math.ceil(reviewCnt/10.0);
				showList(page);
				return;
			}
			
			var str="";
			
			if(list == null || list.length == 0) {
				reviewUL.html("등록된 리뷰가 없습니다.");
				return;
			}
			
			for (var i = 0, len = list.length || 0; i < len; i++) {
			      
				str +="<li class='left clearfix'>";
			       if(list[i].reviewRating == 1){
			    	   str+="<div id='review_bottom'><div id='top'><strong id='red_rating'>★</strong><strong id='gray_rating'>★★★★</strong>";
			       }else if(list[i].reviewRating == 2){
			    	   str+="<div id='review_bottom'><div id='top'><strong id='red_rating'>★★</strong><strong id='gray_rating'>★★★</strong>";
			       }else if(list[i].reviewRating == 3){
			    	   str+="<div id='review_bottom'><div id='top'><strong id='red_rating'>★★★</strong><strong id='gray_rating'>★★</strong>";
			       }else if(list[i].reviewRating == 4){
			    	   str+="<div id='review_bottom'><div id='top'><strong id='red_rating'>★★★★</strong><strong id='gray_rating'>★</strong>";
			       }else if(list[i].reviewRating == 5){
			    	   str+="<div id='review_bottom'><div id='top'><strong id='red_rating'>★★★★★</strong>";
			       }

			       str += "<strong id='rating'>"+list[i].reviewRating+"</strong>"
			       str +="<sapn id='content'>"+list[i].reviewContent+"</span>";
			       if(list[i].userId == "${user.userId}"){
			       		str += "<span><a href=javascript:void(0) id='del_review' class='delete' data-no="+list[i].reviewNo+"><i class='fa fa-trash'></i></a>";
			       }
			       str +=" </span></div><span id='userid' class='primary-font'>"+list[i].userId+"  |  ";
			       str +=" <small>"+reviewService.displayTime(list[i].reviewRegdate)+"</small></span>";
			       str +="</div></li>";
			}
			reviewUL.html(str);
			
			showReviewPage(reviewCnt);
			
		}); // end function
	}// end show List
	
	var pageNum = 1;
	var reviewPageFooter = $(".panel-footer");
	
	//리뷰페이징
	function showReviewPage(reviewCnt){
		
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= reviewCnt){
			endNum = Math.ceil(reviewCnt/10.0);
		}
		
		if(endNum * 10 <reviewCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			
		}
		
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		reviewPageFooter.html(str);
	}
	
	//리뷰 페이지 번호 클릭 이벤트
	reviewPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});

	var modal = $(".modal");

	//리뷰 등록 아이디
	var user = "${user.userId}";

	//모달 내용 입력값
	var modalInputContent = modal.find("textarea[name='reviewContent']");

	//리뷰 삭제버튼
	var modalRemoveBtn = $("#modalRemoveBtn");
	//리뷰 등록버튼
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	//리뷰닫기 버튼이벤트
	$("#modalCloseBtn").on("click", function(e){

		modal.modal('hide');
	});
	    
	//리뷰작성 버튼
	$("#addReviewBtn").on("click", function(e){
	        
	 	modal.find("output>b").text(0);
	 	$("input:radio[name='reviewRating']").prop('checked', false);
		modal.find("textarea").val("");	
	 	modal.find("button[id !='modalCloseBtn']").hide();  
	    modalRegisterBtn.show();
	        
	    $(".modal").modal("show");
	        
	});
	
    //리뷰 등록 이벤트 처리
    modalRegisterBtn.on("click", function(e){
    	var rating = modal.find("input[name=reviewRating]:checked").val();
    	
    	var review = {
    			userId : user,
    			reviewContent : modalInputContent.val(),
    			reviewRating : rating,
    			hospitalId:hospital
    	};
    	
    	
    	if(rating == null){
    		alert("평점을 선택해주세요.");
    		return;
    	}
    	
    	if(modalInputContent.val() == ""){
    		alert("내용을 입력해주세요.");
    		return;
    	}
    	reviewService.add(review, function(result){
    		alert("리뷰를 등록 했습니다.");

    		modal.modal("hide");
    		
    		showList(pageNum);
    	});
    });
    
    //리뷰 삭제
	$(".chat").on("click", '.delete', function(e){
		var reviewNo = $(this).data("no");
		 console.log(reviewNo);
		
		 if(confirm("리뷰를 삭제하시겠습니까?") == true){
			reviewService.remove(reviewNo, function(e){
				showList(pageNum);
		 	});
		 }else{
			 return;
		 }
	});	
});
</script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>