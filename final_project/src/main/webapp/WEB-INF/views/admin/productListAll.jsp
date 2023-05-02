<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
	/*table*/
	.list-top>table th:nth-child(2){
		width: 6%;
	}
	table th:nth-child(3){
		width: 13%;
	}
	table th:nth-child(4){
		width: 300px;
	}
	table td:nth-child(4){
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
</style>
<body>
	<!-- Modal -->
	<div id="changeStatusProduct-modal" class="modal-bg" style="z-index:1; display:none;">
		<div class="modal-wrap">
			<div class="modal-head">
			<h2>선택 상품 상태 변경</h2>
			<span class="material-icons close-icon modal-close">close</span>
			</div>
			<div class="modal-content">
				<div class="waveEffect" style="border:none;">
					<p class="waveEffectWord-back page-name">Lonely Surfers</p>
				</div>
				<p>선택한 상품(들)의 상태를 변경하시겠습니까?</p>
			</div>
			<div class="modal-foot">
			<button class="checkedUpdateProductStatus-btn2 btn-m bc4 btn-pill">확인</button>
			<button class="btn-m bc5 modal-close btn-pill">취소</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="currProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/productListAll.do?reqPage=1" style="background-color:#19A7CE; color:#fff">전체</a>
						<a href="/productListLesson.do?reqPage=1">강습</a>
						<a href="/productListHouse.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
						<form action="/adminSearchProduct.do" method="get"
						class="search-bar" name="search-product">
						<input type="hidden" name="jspPage" value="pl">
						<select name="productSearchType" class="search-type">
							<option value="n">상품명</option>
							<option value="s">판매자</option>
							<option value="lo">지역</option>
						</select>
						<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
						<input
							type="text" placeholder="검색어를 입력하세요" name="productSearchKeyword"
							onkeyup="enterkey();"> <input type="submit"
							style="display: none;">
							<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div class="productList-top list-top">
							<div class="count">
								전체 상품 <span>${productCount }</span>
							</div>
							<input type="hidden" value="1" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="productCheck"
										class="lesson-all-check chk"></th>
									<th>종류</th>
									<th>사진</th>
									<th>상품명</th>
									<th>판매자</th>
									<th>지역</th>
									<th>평점</th>
									<th>상품 상태</th>
									<th></th>
								</tr>
								<c:choose>
								<c:when test="${empty productList }">
								<tr>
									<td colspan="9">
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
								<c:if test="${p.productStatus >= 0 }">
                                	<tr>
										<td><input type="checkbox" name="memberCheck"
											class="lesson-check product-check chk" value="${p.productNo }"></td>
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
										<c:when test="${p.productScore < 1}">		
												<div class="small-ratings">
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 1 && p.productScore < 2}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 2 && p.productScore < 3}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 3 && p.productScore < 4}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 4 && p.productScore < 5}">
									            <div class="small-ratings">
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star rating-color"></i>
									                <i class="fa fa-star"></i>
									            </div>
										</c:when>
										<c:when test="${p.productScore >= 5 }">
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
													<select class="status-change">
														<option value="1" selected>판매중</option>
														<option value="0">판매중지</option>
													</select>
												</c:when>
												<c:when test="${p.productStatus == 0}">
													<select class="status-change">
														<option value="1">판매중</option>
														<option value="0" selected>판매중지</option>
													</select>
												</c:when>
											</c:choose></td>
										<td><span class="material-symbols-outlined more-detail">more_vert</span>
											<div class="list-detail-box" style="display: none" onblur="">
												<div>
			                                		<c:choose>
			                                		<c:when test="${p.productType == '강습'}">
														<a href="/lessonUpdate.do?lessonNo=${p.productNo }" class="update-detail">상품 정보 수정</a>
													</c:when>
			                                		<c:when test="${p.productType == '숙박'}">
														<a href="/houseUpdate.do?houseNo=${p.productNo }" class="update-detail">상품 정보 수정</a>
			                                		</c:when>
													</c:choose>
													<div class="product-stop-selling-btn">상품 판매 중지</div>
													<div class="product-stop-selling" style="display:none;">상품 판매 중지</div>
													<input type="hidden" value="${p.productNo }">
												</div>
											</div></td>
									</tr>
								</c:if>
								</c:forEach>
								</c:otherwise>
								</c:choose>
							</table>
							<div id="pageNavi">
								${pageNavi }
							</div>
						</div>
						<div class="list-bottom">
							<div>
								<!-- <button class="checkedUpdateProductStatus-btn btn-m bc1" target="#changeStatusProduct-modal">선택 상품 상태 변경</button> -->
								<input type="submit" value="선택 상품 상태 변경" class="checkedUpdateProductStatus-btn btn-m bc1" target="#changeStatusProduct-modal">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminProductList.js"></script>
</body>
<script>
	/*검색 결과에 count 출력 삭제*/
	$(function(){
	    if($('.hidden-input').val()==1) {
	        $(".count").hide();
	    } else {
	        $(".count").show();
	    }
	});
</script>
</html>