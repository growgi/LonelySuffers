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
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>이 페이지의 제목을 적어주세요 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
</head>
<style>
.tab>ul{
   	list-style-type: none;
   	overflow: hidden;
	}
.tab>ul>li{
	width: calc(100%/6);
   	float: left;
   	height: 50px;
   	line-height: 30px;
   	border: 1px solid #ccc;
   	box-sizing: border-box;
   	text-align: center;
   	cursor: pointer;
}




</style>
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
		<section class="section">
			<div class="container">
				<div class="row">
					<a href="/faqWriterFrm.do">글쓰기</a>
					<div class="tab">
						<ul>
							<li>예약취소</li>
							<li>숙박</li>
							<li>강습</li>
							<li>카풀</li>
							<li>후기</li>
							<li>회원서비스</li>
						</ul>
					</div>	
					<table>
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>제목</th>
							</tr>
						<c:forEach items="${list }" var="fq">
							<tr>
								<td>${fq.faqNo }</td>
									<c:choose>
										<c:when test="${fq.categoryNo == 1}">
											<td>예약취소</td>
										</c:when>
										<c:when test="${fq.categoryNo == 2}">
											<td>숙박</td>
										</c:when>
										<c:when test="${fq.categoryNo == 3}">
											<td>강습</td>
										</c:when>
										<c:when test="${fq.categoryNo == 4}">
											<td>카풀</td>
										</c:when>
										<c:when test="${fq.categoryNo == 5}">
											<td>후기</td>
										</c:when>
										<c:when test="${fq.categoryNo == 6}">
											<td>회원서비스</td>
										</c:when>
									</c:choose>
								<td>
									<a href="/faqView.do?faqNo=${fq.faqNo }">${fq.faqTitle }</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script>
		
	</script>
</body>
</html>