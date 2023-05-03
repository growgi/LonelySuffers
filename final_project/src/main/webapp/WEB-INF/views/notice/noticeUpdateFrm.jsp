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
						<h2 style="border-bottom: 5px solid #006bd6">Lonely Surfers 공지사항 수정</h2>
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
					<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data" id="updateFrm">
						<div class="notepad">
							<div class="topNotepad"></div>
							<div class="paper">
								<ul>
									<li class="paper2">번호<input style="font-size: 20px;" id="noticeNo" type="text" name="noticeNo" value="${n.noticeNo }" readonly></li>
								</ul>
								<ul>
									<li class="paper2">제목<input style="font-size: 20px;" id="noticeTitle2" type="text" name="noticeTitle" value="${n.noticeTitle }" required></li>
								</ul>
								<ul>
									<li class="paper2">작성일<input style="font-size: 20px;" id="noticeDate" type="text" name="noticeDate" value="${n.noticeDate }" readonly></li>
								</ul>
								<ul>
									<li class="paper2">첨부파일</li>
								</ul>	
								<div class="noticeFileList">
								<ul>
									<c:forEach items="${n.fileList }" var="f">
					                    <p>
					                       ${f.filename }
					                       <button type="button" onclick="deleteFile(this,${f.fileNo},'${f.filepath }');">삭제</button>                                                          
					                    </p>
					                </c:forEach>
								</ul>
								</div>
								<ul>
									<li style="border: none; font-weight: bold;">첨부파일 추가</li>
									<li style="border: none;"><input type="file" name="noticeFile" accept=".jpg,.jpeg,.gif,.png,.webp" multiple onchange="loadImgs(this);"></li>
								</ul>
								<ul>
									<li id="img-viewer2"></li>
								</ul>
								<ul>
									<li class="paper2">내용</li>
									<li><textarea style="overflow: auto;" id="summernote" name="noticeContent" required>${n.noticeContent }</textarea></li>
								</ul>
							</div>
						</div>
						<div style="text-align: center; margin-top: 15px;">
							<input class="button-74" type="submit" value="수정">
							<input class="button-74 cancelBtn" type="button" value="취소">							
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
function deleteFile(obj,fileNo,filepath){
   //<input>
   const fileNoInput = $("<input>");
   //<input name="fileNo">
   fileNoInput.attr("name","fileNo");
   //<input name="fileNo" value="fileNo">
   fileNoInput.val(fileNo);
   //<input name="fileNo" value="10" style="display:none;">
   fileNoInput.hide();
   
   const filepathInput = $("<input>");
   filepathInput.attr("name","filepath");
   filepathInput.val(filepath);
   filepathInput.hide();
   
   $("#updateFrm").append(fileNoInput).append(filepathInput);
   $(obj).parent().remove();
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
   
$('.cancelBtn').on('click', function(){
 const noticeNo = $('#noticeNo').val();
 location.href = "/noticeView.do?noticeNo="+noticeNo;
})
</script>
</body>
</html>