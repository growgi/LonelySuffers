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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<style>
.search-bar {
    display: flex;
    margin-bottom: 15px;
    margin-left: 270px;
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

.table-bordered>tbody>tr>th{
	text-align: center;
}

.table-bordered>tbody>tr>td{
	text-align: center;
}

</style>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/faqHeader.jsp" />

		<section class="section">
			<div class="container">
				<div class="row">
				<c:if test="${sessionScope.m.memberGrade == 1}">
					<a class="btn btn-default" href="/faqWriterFrm.do" role="button">글쓰기</a>
				</c:if>	
				<form action="/searchFaqTitle.do" method="get" class="search-bar" name="searchTitle">
					<span class="material-symbols-outlined search-icon">search</span>
					<input type="text" placeholder="제목으로 검색" name="searchFaqTitle" onkeyup="enterkey();">
					<input type="submit" style="display:none;">				
				</form>
					<table class="table table-bordered">
						<tr>
							<th style="width:15%">번호</th>
							<th style="width:15%">카테고리</th>
							<th>제목</th>
						</tr>
					</table>
					<table class="table table-bordered">	
						<c:forEach items="${list }" var="fq" varStatus="faqNoCt">
							<tr>
								<td style="width:15%">${faqNoCt.count }</td>
									<c:if test="${fq.categoryNo == 1}">
										<td style="width:15%">예약취소</td>
									</c:if>
									<c:if test="${fq.categoryNo == 2}">
										<td style="width:15%">숙박</td>
									</c:if>
									<c:if test="${fq.categoryNo == 3}">
										<td style="width:15%">강습</td>
									</c:if>
									<c:if test="${fq.categoryNo == 4}">
										<td style="width:15%">카풀</td>
									</c:if>
									<c:if test="${fq.categoryNo == 5}">
										<td style="width:15%">후기</td>
									</c:if>
									<c:if test="${fq.categoryNo == 6}">
										<td style="width:15%">회원서비스</td>
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