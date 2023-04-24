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
						<h2 style="border-bottom: 5px solid #006bd6">공지사항 수정</h2>
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
						<div class="paper">
							<div class="paper-content">
								<ul>
									<li class="paper2">번호<input id="noticeNo" type="text" name="noticeNo" value="${n.noticeNo }" readonly></li>
								</ul>
								<ul>
									<li class="paper2">제목<input id="noticeTitle2" type="text" name="noticeTitle" value="${n.noticeTitle }" required></li>
								</ul>
								<ul>
									<li class="paper2">작성일<input id="noticeDate" type="text" name="noticeDate" value="${n.noticeDate }" readonly></li>
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
									<li style="border: none;">첨부파일 추가</li>
									<li style="border: none;"><input type="file" name="noticeFile" multiple onchange="loadImgs(this);"></li>
								</ul>
								<ul>
									<li id="img-viewer2"></li>
								</ul>
								<ul>
									<li class="paper2">내용</li>
									<li><textarea name="noticeContent" required>${n.noticeContent }</textarea></li>
								</ul>
							</div>
						</div>
						<div style="text-align: center; margin-top: 15px;">
							<input class="button-74" type="submit" value="수정하기">
							<input class="button-74" type="submit" value="취소">							
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
   </script>
</body>
</html>