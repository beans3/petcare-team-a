<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function change() {
	
	var loginSelect = document.getElementById("category_id");
	
	if (loginSelect.selectedIndex == 1) {
		
		document.getElementById("user").style.display="none";
		document.getElementById("hospital").style.display="";

	} else if (loginSelect.selectedIndex == 2) {
		
		document.getElementById("hospital").style.display="none";
		document.getElementById("user").style.display="";

	}
}
</script>
</head>
<body>
	<form name="loginForm" id="login" action="" method="post">    
		<div class="checkBoxGroup">
	    	<select class="form-control" id="category_id" name="sellist" onchange="change()" required>
				<option disabled selected value>select an option</option>
				<option value="user" id="staff">일반회원</option>
				<option value="hospital">병원회원</option>
			</select>
	    </div>
	    <div id="user">
	    	<input type='text' name='email' maxlength="100" placeholder="Email"/>
			<input type='password' name='password' maxlength="100" placeholder="password"/>
			<input type='submit' name='Submit' value='Login' />
	    </div>
		<div id="hospital">
			<input type='text' name='email' maxlength="100" placeholder="Email"/>
			<input type='password' name='password' maxlength="100" placeholder="password"/>
			<input type='submit' name='Submit' value='Login' />
		</div>
    </form>
</body>
</html>