<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<link rel="stylesheet" href="resources/css/adminCommon.css"></link>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<link rel="stylesheet" href="resources/css/adminProductTable.css"></link>
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
    <div id="test-modal" class="modal-bg" style="z-index:1; display:none;">
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
	<div class="newProduct-wrapper product-wrapper admin-content">
		<div>
			<div class="lesson-list">
				<div class="table-content">
					<div class="product-choice">
						<a href="/newProductAll.do?reqPage=1">전체</a>
						<a href="/newProductLesson.do?reqPage=1" style="background-color:#ecb534; color:#fff">강습</a>
						<a href="/newProductHouse.do?reqPage=1">숙박</a>
					</div>
					<div class="list-wrapper">
						<input type="hidden" value="${hiddenVal }" class="hidden-input">
						<form action="/adminSearchLesson.do" method="get"
						id="frm" class="search-bar search-box" name="search-product">
						<input type="hidden" name="jspPage" value="nl">
						<input type="hidden" name="reqPage" value="1">
						<select name="lessonSearchType" class="search-type">
							<option value="n">강습명</option>
							<option value="s">판매자</option>
							<option value="le">강습레벨</option>
							<option value="lo">지역</option>
						</select>
						<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
						<input
							type="text" placeholder="검색어를 입력하세요" name="lessonSearchKeyword"
							onkeyup="enterkey();" class="search-input"> 
						<div class="material-symbols-outlined search-icon search-btn"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
					</form>
						<div id="lessonResult"></div>
						<div class="newProduct-top list-top">
							<div class="count">
								강습 전체 상품 <span>${newLessonCount }</span>
							</div>
							<input type="hidden" value="강습" class="lesson-product-type">
							<table>
								<tr>
									<th><input type="checkbox" name="lessonCheck"
										class="lesson-all-check chk"></th>
									<th style="display:none"></th> <!-- 모달 정보 가져오기 위해... eq 조정 -->
									<th>사진</th>
									<th style="width: 300px;">상품명</th>
									<th>판매자</th>
									<th>강습 레벨</th>
									<th>모집정원</th>
									<th>지역</th>
									<th>상품정보</th>
									<th></th>
								</tr>
								<c:choose>
								<c:when test="${empty lessonList}">
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
								<c:forEach items="${lessonList }" var="l">
								<c:if test="${l.lessonStatus == -1 }">
									<tr>
										<td><input type="checkbox" name="lessonCheck"
											class="lesson-check chk check" value="${l.lessonNo }"></td>
										<td style="display:none">강습</td>
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
										<td>${l.writer }</td>
										<td>${l.lessonLevel }</td>
										<td><span>${l.lessonMaxNo }</span>명</td>
										<td>${l.lessonCity }</td>
										<td>
										<a href="/lessonView.do?lessonNo=${l.lessonNo }" class="btn-r bc5">상품정보 확인</a>
										</td>
										<td><button class="btn-s bc1" id="approve-btn" target="#approve-modal">승인</button>
										<input type="hidden" value="${l.lessonNo }" name="productNo">
										<button class="modal-open-btn btn-s bc2" target="#test-modal">반려</button></td>
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

	/*검색
	function search(){
		var searchType = $("[name=lessonSearchType]").val();
		var searchKeyword = $("[name=lessonSearchKeyword]").val();

		console.log(searchType);
		console.log(searchKeyword);

		$.ajax({
			url: "/adminSearchLesson.do",
			type: "get",
			dataType: "json",
			data: {searchType : searchType, searchKeyword : searchKeyword},
			success : function(lessonList) {
				console.log(lessonList,typeof lessonList);
				console.log("서버 호출 성공");
				if(lessonList == null) {
					$("#lessonResult").text("상품 정보를 조회할 수 없습니다.");
				} else {
					$('tr:eq(1)').remove();
					
					$('tr').each(function() {
					  var $this = $(this);
					  var l = {
					    lessonNo: $this.find('.lesson-check').val(),
					    lessonTitle: $this.find('a').text(),
					    writer: $this.find('td:eq(2)').text(),
					    lessonNameLevel: $this.find('td:eq(3)').text(),
					    lessonMaxNo: $this.find('td:eq(4) span').text(),
					    lessonCity: $this.find('td:eq(5)').text(),
					    lessonStatus: $this.find('td:eq(7) select').val()
					  };
					  
					  $this.find('.status-change').change(function() {
					    l.lessonStatus = $(this).val();
					  });
					  
					  $this.find('.approveProduct').click(function() {
					    var productNo = $this.find('input[name="productNo"]').val();
					    // 승인 버튼 클릭 시 동작할 코드 작성
					  });
					  
					  $this.find('.returnProduct').click(function() {
					    var productNo = $this.find('input[name="productNo"]').val();
					    // 반려 버튼 클릭 시 동작할 코드 작성
					  });
					});
				}  
			},
			error : function(lessonList) {
				console.log(lessonList);
				alert("검색어를 확인해주세요");
			}
		})
	}*/
</script>
</html>