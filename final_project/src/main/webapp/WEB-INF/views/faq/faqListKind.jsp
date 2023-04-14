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
		<jsp:include page="/WEB-INF/views/common/faqHeader.jsp" />

		<section class="section">
			<div class="container">
				<div class="row">
					<table>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
						</tr>
					</table>
					<table>	
						<c:forEach items="${list }" var="fq">
							<tr>
								<td>${fq.faqNo }</td>
									<c:if test="${fq.categoryNo == 1}">
										<td>예약취소</td>
									</c:if>
									<c:if test="${fq.categoryNo == 2}">
										<td>숙박</td>
									</c:if>
									<c:if test="${fq.categoryNo == 3}">
										<td>강습</td>
									</c:if>
									<c:if test="${fq.categoryNo == 4}">
										<td>카풀</td>
									</c:if>
									<c:if test="${fq.categoryNo == 5}">
										<td>후기</td>
									</c:if>
									<c:if test="${fq.categoryNo == 6}">
										<td>회원서비스</td>
									</c:if>
								<td>
									<a href="/faqView.do?faqNo=${fq.faqNo }">${fq.faqTitle }</a>
								</td>
							</tr>
						</c:forEach>
					</table>

				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

	</div>
	<!-- end wrapper -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>