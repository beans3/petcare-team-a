<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function changeAction() {
    const location = document.getElementById("category_id").value;
    
    if (location == "manager") {
        document.myform.formaction = "/manager/login";
        console.log(document.myform.formaction )
        return true;
    }
    
    if (location == "admin") {
        document.myform.formaction  = "/admin/login";
        console.log(document.myform.formaction )
        return true;
    }
}
</script>
</head>
<body>
	
<div class="container" style="border: solid black; padding-top: 25px; margin-top: 25px">
    <div class="container-fliud d-flex justify-content-center">
        <h1><strong>Login</strong></h1>
    </div>
    <hr>
    <form id="form_id" action="/login" name="myform" method="POST" class="was-validated">
        <div id="userlogin">
	        <div class="form-group">
	            <label><strong>Category</strong></label>
	            <select class="form-control" id="category_id" name="sellist" required>
	                <option disabled selected value>select an option</option>
	                <option value="admin">관리자</option>
	                <option value="manager">일반회원</option>
	                <option value="user">병원회원</option>
	            </select>
	        </div>
        </div>
        
        
        <!-- 일반/admin 회원 -->
        <div class="form-group">
            <label><strong>ID</strong></label>
            <input type="text" class="form-control" id="fname" name="userId" placeholder="enter your ID" required>
        </div>
        <div class="form-group">
            <label for="password"><strong>Password</strong></label>
            <input type="password" id="password" class="form-control" name="userPw" placeholder="enter your password" required>
        </div>
        <div class="form-group">
            <button type="submit" id="login" class="btn btn-primary" style="width: 100%">Login</button>
        </div>
        <div class="form-group">
            <h5>Don't have account ? <a href="/admin/register">Sign Up</a></h5>
        </div>
        
        <!-- 병원회원 -->
        <div class="form-group">
            <label><strong>ID</strong></label>
            <input type="text" class="form-control" id="fname" name="hospitalId" placeholder="enter your ID" required>
        </div>
        <div class="form-group">
            <label for="password"><strong>Password</strong></label>
            <input type="password" id="password" class="form-control" name="hospitalPw" placeholder="enter your password" required>
        </div>
        <div class="form-group">
            <button type="submit" id="login" class="btn btn-primary" style="width: 100%">Login</button>
        </div>
        <div class="form-group">
            <h5>Don't have account ? <a href="/admin/register">Sign Up</a></h5>
        </div>
    </form>
</div>
</body>
</html>