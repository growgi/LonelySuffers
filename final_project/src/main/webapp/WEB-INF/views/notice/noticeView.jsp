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
<title>Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="/resources/css/notice.css">
<style>


</style>

</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		

		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">Lonely Surfers 공지사항</h2>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		<section class="section normalhead" style="padding-top: 0;">
			<div class="container">
				<div class="row" style="margin-top: 20px;">
					<div style="text-align: left; margin-left: 185px; margin-bottom: 15px;">
						<a class="button-74" href="/noticeList.do?reqPage=1">목록보기</a>
					</div>
					<div class="notepad">
						<div class="topNotepad"></div>
						<div class="paper">
							<ul>
								<li class="paper2">제목</li>
								<li style="font-size: 17px;">${n.noticeTitle }</li>
							</ul>
							<ul>
								<li class="paper2">작성일</li>
								<li style="font-size: 17px;">${n.noticeDate }</li>
							</ul>
							<ul>
								<c:forEach items="${n.fileList }" var="f">
					            	<img src="/resources/upload/notice/${f.filepath }" width="150" height="150">
					            </c:forEach>
							</ul>
							<ul>
								<li class="paper2">내용</li>
								<li style="font-size: 17px;">${n.getNoticeContentBr() }</li>
							</ul>
						</div>
					</div>
					<div style="text-align: center; margin-top: 15px;">
						<c:if test="${sessionScope.m.memberGrade == 1}">
							<a class="button-74" href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }">수정하기</a>
							<a class="button-74" href="/deleteNotice.do?noticeNo=${n.noticeNo }">삭제</a>
						</c:if>
					</div>	
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
