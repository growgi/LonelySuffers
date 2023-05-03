<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
	/*table*/
	table tr>th{
		text-align: center;
	}
	.list-top>table th:nth-child(1){
		width: 6%;
	}
	table th:nth-child(2){
		width: 13%;
	}
	table th:nth-child(3){
		width: 300px;
	}
	table td:nth-child(3){
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	/*table th:nth-child(4){
		width: 30%;
	}
	table th:nth-child(5){
		width: 20%;
	}
	table th:nth-child(6){
		width: 20%;
	}
	table th:nth-child(7){
		width: 30%;
	}*/
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
	.insertBtn{
	float: right;
    color: black;
    border: none;
    outline: none;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 7px;
    font-size: 16px;
    }
</style>

</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		




		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section">
			<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="table-content">
					<div class="list-wrapper">
						
						<div class="productList-top list-top">
							<div class="count">
								판매 상품 <span>${productCount }</span><span><button class="insertBtn">상품등록</button></span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th>종류</th>
									<th>사진</th>
									<th>상품명</th>
									<th style="">판매자</th>
									<th style="width: 10%">지역</th>
									<th>평점</th>
									<th style="width: 10%">상품 상태</th>
				
								</tr>
								<c:choose>
								<c:when test="${productList eq null }">
								<tr>
									<td colspan="8">
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
								<c:forEach items="${productList }" var="p">
								<c:if test="${p.productStatus == 1 || p.productStatus == 0 }">
                                	<tr>
                                		<td>${p.productType }</td>
                                		<td>
                                		<c:choose>
	                                		<c:when test="${p.productPic eq null}">
	                                			<div class="material-symbols-outlined no-pic">quiz</div>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:choose>
		                                		<c:when test="${p.productType == '강습'}">
			                                		<img src="resources/upload/lesson/${p.productPic }">
		                                		</c:when>
		                                		<c:when test="${p.productType == '숙박'}">
			                                		<img src="resources/upload/house/${p.productPic }">
		                                		</c:when>
		                                		</c:choose>
                                			</c:otherwise>
                                		</c:choose>
                                		</td>
										<td>
											<c:choose>
		                                		<c:when test="${p.productType == '강습'}">
			                                		<a href="/lessonView.do?lessonNo=${p.productNo }">${p.productTitle }</a>
		                                		</c:when>
		                                		<c:when test="${p.productType == '숙박'}">
			                                		<a href="/houseView.do?houseNo=${p.productNo }">${p.productTitle }</a>
		                                		</c:when>
		                                	</c:choose>
										</td>
										<td>${p.productWriter }</td>
										<td>${p.productCity }</td>
										<td>
										<c:choose>
										<c:when test="${p.productScore == 0}">		
												<div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 1 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 2 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 3 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 4 }">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore == 5 }">
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
												<c:when test="${p.productStatus == 1}">
														판매중
												</c:when>
												<c:when test="${p.productStatus == 0}">
														판매중지
												</c:when>
											</c:choose></td>
									</tr>
								</c:if>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</table>
							<div id="pageNavi" style="text-align: center;">
								${pageNavi }
							</div>
						</div>
						<div class="list-bottom">
	
						</div>
					</div>
				</div>

				</div>
			</div>
		</section>
		<script>
			$('.insertBtn').on('click',function(){
				location.href="/productInsert.do";
			})
		
		</script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/loginFrm.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
