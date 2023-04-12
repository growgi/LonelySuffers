<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>이 페이지의 제목을 적어주세요 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>공지사항 작성</h2>
						<hr>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
		
		<section class="section">
			<div class="container">
				<div class="row">
					<form action="/faqWrite.do" method="post">
						<table>
							<tr>
								<th>제목</th>
								<td><input type="text" name="faqTitle"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>
									<select name="categoryNo" id="categoryNo" class="input-form">
										<option value="1">예약취소</option>
										<option value="2">숙박</option>
										<option value="3">강습</option>
										<option value="4">카풀</option>
										<option value="5">후기</option>
										<option value="6">회원서비스</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="faqContent"></textarea></td>
							</tr>
						</table>
						<input type="submit" value="작성하기">
					</form>	
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>