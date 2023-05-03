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
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>나의 강습상품 목록 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
	/*table*/
	table th:nth-child(0){
		width: 6%;
	}
	table th:nth-child(1){
		width: 13%;
	}
	table th:nth-child(2){
		width: 300px;
		text-align: center;
	}
	table td:nth-child(2){
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	/*별점*/
	.rating-color{
	    color:#fbc634 !important;
	}
	.small-ratings i{
	  color:#cecece;   
	}
	th:last-child, td-last-child{
		width: 50px;
	}
	.pagination {
		text-align: center;
	}
	.product-check {
		border: none;
		width: 2.4rem;
		height: 2.4rem;
	}
	.product-check:focus {
		outline: none;
	}
</style>
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>내가 등록한 상품</h2>
						<p class="lead"></p>
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
			<div class="product-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListBySeller.do?reqPage=1">전체</a>
						<a href="/lessonListBySeller.do?reqPage=1" style="background-color:#19A7CE; color:#fff">강습</a>
						<a href="/houseListBySeller.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
						<form action="/searchLessonBySeller.do" method="get"
						class="search-bar" name="search-product">
						<select name="lessonSearchType" class="search-type">
							<option value="na">강습명</option>
							<option value="le">강습레벨</option>
							<option value="lo">지역</option>
						</select>
						<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
						<input type="text" placeholder="검색어를 입력하세요" name="lessonSearchKeyword" onkeyup="enterkey();"> <input type="submit"style="display: none;">
						<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div class="productList-top list-top">
							<div class="count">
								강습 상품 <span>${lessonCount }</span>
							</div>
							<table>
								<tr>
									<th style="text-align: center;">사진</th>
									<th style="text-align: center;">상품명</th>
									<th style="text-align: center;">강습 레벨</th>
									<th style="text-align: center;">모집정원</th>
									<th style="text-align: center;">지역</th>
									<th style="text-align: center;">평점</th>
									<th style="text-align: center;">상품 상태</th>
									<th style="text-align: center;"></th>
								</tr>
								<c:choose>
								<c:when test="${empty lessonList }">
								<tr>
									<td colspan="7">
									    <div class="noInfo-wrapper">
									        <div>
									            <span class="material-symbols-outlined noInfo-icon">info</span>
									            <div class="noInfo-text">조회된 정보가 없습니다.</div>
									        </div>
									    </div>
								    </td>
								</tr>
								</c:when>
								<c:otherwise>
								<c:forEach items="${lessonList }" var="l">
                                	<tr>
                                		<td>
                                		<c:choose>
	                                		<c:when test="${l.lessonInfoPic eq null}">
	                                			<div class="material-symbols-outlined no-pic">quiz</div>
	                                		</c:when>
	                                		<c:otherwise>
			                                	<img src="resources/upload/lesson/${l.lessonInfoPic }">
			                                </c:otherwise>
                                		</c:choose>
                                		</td>
										<td><a href="/lessonView.do?lessonNo=${l.lessonNo }">${l.lessonTitle }</a></td>
										<td>${l.lessonLevel }</td>
										<td><span>${l.lessonMaxNo }</span>명</td>
										<td>${l.lessonCity }</td>
										<td>
										<c:choose>
										<c:when test="${l.lessonScore < 1}">		
												<div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 1 && l.lessonScore < 2}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 2 && l.lessonScore < 3}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 3 && l.lessonScore < 4}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore >= 4 && l.lessonScore < 5}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${l.lessonScore == 5 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									            </div>
										</c:when>
										</c:choose>
										</td>
										<td><c:choose>
												<c:when test="${l.lessonStatus == 1}">판매중</c:when>
												<c:when test="${l.lessonStatus == 0}">판매중지</c:when>
												<c:when test="${l.lessonStatus == -1}">승인대기</c:when>
												<c:when test="${l.lessonStatus == -2}">승인반려</c:when>
											</c:choose></td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none" onblur="">
												<div>
													<div onclick="location.href='/lessonUpdate.do?lessonNo=${l.lessonNo }'" class="update-detail">상품 정보 수정</div>
			                                		<c:choose>
				                                		<c:when test="${l.lessonStatus == 1}">
															<div onclick="toSoldOut(this)">상품 판매 중지</div>
														</c:when>
				                                		<c:when test="${l.lessonStatus == 0}">
															<div onclick="toResale(this)">판매 재개</div>
														</c:when>
													</c:choose>
													<input type="hidden" value="${l.lessonNo }">
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</table>
							<div id="pageNavi">
								${pageNavi }
							</div>
						</div>
					</div>
				</div>
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
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
	
	<script>
		/*검색 결과에 count 출력 삭제*/
		$(function(){
		    if($('.hidden-input').val()==1) {
		        $(".count").hide();
		    } else {
		        $(".count").show();
		    }
		});



	// 판매 중지를 누르면 동작하는 ajax
		function toSoldOut(obj){
			$.ajax({
				url : "/toSoldOut.do",
				data: {productNo : $(obj).next().val(), productType : "강습"},
				dataType : "text",
				success : function(result){
					if(result == "성공"){
						location.reload()
						alert("해당 상품을 판매중지 처리했습니다.");
					}else{
						alert("알 수 없는 이유로 상태변경에 실패했습니다.");
					}
				}
			});
		}



	// 판매 재개를 누르면 동작하는 ajax
		function toResale(obj){
			$.ajax({
				url : "/toResale.do",
				data: {productNo : $(obj).next().val(), productType : "강습"},
				dataType : "text",
				success : function(result){
					if(result == "성공"){
						location.reload()
						alert("해당 상품을 판매중으로 변경했습니다.");
					}else{
						alert("알 수 없는 이유로 상태변경에 실패했습니다.");
					}
				}
			});
		}
	</script>

</body>
</html>