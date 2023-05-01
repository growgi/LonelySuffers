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
<title>Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="/resources/css/faq.css">
</head>



<body>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">

	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">Lonely Surfers 자주묻는질문 수정</h2>
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
				<div class="faqViewWrap">
					<p style="font-size: 30px;"><input style="text-align: center; border: none;" type="text" name="faqTitle" value="${faq.faqTitle }"></p>
					<ul class="faqViewheader">
						<li style="font-size: 20px;">번호 <span>|</span> <input type="text" id="faqNo" name="faqNo" value="${faq.faqNo }" readonly style="width: 45px; border: none;"></li>
						<li style="font-size: 20px;">카테고리 <span>|</span>
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
						</li>
					</ul>
				</div>
					<div class="faqContentWrap">
						<table class="faqViewContent">
							<tr>
								<td><textarea id="faqWriteContent" name="faqContent" >${faq.faqContent }</textarea></td>
							</tr>
						</table>
					</div>
					<table class="faqViewContent">
						<tr>
							<th class="faqViewBtn">
								<input class="button-74" type="submit" value="수정">
								<input class="button-74 cancelBtn" type="button" value="취소">
							</th>
						</tr>	
					</table>
					</form>
				</div>
			</div>
		</section>		
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	
<script>
$(document).ready(function() {
	$('#faqWriteContent').summernote({
		  width: 1070,				   // 에디터 넓이
		  height: 420,                 // 에디터 높이
		  minHeight: 420,             // 최소 높이
		  maxHeight: 420,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['help']]
				  ],
	});
});

$('.cancelBtn').on('click', function(){
	 const faqNo = $('#faqNo').val();
	 location.href = "/faqView.do?faqNo="+faqNo;
	})
</script>	

</body>
</html>