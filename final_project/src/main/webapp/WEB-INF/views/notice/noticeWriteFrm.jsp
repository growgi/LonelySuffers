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
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">Lonely Surfers 공지사항 작성</h2>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->
		
		
		
		<section class="section" style="padding-top: 0;">
			<div class="container">
				<div class="row" style="margin-top: 20px;">
					<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
						<div class="notepad">
							<div class="topNotepad"></div>
							<div class="paper">
								<ul>
									<li class="paper2" style="padding-bottom: 10px;">제목<input id="noticeTitle" type="text" name="noticeTitle" required></li>
								</ul>
								<ul>
									<li class="paper2">첨부파일<input id="noticeFile" type="file" name="noticeFile" accept=".jpg,.jpeg,.gif,.png,.webp" multiple onchange="loadImgs(this);"></li>
								</ul>
								<ul>
									<li class="paper2">내용</li>
									<li><textarea id="summernote" name="noticeContent" required></textarea></li>
								</ul>
							</div>
						</div>
						<div style="text-align: center; margin-top: 15px;">
							<input class="button-74" type="submit" value="등록하기" role="button">
						</div>
					</form>
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
	
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	function loadImgs(input) {
        // 기존에 있는 이미지 삭제
        $('#img-viewer2 img').remove();
        
        if (input.files && input.files.length > 0) {
          for (let i = 0; i < input.files.length; i++) {
            const reader = new FileReader();
            reader.readAsDataURL(input.files[i]);
            reader.onload = function(e) {
              $("<img>").attr("src", e.target.result).attr("id", "img-" + i).appendTo("#img-viewer2"); // 이미지를 보여줄 DOM 엘리먼트에 추가
            }
          }
        }
      }
	
	$(document).ready(function() {
		$('#summernote').summernote({
			  width: 750,				   // 에디터 넓이	
			  height: 600,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
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
	
	
	</script>
	
	
</body>
</html>


