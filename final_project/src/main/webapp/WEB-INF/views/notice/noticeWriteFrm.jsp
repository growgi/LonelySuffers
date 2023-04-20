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

<style>
.button-74 {
    background-color: #fbeee0;
    border: 2px solid #422800;
    border-radius: 30px;
    box-shadow: #422800 4px 4px 0 0;
    color: #422800;
    cursor: pointer;
    display: inline-block;
    font-weight: 600;
    font-size: 18px;
    padding: 0 18px;
    line-height: 50px;
    text-align: center;
    text-decoration: none;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
}

.button-74:hover {
    background-color: #fff;
}

.button-74:active {
    box-shadow: #422800 2px 2px 0 0;
    transform: translate(2px, 2px);
}

@media (min-width: 768px) {
    .button-74 {
    min-width: 120px;
    padding: 0 25px;
    }
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">공지사항 작성</h2>
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
						<div class="paper">
							<div class="paper-content">
								<ul>
									<li>제목<input id="noticeTitle" type="text" name="noticeTitle" required></li>
								</ul>
								<ul>
									<li>첨부파일<input id="noticeFile" type="file" name="noticeFile" multiple onchange="loadImgs(this);"></li>
								</ul>
								<ul>
									<li style="margin-top: 25px;">내용</li>
									<li><textarea name="noticeContent" required></textarea></li>
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
	</script>
	
	
</body>
</html>


