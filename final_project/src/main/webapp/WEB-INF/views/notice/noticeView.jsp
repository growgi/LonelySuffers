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
<link rel="stylesheet" href="/resources/css/notice.css">

</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		

		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>공지사항</h2>
						<hr>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		<section class="section normalhead">
			<div class="container">
				<div class="row">
					<p>${n.noticeTitle }</p>
					<table>
						<tr>
							<td>${n.noticeDate }</td>
							<td>${n.noticeContent }</td>
						</tr>
						<tr>
				        	<td colspan="5">
				            <c:forEach items="${n.fileList }" var="f">
				            	<img src="/resources/upload/notice/${f.filepath }">
				            </c:forEach>
				        	</td>
				        </tr>
					</table>
					<table>
						<tr>
							<th colspan="6">
								<c:if test="${sessionScope.m.memberGrade == 1}">
									<a href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }">수정하기</a>
									<a href="/deleteNotice.do?noticeNo=${n.noticeNo }">삭제</a>
								</c:if>
							</th>
						</tr>
					</table>
					<a href="/noticeList.do?reqPage=1">목록보기</a>	
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- 기본 .js 파일들 -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
