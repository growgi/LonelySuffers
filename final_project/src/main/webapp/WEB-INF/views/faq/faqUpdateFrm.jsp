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
<title>Lonely Suffers</title>
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
						<h2>자주묻는질문 작성</h2>
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
				<form action="/faqUpdate.do" method="post">
				<table>
					<tr>
						<th>번호</th>
						<td><input type="text" name="faqNo" value="${faq.faqNo }" readonly></td>
						<th>제목</th>
						<td><input type="text" name="faqTitle" value="${faq.faqTitle }"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
						<c:choose>
							<c:when test="${faq.categoryNo == 1 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1" selected>예약취소</option>
									<option value="2">숙박</option>
									<option value="3">강습</option>
									<option value="4">카풀</option>
									<option value="5">후기</option>
									<option value="6">회원서비스</option>
								</select>
							</c:when>
							<c:when test="${faq.categoryNo == 2 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1">예약취소</option>
									<option value="2" selected>숙박</option>
									<option value="3">강습</option>
									<option value="4">카풀</option>
									<option value="5">후기</option>
									<option value="6">회원서비스</option>
								</select>
							</c:when>
							<c:when test="${faq.categoryNo == 3 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1">예약취소</option>
									<option value="2">숙박</option>
									<option value="3" selected>강습</option>
									<option value="4">카풀</option>
									<option value="5">후기</option>
									<option value="6">회원서비스</option>
								</select>
							</c:when>
							<c:when test="${faq.categoryNo == 4 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1">예약취소</option>
									<option value="2">숙박</option>
									<option value="3">강습</option>
									<option value="4" selected>카풀</option>
									<option value="5">후기</option>
									<option value="6">회원서비스</option>
								</select>
							</c:when>
							<c:when test="${faq.categoryNo == 5 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1">예약취소</option>
									<option value="2">숙박</option>
									<option value="3">강습</option>
									<option value="4">카풀</option>
									<option value="5" selected>후기</option>
									<option value="6">회원서비스</option>
								</select>
							</c:when>
							<c:when test="${faq.categoryNo == 6 }">
								<select name="categoryNo" id="categoryNo" class="input-form">
									<option value="1">예약취소</option>
									<option value="2">숙박</option>
									<option value="3">강습</option>
									<option value="4">카풀</option>
									<option value="5">후기</option>
									<option value="6" selected>회원서비스</option>
								</select>
							</c:when>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="faqContent" >${faq.faqContent }</textarea></td>
					</tr>	
				</table>
				<table>
					<tr>
						<th colspan="2"><input type="submit" value="수정하기"></th>
						<th colspan="2"><input type="submit" value="취소"></th>
					</tr>
				</table>	
				</form>
				
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->







		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>