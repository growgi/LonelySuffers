<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>wishList - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
</head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<style>
.wishList-list>div{
	display: none;
}
    a{
        cursor: pointer;
    }
    .wishList-wrapper>.wishList-title{
        display: flex;
        margin-bottom: 50px;
    }
    .wishList-wrapper>.wishList-title>a, .wishList-title>div{
        font-weight: 900;
        font-size: 36px;
    }
    .wishList-title>a{
        font-weight: 900;
    }

    .wishList-category{
        display: flex;
        font-size: 18px;
        font-weight: 900;
        border-bottom: 2px solid rgb(223, 223, 223);

    }
    .wishList-category>div{
        margin-right: 35px;
        padding-bottom: 5px;
        cursor: pointer;
    }

    .wishList-content{
        position: relative;
    }
    .wishList-content>.line{
        width: 65px;
        border: 2px solid #86C8BC;
        position: absolute;
        top: 30px;
    }
    /*관심작품*/
    .wishList-list{
        margin-top: 20px;
        margin-bottom: 20px;
        padding: 25px;
        padding-top: 0;
        box-sizing: border-box;
        border: 1px solid rgb(226, 226, 226);
        border-radius: 5px;
    }

    /*관심상품 개별*/
    .wishList-box{
        border-bottom: 2px solid rgb(226, 226, 226);
        width: 100%;
        padding: 30px 5px 0px 5px;
        margin: 0 10px 0 10px;
        box-sizing: border-box;
        position: relative;
        display:inline-block;
    }
    .wishList-box-top{
        border-bottom: 1px solid lightgray;
        padding-bottom: 8px;
    }
    .wishList-box-top>div:first-of-type{
        display: flex;
        justify-content: space-between;
    }
    .product-title>a{
        font-size: 20px;
        font-weight: 900;
    }
    .wishList-box-top>div>div:last-of-type{
        font-weight: 900;
        cursor: pointer;
    }
    .wishList-box-bottom{
        display: flex;
        padding-top: 13px;
        padding-bottom: 10px;
    }
    .wishList-box-bottom>div>.product-img{
        width: 100px;
        height: 110px;
        margin-right: 10px;
    }
    .wishList-box-bottom>div>.no-pic{
		font-size: 110px;
    }
    .wishList-box-detail{
        width: 75%;
    }
    .wishList-box-detail>div:first-child>a{
        font-size: 18px;
        color: #595959;
        font-weight: 900;
    }
    .wishList-box-detail>div:nth-child(2){
        font-size: 14px;
    }
    .wishList-box-detail>div:nth-child(3){
        font-size: 15px;
        font-weight: 600;
    }
    .wishList-box-detail>div:nth-child(4){
        font-size: 20px;
        font-weight: 900;
    }
    .product-price{
        text-align: right;
    }
    .product-price>span{
        color: #ffa764;
    }
    .black-box{
    	background-color: #cccccc;
    }
    .black-box:hover{
		cursor: not-allowed;
    }
    .close-icon{
        margin-right: 20px;
    }
    .close-icon:hover{
        background-color: rgba(194, 194, 194, 0.3);
    }
    .black-box>div>div>div>.product-title>*{
        color: gray;
    }
    .black-box>div>div>div>.close-icon{
        color: red;
    }
</style>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<section class="section">
			<div class="container">
				<div class="case-top clearfix">
					<div class="wishList-title">
						<div>관심상품</div>
					</div>

					<div class="pull-right">
						<div class="dropdown portfolio-filter">
							<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
								필터링 <span class="fa fa-angle-down"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a class="active" href="#" data-filter=".cat0">전체 (<span id="allWishListCount"></span>)</a></li>
								<li><a class="" href="#" data-filter=".cat1">강습 (<span id="lessonWishListCount"></span>)</a></li>
								<li><a class="" href="#" data-filter=".cat2">숙박 (<span id="houseWishListCount"></span>)</a></li>
							</ul>
						</div>
						<!-- end dropdown -->
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->

				<c:choose>
					<c:when test="${empty allWishList}">
						<div><h3>등록한 관심상품이 없습니다.</h3></div>
					</c:when>
					<c:otherwise>
						<div class="portfolio row withhover">
							<c:forEach items="${allWishList }" var="w">
								<c:choose>
									<c:when test="${w.houseNo ne 0}">
										<div class="pitem item-w1 item-h1 cat0 cat2">
											<c:choose>
												<c:when test="${w.houseStatus > 0}"><div class="case-box"></c:when>
												<c:otherwise><div class="case-box black-box"></c:otherwise>
											</c:choose>
												<div class="wishList-box">
													<div class="wishList-box-top">
														<div>
															<div class="product-title">
															<c:choose>
																<c:when test="${w.houseStatus > 0}"><a href="/houseView.do?houseNo=${w.houseNo}">${w.houseTitle }</a></c:when>
																<c:otherwise>${w.houseTitle }</c:otherwise>
															</c:choose>
															</div>
															<div class="material-symbols-outlined close-icon">close</div>
															<input type="hidden" value="${w.wishNo }">
														</div>
														<div><span class="product-name">숙박</span> | <span class="location">${w.houseCity }</span></div>
													</div>
													<div class="wishList-box-bottom">
														<div>
															<c:choose>
																<c:when test="${w.housePhoto1 != null }">
																	<img src="resources/upload/house/${w.housePhoto1 }" class="product-img">
																</c:when>
																<c:otherwise>
																	<div class="material-symbols-outlined no-pic">quiz</div>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="wishList-box-detail">
															<div><b><span>${w.roomTitle }</span></b></div>
															<div><span>${w.houseAddress }</span></div>
															<div>객실인원 <span>${w.roomCapa }</span>명</div>
															<div class="product-price">
																<span><fmt:formatNumber value="${w.housePrice }" pattern="#,###" /></span>원
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
									<c:when test="${w.lessonNo ne 0}">
										<div class="pitem item-w1 item-h1 cat0 cat1">
											<c:choose>
												<c:when test="${w.lessonStatus > 0}"><div class="case-box"></c:when>
												<c:otherwise><div class="case-box black-box"></c:otherwise>
											</c:choose>
												<div class="wishList-box">
													<div class="wishList-box-top">
														<div>
															<div class="product-title">
															<c:choose>
																<c:when test="${w.lessonStatus > 0}"><a href="lessonView.do?lessonNo=${w.lessonNo}">${w.lessonTitle }</a></c:when>
																<c:otherwise>${w.lessonTitle }</c:otherwise>
															</c:choose>
															</div>
															<div class="material-symbols-outlined close-icon">close</div>
															<input type="hidden" value="${w.wishNo }">
														</div>
														<div><span class="product-name">강습</span> | <span class="location">${w.lessonCity }</span></div>
													</div>
													<div class="wishList-box-bottom">
														<div>
															<c:choose>
																<c:when test="${w.lessonInfoPic != null }">
																	<img src="resources/upload/lesson/${w.lessonInfoPic }" class="product-img">
																</c:when>
																<c:otherwise>
																	<div class="material-symbols-outlined no-pic">quiz</div>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="wishList-box-detail">
															<div><b>${w.lessonTeacher }</b> 강사 
																<span class="label label-primary">
																	<c:choose>
																		<c:when test="${w.lessonLevel == 1}">초급</c:when>
																		<c:when test="${w.lessonLevel == 2}">중급</c:when>
																		<c:when test="${w.lessonLevel == 3}">상급</c:when>
																	</c:choose>
																</span>
															</div>
															<div><span>강습시간 ${w.lessonStartTime }</span> ~ <span>${w.lessonEndTime }</span></div>
															<div>모집정원 <span>${w.lessonMaxNo }</span>명</div>
															<div class="product-price">
																<span><fmt:formatNumber value="${w.lessonPrice }" pattern="#,###" /></span>원
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/masonry.js"></script>
	<script src="resources/js/gallery_04_1.js"></script>
</body>
<script>
	/*관심상품 삭제*/
	$(".close-icon").on("click",function(){
		const wishNo = $(this).next().val();
		
		$.ajax({
			url : "/deleteWishList.do",
			data: {wishNo : wishNo},
			dataType : "text",
			success : function(message){
				if(message=="삭제성공"){
					console.log("관심상품에서 삭제됨");
				}else{
					console.log("존재하지 않는 wishNo를 전달한 경우 = 이미 삭제된거라 어차피 노상관");
				}
			}
		});
		$(this).parent().parent().parent().parent().parent().removeClass("cat0");
		$(this).parent().parent().parent().parent().parent().removeClass("cat1");
		$(this).parent().parent().parent().parent().parent().removeClass("cat2");
		$(".active").click();
		$(this).parent().parent().parent().parent().parent().remove();
		counting();
	});

    $(".black-box").attr("title","판매중이 아닙니다.");
    
    /*관심상품 개수*/
    function counting(){
		const allWishListCount = $(".pitem").length; 
		$("#allWishListCount").text(allWishListCount);
	
		const lessonWishListCount = $(".cat1").length; 
		$("#lessonWishListCount").text(lessonWishListCount);
	
		const houseWishListCount = $(".cat2").length;
		$("#houseWishListCount").text(houseWishListCount);
    }

	$(document).ready(function() {
		counting();
	});
</script>
</html>