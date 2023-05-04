<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>${house.houseTitle} - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<link rel="stylesheet" type="text/css" href="resources/css/product.css">
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="resources/css/review.css">
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />



		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>숙박 상품</h2>
						<p class="lead">
						<input type="hidden" name="houseStatus" value="${house.houseStatus }">
						<c:if test="${house.houseStatus == 0}">판매 중지된 상품입니다.
						</c:if>
						</p>
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
					<div class="col-md-5">
						<c:choose>
						<c:when test="${house.housePhoto1 == null }">
						<div class="row" style="height: 450px;">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="waveEffect" style="margin: 0 auto;">
									<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
									<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/house/${house.housePhoto1 }" style="width: 100%;"></div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
							<ul class="pagination" style="text-align: center;">
								<li style="margin: 5px;"><img class="clickToLarger onViewing" src="resources/upload/house/${house.housePhoto1 }"></li>
								<c:if test="${house.housePhoto2 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto2 }"></li>
								</c:if>
								<c:if test="${house.housePhoto3 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto3 }"></li>
								</c:if>
								<c:if test="${house.housePhoto4 != null }">
								<li style="margin: 5px;"><img class="clickToLarger" src="resources/upload/house/${house.housePhoto4 }"></li>
								</c:if>
							</ul>
							</div>
						</div>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6 product-detail">
							<input type="hidden" name="houseNo" value="${house.houseNo }">
							<input type="hidden" name="roomTitle" value="${house.roomTitle }">
							<p>${house.roomTitle }</p>
							<hr>
							<div class="row">
								<h1 style="padding-bottom: 40px;">${house.houseTitle }</h1>
								<input type="hidden" name="housePrice" value="${house.housePrice }">
								<h3><span style="font-size: 36px; font-weight: bold;"><fmt:formatNumber value="${house.housePrice }" pattern="#,###" /></span>원/1박</h3>
								<div class="col-md-9">
									<p style="text-indent: 10px;"><a href="#" data-toggle="tooltip" data-placement="right" title="주말(입실일 기준 금/토)에는 1.5배의 할증이 있습니다. 성수기(6월~8월)에는 1.2배의 할증이 추가로 붙습니다.">( ※ 비성수기 평일 기준 )</a></p>
								</div>
								<div class="col-md-3">
									<input type="hidden" name="roomCapa" value="${house.roomCapa }">
									<p style="text-align: left; font-size: 22px; font-weight: bold"><span class="label label-primary">${house.roomCapa }인실</span></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8">
								<c:choose>
									<c:when test="${house.houseScore != 0 }">
									<div id="half-stars-example">
										<input type="hidden" name="houseScore" value="${house.houseScore }">
    <div class="rating-group">
        <input class="rating__input rating__input--none" name="rating2" id="rating2-0" value="0" type="radio" disabled checked>
        <label aria-label="0 stars" class="rating__label" for="rating2-0">&nbsp;</label>
        <label aria-label="0.5 stars" class="rating__label rating__label--half" for="rating2-05"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
        <input class="rating__input" name="rating2" id="rating2-05" value="0.5" type="radio" disabled>
        <label aria-label="1 star" class="rating__label" for="rating2-10"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating2" id="rating2-10" value="1" type="radio" disabled>
        <label aria-label="1.5 stars" class="rating__label rating__label--half" for="rating2-15"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
        <input class="rating__input" name="rating2" id="rating2-15" value="1.5" type="radio" disabled>
        <label aria-label="2 stars" class="rating__label" for="rating2-20"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating2" id="rating2-20" value="2" type="radio" disabled>
        <label aria-label="2.5 stars" class="rating__label rating__label--half" for="rating2-25"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
        <input class="rating__input" name="rating2" id="rating2-25" value="2.5" type="radio" disabled>
        <label aria-label="3 stars" class="rating__label" for="rating2-30"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating2" id="rating2-30" value="3" type="radio" disabled>
        <label aria-label="3.5 stars" class="rating__label rating__label--half" for="rating2-35"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
        <input class="rating__input" name="rating2" id="rating2-35" value="3.5" type="radio" disabled>
        <label aria-label="4 stars" class="rating__label" for="rating2-40"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating2" id="rating2-40" value="4" type="radio" disabled>
        <label aria-label="4.5 stars" class="rating__label rating__label--half" for="rating2-45"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>
        <input class="rating__input" name="rating2" id="rating2-45" value="4.5" type="radio" disabled>
        <label aria-label="5 stars" class="rating__label" for="rating2-50"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
        <input class="rating__input" name="rating2" id="rating2-50" value="5" type="radio" disabled>
    </div>
</div>
									</c:when>
									<c:otherwise>아직 평점이 없습니다.</c:otherwise>
								</c:choose>
								</div>
								<div class="col-md-3 optionIcons">
									<c:if test="${house.houseBarbecue == 1}">
										<img src="/resources/images/barbecue.png">
									</c:if>
									<c:if test="${house.houseParty == 1}">
										<img src="/resources/images/party.png">
									</c:if>
								</div>
							</div>
							<div class="row" style="margin-top: 30px;">
								<div class="col-md-2">주소지 :</div>
								<div class="col-md-10">${house.houseAddress }</div>
							</div>
						<div>
							<button class="toggleWishList" onclick="goWishList()">
								<input id="showWishStatus" type="checkbox">
								<div>관심상품</div>
							</button>
							<button class="toggleWishList" style="background-color: #3ac5c8;" onclick="location.href='/kiosk.do'">
								<div style="color: white;">예약하기</div>
							</button>
						</div>
						<c:if test="${sessionScope.m.memberGrade == 1 || sessionScope.m.memberGrade == 2}">
						<div>
							<a class="btn btn-default" href="/houseUpdate.do?houseNo=${house.houseNo}">상품 수정</a>
							<a class="btn btn-default" href="/roomManage.do?houseNo=${house.houseNo}">객실 관리</a>
						</div>
						</c:if>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->




<!-- 예약 진행용 Modal -->
  <div class="modal fade bd-example-modal-lg" id="bookingModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <div id="bookingArea" class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">예약하기</h4>
        </div>
        <div class="modal-body">
        <form action="/orderRoom.do" onsubmit="return checkOrder();" method="post">
        	<fieldset>
				<input type="hidden" name="houseNo" value="${house.houseNo }">
				<select name="roomNo"></select>
        		<div class="row">
	        		<div class="col-md-4">
						<input type="text" name="bookStartDate" id="bookStart" placeholder="숙박 시작일" required disabled>
					</div>
        			<div class="col-md-2"></div>
        			<div class="col-md-4">
						<input type="text" name="bookEndDate" id="bookEnd" placeholder="숙박 퇴실일" required disabled>
					</div>
        		</div>
	        	<div class="row">
		        	<c:if test="${house.houseBarbecue eq 1}">
						<input type="hidden" name="houseBarbecuePrice" value="${house.houseBarbecuePrice }">
    		    		<input type="checkbox" name="optionDetail" id="houseBarbecue" value="바베큐 ${house.houseBarbecuePrice }원">
        				<label for="houseBarbecue">바베큐 ${house.houseBarbecuePrice }원</label>
        			</c:if>
        			<c:if test="${house.houseParty eq 1}">
						<input type="hidden" name="housePartyPrice" value="${house.housePartyPrice }">
        				<input type="checkbox" name="optionDetail" id="houseParty" value="파티 ${house.housePartyPrice }원">
		        		<label for="houseParty">파티 ${house.housePartyPrice }원</label>
    		    	</c:if>
        		</div>
				<input type="hidden" name="roomBookPrice">
				<button type="submit">주문</button>
        	</fieldset>
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>




<!-- 상품 정보 표시 시작 -->
		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-9 card mt-3 tab-card">
						<div class="row tab-card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item active">
									<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">상품설명</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">상품평</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="Three" aria-selected="false">상품문의</a>
								</li>
							</ul>
						</div>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade p-3 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
								${house.getHouseDescriptionBr()}</div>
							<div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab">
<!-- 별점 후기 영역 시작  -->
							<!--별점 & 후기 작성부분  -->
							<c:if test="${sessionScope.m.memberGrade == 3}">
								<button class="Btn reviewBtn button-74" style="margin-top: 20px;">후기 작성하기</button>
							</c:if>	
							<div class="review-wrap" style="margin-top: 20px;" >
							<form action="/reviewWriteFrm.do" onsubmit="return getCurrentUrl()" method="post" enctype="multipart/form-data">
							<table>
								<tr>
									<th style="padding-bottom: 10px;">사진</th>
									<th style="padding-bottom: 20px; padding-top: 20px;"><input style="padding-bottom: 10px;" type="file" name="reviewFile" multiple="multiple"></th>
								</tr>
								<tr>
									<th>제목</th>
									<th style="padding-bottom: 20px; padding-top: 20px;"><input class="reviewWriteView" type="text" name="reviewTitle"></th>
								</tr>
								<tr>
									<th style="padding-bottom: 80px;">내용</th>
									<th style="padding-bottom: 20px; padding-top: 20px;"><textarea class="reviewWriteView" style="width: 208px; height: 100px;" name="reviewContent"></textarea></th>
								</tr>
								<tr>
									<th style="padding-right: 5px;">별점</th>
									<td>
										<div id="reviewWrapper">
											<input type="radio" id="star1" name="rating" value="1" checked="checked"><label class="ratingTap" for="star1"></label>
											<input type="radio" id="star2" name="rating" value="2"><label class="ratingTap" for="star2"></label>
											<input type="radio" id="star3" name="rating" value="3"><label class="ratingTap" for="star3"></label>
											<input type="radio" id="star4" name="rating" value="4"><label class="ratingTap" for="star4"></label>
											<input type="radio" id="star5" name="rating" value="5"><label class="ratingTap" for="star5"></label>
										</div>
									</td>
								</tr>
							</table>
							<input type="hidden" name="productCategory" value="2">
							<input type="hidden" name="productNo" value="${house.houseNo}">
							<input type="hidden" name="reviewWriter" value="${sessionScope.m.memberId }">
							<input type="hidden" name="previousUrl">
							<button style="margin-top: 10px; margin-right: 10px;" class="button-74" type="submit">후기작성</button>
							<button class="reviewEndBtn button-74" type="button">취소</button>
							
							</form>
							</div>
							<div style="margin-top: 20px; margin-bottom: 20px; border-bottom: 2px dashed #595959;"></div>
							
							<!--별점 & 후기 리스트 나오는 부분 -->
							
							<div class="container1">
								<div class="content1">	
									<table style="width: 845px; margin: 0 auto;">
										<tr class="reviewListView">
											<th style="width: 15%;">제목</th>
											<th style="width: 10%;">작성자</th>
											<th style="width: 20%;">내용</th>
											<th style="width: 10%;">별점</th>
											<th style="width: 10%; display: none;">카테고리</th>
											<th style="width: 10%; display: none;">상품번호</th>
											<th style="width: 25%;">사진</th>
											<th style="width: 20%;"></th>
										</tr>
										
										<c:choose>
											<c:when test="${empty list}">
												<tr>
													<td colspan="7" style="text-align:center;">조회된 리뷰가 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${list }" var="review">
													<tr class="reviewModalContent">
														<td style="text-align: center;">${review.reviewTitle }</td>
														<td style="text-align: center;">${review.reviewWriter }</td>
														<td style="text-align: center;">${review.reviewContent }</td>
														<td style="text-align: center; color: orange;" value="${review.rating }">
															<c:if test="${review.rating  == 1}">
																★
															</c:if>
															<c:if test="${review.rating  == 2}">
																★★
															</c:if>
															<c:if test="${review.rating  == 3}">
																★★★
															</c:if>
															<c:if test="${review.rating  == 4}">
																★★★★
															</c:if>
															<c:if test="${review.rating  == 5}">
																★★★★★
															</c:if>
														</td>
														<c:choose>
															<c:when test="${review.productCategory == 2 }">
																	<td style="text-align: center; display: none;">숙박</td>
															</c:when>
														</c:choose>
														<td style="text-align: center; display: none;">${house.houseNo}</td>
														<td>
															<c:forEach items="${review.rfileList }" var="rf">
																<div style="display: inline-block;">
																	<img src="/resources/upload/review/${rf.filepath }" width="60" height="60" class="trans5">
																	<input type="hidden" value=${rf.filepath }>
																	<input type="hidden" value=${rf.fileNo }>
																</div>
															</c:forEach>
														</td>
														<td class="reviewBtnWrap">
															<c:if test="${sessionScope.m.memberId == review.reviewWriter}">
																<button type="button" class="reviewModalBtn button-73" style="margin-right: 10px;" data-toggle="modal" data-target="#reviewUpdate">수정</button>
																<input type="hidden" value="${review.reviewNo }">
																<input type="hidden" value="${review.productCategory }">
																<a class="reviewModalBtn button-73" href="/deleteReview.do?productNo=${house.houseNo }&productCat=2&reviewNo=${review.reviewNo }">삭제</a>
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
									<button class="show-more">더보기</button>
								</div> <!-- content1 닫는 div -->
							</div> <!-- container1 닫는 div -->
							
							
							<!-- 별점 & 후기  수정 모달 -->							
							<div class="modal fade" id="reviewUpdate" role="dialog">
							    <div class="modal-dialog">
							      <div class="modal-content">
							        <form action="/reviewUpdate.do" onsubmit="return updateReviewBtn()" method="post" enctype="multipart/form-data">
							          <fieldset>
								        <div class="modal-header">
								          <button type="button" id="writeModalClose" class="close" data-dismiss="modal">&times;</button>
								          <h4 class="modal-title">수정하기</h4>
								        </div>
							        	<div class="modal-body">
							        		<input type="hidden" class="form-control updateReviewNo" name="reviewNo">
							        		<div>제목</div>
							          		<input type="text" class="form-control reviewTitle" name="reviewTitle" placeholder="제목" value="" required>
							          		<div>작성자</div>
							          		<input type="text" class="form-control reviewWriter" name="reviewWriter" placeholder="작성자" value="" readonly>
							          		<div>내용</div>
							          		<textarea class="form-control reviewContent" rows="6" name="reviewContent" placeholder="내용" required></textarea>
							          		<div>별점(1~5)</div>
											<div>
												<input type="radio" id="updateStar1" name="updateRating" value="1"><label class="ratingTap" for="updateStar1"></label>
												<input type="radio" id="updateStar2" name="updateRating" value="2"><label class="ratingTap" for="updateStar2"></label>
												<input type="radio" id="updateStar3" name="updateRating" value="3"><label class="ratingTap" for="updateStar3"></label>
												<input type="radio" id="updateStar4" name="updateRating" value="4"><label class="ratingTap" for="updateStar4"></label>
												<input type="radio" id="updateStar5" name="updateRating" value="5"><label class="ratingTap" for="updateStar5"></label>
											</div>
							          		<input type="hidden" id="updateRating" name="rating">
							          		<div style="display: none;">카테고리</div>
							          		<input type="hidden" class="form-control productCategory" name="productCategory">
							          		<input style="display: none;" type="text" class="form-control showProductCategory" readonly>
							          		<div style="display: none;">상품번호</div>
							          		<input style="display: none;" type="text" class="form-control productNo" name="productNo" value="${house.houseNo}" readonly>
							          		<div style="clear: both;">첨부파일</div>
						          			<div class="fileList-wrap">
						          			</div>
											<p>첨부파일 추가</p>
											<input type="file" name="reviewFile" multiple>
							          		<input type="hidden" name="previousUrl">
								        </div>
								        <div class="modal-footer">
							          		<button type="submit" class="button-73" id="ratingBtn" style="float: right;">후기글 수정</button>
							        	</div>
							          </fieldset>
							        </form>
							      </div>
							    </div>
							  </div>
							

<!-- 별점 후기 영역 끝  -->
							</div>
							<div class="tab-pane fade p-3" id="three" role="tabpanel" aria-labelledby="three-tab">
							<!-- 상품 문의 영역 시작  -->
								<div class="inquiryBoard">
									<h4 style="line-height: 400%;"><span id="numberOfCount"></span>개의 문의글이 있습니다.</h4>
									<div class="row" style="margin: 20px;">
								 		<div class="btn-group">
											<button type="button" class="btn btn-info" onclick="getInquiries(1, 1)">내 문의보기</button>
											<button type="button" class="btn btn-info" onclick="getInquiries(1, 0)">전체 문의보기</button>
										</div>
									<c:if test="${sessionScope.m.memberGrade == 3}">
										<button type="button" class="btn" data-toggle="modal" data-target="#inquiryWrite">문의하기</button>
									</c:if>
									</div>
									<table class="table table-hover"><thead>
										<tr>
											<th width="8%">번호</th>
											<th style="display: none;">inquiryNo</th>
											<th width="15%">답변상태</th>
											<th width="42%">제목</th>
											<th width="17%">문의자</th>
											<th width="18%">등록일</th>
										</tr>
									</thead>
									<tbody id="forInquiries"></tbody></table>
									<div class="row" style="margin: 20px;" id="forPageNavi"></div>
								</div>
							<!-- 상품 문의 영역 끝  -->
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="panel panel-default">
							<div class="panel-body" style="height: 600px; overflow: clip">광고 등 배너 영역<br>높이 600px을 넘는 사진은 종횡비는 고정하되 아래쪽을 잘라서 출력됨</div>
						</div>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
<!-- 상품 정보 표시 끝 -->


<!-- 문의글 등록 Modal -->
  <div class="modal fade" id="inquiryWrite" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="javascript:;" onsubmit="insertInquiryAjax(this)" method="post">
          <fieldset>
	        <div class="modal-header">
	          <button type="button" id="writeModalClose" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">문의하기</h4>
	        </div>
        	<div class="modal-body">
          		<label><input type="checkbox" name="privately" value="1" style="width: 25px; height: 25px; vertical-align: bottom;"> 비밀글</label>
          		<input type="text" class="form-control" name="inquiryTitle" placeholder="제목: 한글 최대 100자.  제목은 비밀글 여부와 관계없이 항상 노출됩니다." required>
          		<textarea class="form-control" rows="6" name="inquiryContent" placeholder="본문: 한글 최대 333자." required></textarea>
          		<input type="hidden" name="productCategory" value="2">
          		<input type="hidden" name="productNo" value="${house.houseNo}">
	        </div>
	        <div class="modal-footer">
          		<button type="reset" id="writeFormReset" style="display: none;">reset</button>
          		<button type="submit" class="btn btn-info" style="float: right;">문의글 등록</button>
        	</div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>
	<script src="resources/js/houseDetail.js"></script>
</body>
</html>