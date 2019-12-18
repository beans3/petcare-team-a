<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<form action="faqInsert" method="post">
	<div style="clear: both; width: 60%; margin: auto;">
			<div hidden>
				<label>id</label>
				<input type="text" class="form-control" name="userId" value="${user.userId}" readonly/>
			</div>
			<div>
				<label>title</label>
				<input type="text" class="form-control" name="faqTitle" />
			</div>
			<div>
				<label>content</label>
				<pre><textarea class="form-control" name="faqContent" rows="10"></textarea></pre>
			</div>
			<div>
				<input class="btn btn-default" type="submit" value="Edit">
				<a class="btn btn-default" href="faqList">faqList</a>
			</div>
	</div>
</form>
</html>