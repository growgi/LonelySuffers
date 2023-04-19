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
<link rel="stylesheet" href="/resources/css/faq.css">
</head>




<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>자주묻는질문</h2>
						<hr>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
		<section class="section" style="padding-top: 0;">
			<div class="container" >
				<div class="row" style="margin-top: 20px;">
					<div class="faqViewWrap">
						<p style="margin-bottom: 5px;">제목</p>
						<p style="font-size: 30px;">${faq.faqTitle }</p>
						<ul class="faqViewheader">
							<li style="font-size: 20px;">번호</li>
							<span>|</span>
							<li>${faq.faqNo }</li>
							<li style="font-size: 20px;">카테고리</li>
							<span>|</span>
							<li>
								<c:choose>
									<c:when test="${faq.categoryNo == 1}">
										<td>예약취소</td>
									</c:when>
									<c:when test="${faq.categoryNo == 2}">
										<td>숙박</td>
									</c:when>
									<c:when test="${faq.categoryNo == 3}">
										<td>강습</td>
									</c:when>
									<c:when test="${faq.categoryNo == 4}">
										<td>카풀</td>
									</c:when>
									<c:when test="${faq.categoryNo == 5}">
										<td>후기</td>
									</c:when>
									<c:when test="${faq.categoryNo == 6}">
										<td>회원서비스</td>
									</c:when>
								</c:choose>
							</li>
						</ul>
					</div>
					<div class="faqContentWrap">
						<table class="faqViewContent">
							<tr>
								<td>${faq.getFaqContentBr() }</td>
							</tr>
						</table>
					</div>
						<table class="faqViewContent">
							<tr>
								<th class="faqViewBtn">
									<c:if test="${sessionScope.m.memberGrade == 1}">
										<a class="btn btn-primary btn-sm active" href="/faqUpdateFrm.do?faqNo=${faq.faqNo }">수정하기</a>
										<a class="btn btn-primary btn-sm active" href="/deleteFaq.do?faqNo=${faq.faqNo }">삭제</a>
									</c:if>
								</th>
							</tr>
						</table>
				</div>
			<a href="/" style="margin: 0 auto;">메인으로</a>
			</div>
		</section>		

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