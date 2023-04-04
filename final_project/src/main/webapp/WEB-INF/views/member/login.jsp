<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonly Suffers</title>
<link rel="stylesheet" href="/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content">
		<div class="main">
			<div class="content-top">
				<h1>Lonly Suffers</h1>
			</div>
			<div class="content-main">
				<div class="main-top">
					<form action="/login.do">
					<input type="text" name="memberId" id="memberId" required placeholder="아이디" ><br>
					<input type="password" name="memberPw" id="memberPw" required placeholder="비밀번호" ><br> 
					<input type="submit" value ="로그인">
					</form>
				</div>
			</div>
		</div>
		<div class="main-bottom">
				<a href="/findMemberId" id="findMemberId">아이디 찾기</a>
				<a href="/findMemberPw" id="findMemberPw">비밀번호 찾기</a>
				<a href="/joinMemberFrm" id="joinMember">회원가입</a>
			</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>