<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section">
			<div class="container">
				<div class="row">
					<h1 style="text-align: center;">공지사항 작성</h1>
					<hr>
					<form action="/noticeWrite.do" method="post"
						enctype="multpart/form-data" class="notice-form">
						<div>
							<th>제목</th>
							<td><input type="text" name="noticeTitle"></td>
						</div>
						<div>
							<th>첨부파일</th>
							<td><input type="file" name="noticeFile" multiple></td>
						</div>
						<div>
							<th>내용</th>
							<td><textarea name="noticeContent"></textarea></td>
						</div>
						<tr>
							<th colspan="2"><input type="submit" value="등록하기"></th>
						</tr>
					</form>
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
