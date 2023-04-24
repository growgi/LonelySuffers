<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<style>
.search-bar {
    display: flex;
    margin-bottom: 15px;
    margin-left: 300px;
}
.search-bar>.search-icon{
    /*width: 45px;
    height: 45px;*/
    width: 80px;
    background-color: rgb(238, 238, 238);
    color: rgb(156, 156, 156);
    line-height: 45px;
    text-align: center;
    border: 1px solid #dddd;
    /*border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    border: 1px solid #dddd;
    border-right: none;*/
}
.search-bar>input{
    outline: none;
    border: 1px solid #dddd;
    padding-left: 8px;
    padding-right: 8px;
    width: 45vh;
    /*border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;*/
    cursor: auto;
    font-size: 16px;
}

.active-search-bar{
    box-shadow: inset 0 0 2px rgb(235, 235, 235);
}




</style>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2 style="border-bottom: 5px solid #006bd6">공지사항</h2>
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
					<c:if test="${sessionScope.m.memberGrade == 1}">
					<a class="button-74" href="/noticeWriteFrm.do" role="button">글쓰기</a>
					</c:if>
					<form action="/searchNoticeTitle.do" method="get" class="search-bar" name="searchTitle">
						<span class="material-symbols-outlined search-icon">search</span>
						<input type="text" placeholder="제목으로 검색" name="searchNtTitle" onkeyup="enterkey();">
						<input type="submit" style="display:none;">				
					</form>
					<br>
					<table class="table table-striped">
						<tr>
							<th class="nt" style="width:15%">번호</th>
							<th class="nt" style="width:60%">제목</th>
							<th class="nt" style="width:25%">작성일</th>
						</tr>
						<c:forEach items="${list }" var="n">
							<tr>
								<td class="nt" style="width:15%">${n.noticeNo }</td>
								<td>
									<a href="/noticeView.do?noticeNo=${n.noticeNo }">${n.noticeTitle }</a>				
								</td>
								<td class="nt" style="width:25%">${n.noticeDate }</td>
							</tr>
						</c:forEach>
					</table>
					<div>
						<div style="text-align: center;">${pageNavi }</div>
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

<script>
$(".search-bar>input").on("click",function(){
    $(this).toggleClass("active-search-bar");
});

function enterkey() {
    if (window.event.keyCode == 13) {
         // 엔터키가 눌렸을 때 실행할 내용
        $("#frm").submit();
        $(".count").text("");
    }
}

$(".search-icon").on("click",function(){
    $(".search-bar").submit();
});
</script>
</body>
</html>