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
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
<style>
.list-top>table th:nth-child(2){
	width: 6%;
}
.list-top>table th:nth-child(3){
	width: 13%;
}
.list-top>table th:nth-child(4){
	width: 300px;

}
.list-top>table td:nth-child(4){
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
<body>
	<!-- Modal -->
	<div id="approve-modal" class="modal-bg" style="z-index:1; display:none;">
		<div class="modal-wrap">
			<div class="modal-head">
			<h2>상품 승인</h2>
			<span class="material-icons close-icon modal-close">close</span>
			</div>
			<div class="modal-content">
				<div class="product-info"></div>
				<p>해당 상품을 승인하시겠습니까?</p>
			</div>
			<div class="modal-foot">
			<button class="approveProduct btn-m bc4 btn-pill">확인</button>
			<button class="btn-m bc5 modal-close btn-pill">취소</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
    <div id="return-modal" class="modal-bg" style="z-index:1; display:none;">
      <div class="modal-wrap">
        <div class="modal-head">
          <h2>상품 반려</h2>
          <span class="material-icons close-icon modal-close">close</span>
        </div>
        <div class="modal-content">
			<div class="product-info"></div>
			<p>해당 상품을 반려하는 이유를 작성해주세요.</p>
			<input type="text" class="return-reason">
        </div>
        <div class="modal-foot">
          <button class="returnProduct btn-m bc4 btn-pill">확인</button>
          <button class="btn-m bc5 modal-close btn-pill">취소</button>
        </div>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="newProduct-wrapper product-wrapper admin-content container">
		<div>
			<div class="newProduct-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/newProductAll.do?reqPage=1" style="background-color:#19A7CE; color:#fff">전체</a>
						<a href="/newProductLesson.do?reqPage=1">강습</a>
						<a href="/newProductHouse.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
						<form action="/adminSearchProduct.do" method="get"
							id="frm" class="search-bar" name="search-product">
							<input type="hidden" name="jspPage" value="nl">
							<input type="hidden" name="reqPage" value="1">
							<select name="productSearchType" class="search-type">
								<option value="n">상품명</option>
								<option value="s">판매자</option>
								<option value="lo">지역</option>
							</select>
							<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
							<input
								type="text" placeholder="검색어를 입력하세요" name="productSearchKeyword"
								onkeyup="enterkey();"> 
								<div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
						</form>
						<div id="newProductResult"></div>
						<div class="newProduct-top list-top">
							<div class="count">
								전체 상품 <span>${newProductCount }</span>
							</div>
							<table>
								<tr>
									<th><input type="checkbox" name="houseCheck"
										class="house-all-check chk"></th>
									<th>종류</th>
									<th>사진</th>
									<th>상품명</th>
									<th>판매자</th>
									<th>지역</th>
									<th>상품정보</th>
									<th></th>
								</tr>
								<c:choose>
								<c:when test="${empty productList }">
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
								<c:forEach items="${productList }" var="n">
								<c:if test="${n.productStatus == -1 }">
									<tr>
										<td><input type="checkbox" name="houseCheck"
											class="house-check chk check" value="${n.productNo }"></td>
										<td>${n.productType }</td>
										<td>
                                		<c:choose>
	                                		<c:when test="${n.productPic eq null}">
	                                			<div class="material-symbols-outlined no-pic">quiz</div>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:choose>
		                                		<c:when test="${n.productType == '강습'}">
			                                		<div><img src="resources/upload/lesson/${n.productPic }"></div>
		                                		</c:when>
		                                		<c:when test="${n.productType == '숙박'}">
			                                		<div><img src="resources/upload/house/${n.productPic }"></div>
		                                		</c:when>
		                                		</c:choose>
                                			</c:otherwise>
                                		</c:choose>
                                		</td>
										<td>
										<c:choose>
	                                		<c:when test="${n.productType == '강습'}">
	                                			<a href="/lessonView.do?lessonNo=${n.productNo }">${n.productTitle }</a>
	                                		</c:when>
	                                		<c:when test="${n.productType == '숙박'}">
	                                			<a href="/houseView.do?houseNo=${n.productNo }">${n.productTitle }</a>
	                                		</c:when>
	                                	</c:choose>
										</td>
										<td>${n.productWriter }</td>
										<td>${n.productCity }</td>
										<td>
										<c:choose>
	                                		<c:when test="${n.productType == '강습'}">
	                                			<a href="/lessonView.do?lessonNo=${n.productNo }" class="btn-r bc5">상품정보 확인</a>
	                                		</c:when>
	                                		<c:when test="${n.productType == '숙박'}">
	                                			<a href="/houseView.do?houseNo=${n.productNo }" class="btn-r bc5">상품정보 확인</a>
	                                		</c:when>
	                                	</c:choose>
										</td>
										<td>
											<button class="btn-s bc1" id="approve-btn" target="#approve-modal">승인</button>
											<input type="hidden" value="${n.productNo }" name="productNo">
											<button class="modal-open-btn btn-s bc2" target="#return-modal">반려</button>
										</td>
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
								<button class="checkedApproveProduct-btn btn-m bc1">선택 상품 승인</button>
								<button class="checkedApproveProduct" style="display:none">선택 상품 승인</button>
								<!-- <button class="checkedReturnProduct btn-m bc2">선택 상품 반려</button> -->
							</div>
						</div>
					</div>    
				</div>
			</div>

		</div>
	</div>
	<script src="resources/js/admin.js"></script>
	<script src="resources/js/adminNewProduct.js"></script>
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

	$(".checkedApproveProduct-btn").on("click",function(){
        const result = confirm("해당 상품(들)을 승인하시겠습니까?");
    
        if(result == true) {
            $(this).next().click();
            alert("성공적으로 승인되었습니다.");
        } else {
            alert("해당 작업을 취소하였습니다.");
        }
    });
</script>
</html>