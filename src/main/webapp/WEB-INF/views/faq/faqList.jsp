<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
<div class="container">
	<c:choose>
			<c:when test="${user.userAuthority == 'ADMIN'}">
					<a class="btn btn-default"E href="faqForm">FAQ Write</a>
			</c:when>
		    <c:otherwise>
		     		<div hidden></div>
		    </c:otherwise>
	</c:choose>
	<c:forEach items="${faqList}" var="faq">
	    <div class="notice notice-success">
	    	<div hidden>${faq.faqNo}</div>
	        <strong> Q </strong> ${faq.faqTitle} | ${faq.faqRegdate}
			<c:choose>
				<c:when test="${user.userAuthority == 'ADMIN'}">
					<a class="btn btn-default" href="faqModify?faqNo=${faq.faqNo}">Edit</a>
					<a class="btn btn-default" href="delete?faqNo=${faq.faqNo}">X</a>
				</c:when>
	 			<c:otherwise>
	  				<div hidden></div>
	  			</c:otherwise>
			</c:choose>
	        	<span class="pull-right text-success readMore">Read</span>
	        <div class="desc">
	           <p>작성자: ${faq.userId}</p>
	           <pre><p>${faq.faqContent}</p></pre>    
	        </div>
	    </div>
    </c:forEach>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".readMore").click(function(){
	var This=$(this);    
	$(this).next().toggle(function(){
	    if(This.text()=="Read"){
	      This.text("Hide") 
	    }
	    else{
	        This.text("Read") 
	    }
	})
});})
</script>
</body>
<style>
.notice:first-child{
    margin-top:10px;
    }
.notice {
    padding: 15px;
    background-color: #fafafa;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;
    -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
       -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
            box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
}
.notice-sm {
    padding: 10px;
    font-size: 80%;
}
.notice-lg {
    padding: 35px;
    font-size: large;
}
.notice-success {
    border-color: #53dff8;
}
.notice-success>strong {
    color: #53dff8;
    font-size: 30px;
}
.notice-info {
    border-color: #45ABCD;
}
.notice-info>strong {
    color: #53dff8;
}
.notice-warning {
    border-color: #FEAF20;
}
.notice-warning>strong {
    color: #FEAF20;
}
.notice-danger {
    border-color: #d73814;
}
.notice-danger>strong {
    color: #d73814;
}
.notice>.desc{
    display:none;
    }
.readMore{
    cursor:pointer;
}
</style>
</html>