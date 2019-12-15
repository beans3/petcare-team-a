<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title {
	text-align: center;
	padding: 50px 0 20px;
}

.title h1 {
	letter-spacing: 2;
	margin: 0;
	padding: 0;
	color: black;
	text-transform: uppercase;
	font-size: 36px;
}

.login_div {
	width: 40vw;
	height: 56vh;
	background: #fff;
	margin: 0 auto;
	border: 2px solid #fff;
	box-shadow: 0 15px 40px rgba(0, 0, 0, .5);
}

.left {
	float: left;
	width: 50%;
	/* height: 56vh; */
	/* background: url("/resources/images/warren-wong-323107-unsplash.jpg"); */
	/* 수정*/
	background-size: cover;
	z-index: 10;
}

.right {
	float: right;
	width: 50%;
	/* height: 56vh; */
	box-sizing: border-box;
}

.formBox {
	width: 100%;
	padding: 0px 40px;
	/* padding: 80px 40px; */
	box-sizing: border-box;
	/* height: 56vh; */
	background: #fff;
}

p {
	margin: 0;
	padding: 0;
	font-weight: bold;
	color: salmon;
}

input {
	margin-bottom: 20px;
	border: none;
	border-bottom: 2px solid salmon;
	outline: none;
	height: 40px;
	width: 100%;
}

input:focus {
	border-bottom: 2px solid #262626;
}

.formBox button {
	width: 100%;
	border: none;
	outline: none;
	height: 40px;
	color: white;
	background: #262626;
	cursor: pointer;
	margin-bottom: 20px;
	font-size: 14px;
}

.formBox button:hover {
	background: salmon;
}

.formBox form {
	margin-bottom: 0;
}

.login_div a {
	color: #262626;
	font-size: 0.7vw;
	font-weight: bold;
	font-style: unset;
}

.help_div {
	display: none;
	width: 20%;
	padding: 80px 40px;
	box-sizing: border-box;
	height: 500px;
	position: absolute;
}

.help_div button {
	width: 100%;
	border: none;
	outline: none;
	height: 40px;
	color: white;
	background: #262626;
	cursor: pointer;
	margin-bottom: 20px;
	font-size: 14px;
}

.help_form {
	padding-top: 20;
}

.help_div button:hover {
	background: salmon;
}

h4 {
	font-family: KBIZHanmaumMyungjo;
	color: grey;
	margin-top: 0;
}

@media ( max-width :450px) {
	.nav-body {
		padding-top: 13%;
	}
	body {
		background: url("/resources/images/m_login_bg.jpg");
		background-size: cover;
	}
	.login_div {
		width: 80%;
		height: 40%;
		margin: 7% auto;
	}
	.left {
		width: 50%;
		height: 100%;
	}
	.formbox {
		padding: 40px 20px;
		height: 40%;
	}
	.login_div a {
		font-size: 11px;
	}
	.help_div {
		width: 40%;
		padding: 40 20px;
		height: 100%;
	}
	input {
		margin-bottom: 5;
	}
	h4 {
		font-size: 12px;
	}
}
</style>
</head>
<body>
<section>
<div class="container">
	<div class="title">
		<h1>Login</h1>
	</div>
	<div class="jumbotron" style="padding-top: 20px;">
		<div class="login_div" style="padding-top: 20px;">
			<div class="left">
				<div class="formBox">
					<form:form id="login_form" modelAttribute="user" method="post" action="/loginPro">
						<p>일반회원</p>
						<p>ID</p>
						<form:input type="text" path="userId" class="id" placeholder="Your ID"/>
						<form:errors path="userId" cssClass="text-danger"/>
						<p>Password</p>
						<form:password path="userPw" class="password" placeholder="●●●●●●"/>
						<form:errors path="userPw" cssClass="text-danger"/>
						<button type="submit" class="login_btn">로그인</button>
					</form:form>
					<a href="#" class="help_btn">ID 또는 비밀번호를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
</body>
</html>