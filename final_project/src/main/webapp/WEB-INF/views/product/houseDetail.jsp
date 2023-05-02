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



	<script type="text/javascript">
	// 후기 등록 submit 버튼 눌렀을 때
	function getCurrentUrl(){
		const ltrim = /^\S{0,}houseView/;
		const currentUrl = window.location.href;
		const returnUrl = currentUrl.replace(ltrim, "");
		$("[name=previousUrl]").val("houseView"+returnUrl);
		return true;
	}
	
	// 후기 수정하는 modal에서 submit 버튼 눌렀을 때
	function updateReviewBtn(){
		const ltrim = /^\S{0,}houseView/;
		const currentUrl = window.location.href;
		const returnUrl = currentUrl.replace(ltrim, "");
		$("[name=previousUrl]").val("houseView"+returnUrl);
		
		if($("#updateStar1").prop("checked")){
			$("#updateRating").val(1)
		}else if($("#updateStar2").prop("checked")){
			$("#updateRating").val(2)
		}else if($("#updateStar3").prop("checked")){
			$("#updateRating").val(3)
		}else if($("#updateStar4").prop("checked")){
			$("#updateRating").val(4)
		}else if($("#updateStar5").prop("checked")){
			$("#updateRating").val(5)
		}else {
			return false;
		}
		return true;
	}
		
	
	// review 더보기 버튼 실행
	
	const showMoreBtn = document.querySelector('.show-more');
	const container1 = document.querySelector('.container1');
	
	showMoreBtn.addEventListener('click', function() {
	  container1.classList.toggle('show-more-open');
	  if (container1.classList.contains('show-more-open')) {
	    showMoreBtn.style.display = 'none';
	  }
	});
	
	
	// review 글쓰기 버튼이벤트
	$(".review-wrap").hide();
		$(".reviewBtn").on("click",function(){
			$(".review-wrap").slideDown();
			$(this).hide();
		});
		
		$(".reviewEndBtn").on("click",function(){
			$(".review-wrap").slideUp();
			$(".reviewBtn").show();
		});
	
	// review 모달 수정	
	$(".reviewModalBtn").on("click",function(){
		var reviewNo = $(this).next().val();
		var reviewTitle = $(this).parent().parent().children().eq(0).text();
		var reviewWriter = $(this).parent().parent().children().eq(1).text();
		var reviewContent = $(this).parent().parent().children().eq(2).text();
		/* var rating = $(this).parent().parent().children().eq(3).children().text(); */
		var rating = $(this).parent().parent().children().eq(3).attr("value");
		var productCategory = $(this).next().next().val();
		var rfileList =$(this).parent().parent().children().eq(6).children().clone();
		$(".fileList-wrap").empty();
		rfileList.each(function(i, f){
			const fileNo = $(f).children().eq(2).val();
			const div = $("<div>").addClass("delfile-box");
			const button = $("<button>").attr("type", "button").attr("onclick", "deleteFile(this, "+fileNo+",)").append("삭제")
			div.append(f).append(button);
			$(".fileList-wrap").append(div);
		})
		$(".updateReviewNo").val(reviewNo);
		$(".modal-footer").children().attr("href", "");
		$(".reviewTitle").val(reviewTitle);
		$(".reviewWriter").val(reviewWriter);
		$(".reviewContent").val(reviewContent);
		$(".rating").val(rating);
		$(".productCategory").val(productCategory);
		$(".showProductCategory").val("숙박");
		if(rating == 1){
			$("#updateStar1").prop("checked", true);
		}else if(rating == 2){
			$("#updateStar2").prop("checked", true);
		}else if(rating == 3){
			$("#updateStar3").prop("checked", true);
		}else if(rating == 4){
			$("#updateStar4").prop("checked", true);
		}else if(rating == 5){
			$("#updateStar5").prop("checked", true);
		}
	});
	
	// review 파일 삭제
	function deleteFile(obj,fileNo){
	   const filepath = $(obj).parent().find("input").val()
	   const input = $("<input>").attr("name", "delFileList").attr("type", "hidden").val(filepath);
	   const input2 = $("<input>").attr("name", "fileNo").attr("type", "hidden").val(fileNo);
	   $(obj).parent().after(input);
	   $(obj).parent().after(input2);
	   $(obj).parent().remove();
	}
	
	// replaceAt 함수 정의
		String.prototype.replaceAt = function(index, replacement) {
		    return this.substring(0, index) + replacement + this.substring(index + replacement.length);
		}


	// 부트스트랩 tooltip
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();   
		});


	// 작은 이미지를 누르면, 위에 큰 이미지 자리가 대체됨
		$(function(){
			$(".clickToLarger").click(function () {
				$(".clickToLarger").removeClass("onViewing");
				$(this).addClass("onViewing");
				$(".bigThumbnailImage").attr("src",$(this).attr("src"));
			});
	
		})


	// (숙박업소 & 인원 수) 조건에 맞는 객실들을 받는 ajax
		const roomTitleVal = $("[name=roomTitle]").val();
		const roomCapaVal = $("[name=roomCapa]").val();
		$.ajax({
				url : "/availableRooms.do",
				data: {roomTitle : roomTitleVal, roomCapa : roomCapaVal},
				dataType : "json",
				success : function(List){
					$("[name=roomNo]").empty();
					$("[name=roomNo]").append($("<option>").text("객실을 먼저 선택해주세요"));
					for(let i=0; i<List.length; i++){
						const option = $("<option>");
						option.val(List[i].roomNo);
						option.text(List[i].roomName);
						$("[name=roomNo]").append(option);
	    			}
				}
		});


	// 예약하기 modal 띄우면 실행되는 함수 시작
		$("#goBooking").on("click", function(){
			$("[name=roomNo]").on("change", function(){
			// 이미 결제완료된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax 
				$.ajax({
					url : "/bookOneRoom.do",
					data: {roomNo : $(this).val()},
					dataType : "json",
					success : function(List){
						let invalidDateRanges = [];
						for(let i=0; i<List.length; i++){
							invalidDateRanges[i] = { 'start': moment(List[i].bookStartDate), 'end': moment(List[i].bookEndDate) };
	    				}

					// 선택된 객실 바뀔 때마다 날짜 관련 데이터들 모두 초기화
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookEnd").val("");
						$("#bookEnd").attr("value", null);

						$("#bookStart").prop("disabled", false);
						$("#bookEnd").prop("disabled", false);

						// 객실예약의 시작일을 선택하는 date range picker 생성
							$('#bookStart').daterangepicker({
							    parentEl: "#bookingArea .modal-body",
								locale: {
									format: "YYYY-MM-DD",
									fromLabel: "시작",
									toLabel: "종료"
							    },
							    alwaysShowCalendars: true,
								autoApply: true,
								singleDatePicker: true,
								showDropdowns: true,
								minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
								maxDate: moment().add(3, 'months'),	// 시작일은 3개월 이내에서 지정 가능
								isInvalidDate: function(date) {
									return invalidDateRanges.reduce(function(bool, range) {
										return bool || (date >= range.start && date <= range.end);
									}, false);
								}
							});
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);	// value 없는 상태로 생성 필요

						// 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
							$("#bookStart").on("change", function(){
								const bookStartDate = $("#bookStart").val();	// 시작일+1을 minDate로 사용할 예정
							// maxDate는 시작일+3개월로 초기화 
								var maxLimit = moment(bookStartDate).add(3, 'months').format("YYYY-MM-DD");
							// bookStartDate로부터 가장 가까운 미래의 invalidDateRanges로 maxDate를 좁혀줌
								for(let i=invalidDateRanges.length-1; i>=0; i--){
									if(bookStartDate < invalidDateRanges[i].start.format("YYYY-MM-DD")){
										maxLimit = invalidDateRanges[i].start.format("YYYY-MM-DD");
									}
								}

								$('#bookEnd').daterangepicker({
								    parentEl: "#bookingArea .modal-body",
									locale: {
										format: "YYYY-MM-DD",
										fromLabel: "시작",
										toLabel: "종료"
								    },
								    alwaysShowCalendars: true,
									autoApply: true,
									singleDatePicker: true,
									showDropdowns: true,
									minDate: moment($("#bookStart").val()).add(1, 'days'),
									maxDate: maxLimit
								});
								$("#bookEnd").val("");
								$("#bookEnd").attr("value", null);	// value 없는 상태로 생성시킴
							});

						},
				// 드롭다운 input이 특정 객실일이 아니라, "객실을 먼저 선택해주세요"에 focus 되었을 때 처리를  ajax error에서 처리함 
					error : function(){
						console.log("객실을 먼저 선택해주세요에 focus됨");
						$(".daterangepicker").remove();
						$("#bookStart").val("");
						$("#bookStart").attr("value", null);
						$("#bookStart").prop("disabled", true);
						$("#bookEnd").val("");
						$("#bookEnd").attr("value", null);
						$("#bookEnd").prop("disabled", true);
					}
				});
			});
		});
	// 예약하기 modal 띄우면 실행되는 함수 끝


	// input에 값이 없으면 form 제출을 막는 함수
		function checkOrder(){
			if ( $("[name=bookStartDate]").val() == "" || $("[name=bookEndDate]").val() == "" ) {
				alert('시작일과 퇴실일을 선택해주십시오.');
				return false;
			}
			fullPrice();
			return true;
		}


	// roomBookPrice를 계산하는 함수
		const onedayPrice = $("[name=housePrice]").val();
		function fullPrice(){
			let result = 0;
			let days = moment($("#bookEnd").val()).diff(moment($("#bookStart").val()), 'days');
			for(let i=0; i<days; i++){
				let adjustment = 1;
				if(moment($("#bookStart").val()).add(i, 'days').format('M')>=6 && moment($("#bookStart").val()).add(i, 'days').format('M')<=8){
					console.log("6~8월은 성수기 할증으로 요금이 1.2배가 됩니다.");
					adjustment *= 1.2;
				}
				if(moment($("#bookStart").val()).add(i, 'days').isoWeekday() == 5 || moment($("#bookStart").val()).add(i, 'days').isoWeekday() == 6){
					console.log("주말은 할증으로 요금이 1.5배가 됩니다.");
					adjustment *= 1.5;
				}
				result += onedayPrice * adjustment;
				console.log((i+1)+"일째까지 누계 "+result+"원");
			}
			if($("#houseBarbecue").prop("checked")){
				result += Number($("[name=houseBarbecuePrice]").val());
			}
			if($("#houseParty").prop("checked")){
				result += Number($("[name=housePartyPrice]").val());
			}
			console.log("옵션을 포함한 총 요금은 "+result+"원으로 계산되었습니다.");
			$("[name=roomBookPrice]").val(result);
		}


	// 관심상품 버튼을 눌렀을 때
		function goWishList(){
			const houseNo = $("[name=houseNo]").val();
			const houseStatus = $("[name=houseStatus]").val();
			if($("#showWishStatus").prop("checked")){
				$.ajax({
					url : "/delistWishList.do",
					data: {house_no : houseNo, lesson_no : 0},
					dataType : "text",
					success : function(message){
						if(message=="관심상품에서 제외했습니다."){
							$("#showWishStatus").prop("checked", false);
						}else{
							$("#showWishStatus").prop("checked", true);
							alert(message);
						}
					},
					error : function(){
						alert("알 수 없는 오류가 발생했습니다.");
					}
				});
			}else{
				if(houseStatus==1){
					$.ajax({
						url : "/insertWishList.do",
						data: {house_no : houseNo, lesson_no : 0},
						dataType : "text",
						success : function(message){
							if(message=="관심상품에 등록했습니다."){
								$("#showWishStatus").prop("checked", true);
							}else if(message=="이미 회원님의 관심목록에 추가되어 있는 상품입니다."){
								$("#showWishStatus").prop("checked", true);
								alert(message);
							}else{
								$("#showWishStatus").prop("checked", false);
								alert(message);
							}
						},
						error : function(){
							alert("알 수 없는 오류가 발생했습니다.");
						}
					});
				}else{
					alert("판매중인 상품이 아닙니다.");
				}
			}
		}


	// 나의 관심상품에 있는 상품인지 확인 후 관심상품 추가하기에 불 들어오게
		function refrechWishList(){
			const houseNo = $("[name=houseNo]").val();
			const houseStatus = $("[name=houseStatus]").val();
				$.ajax({
					url : "/checkWishStatus.do",
					data: {house_no : houseNo, lesson_no : 0},
					dataType : "text",
					success : function(message){
						if(message=="이미 회원님의 관심목록에 추가되어 있는 상품입니다."){
							$("#showWishStatus").prop("checked", true);
						}
					}
				});
		}


	// 문의글 목록을 <tr>단위로 불러오는 ajax
		function getInquiries(reqPage, range){
			$.ajax({
					url : "/getInquiries.do",
					data: {reqPage : reqPage, productCategory : 2, productNo : $("[name=houseNo]").val(), range : range},
					dataType : "json",
					success : function(InquiryPagination){
						$("#forInquiries").empty();
						$("#forPageNavi").empty();
						$("#numberOfCount").text(InquiryPagination.totalCount);
						if(InquiryPagination.totalCount == 0){
							$("#forInquiries").append( $("<tr>").addClass("hasNoInquiry").append($("<td>").attr("colspan", "6").css("text-align", "center").text("조회된 문의 내역이 없습니다.") ) );
						}else{
							for(let i=0; i<InquiryPagination.list.length; i++){
								const td1 = $("<td>").text((InquiryPagination.start)+i);
								
								const td2 = $("<td>").css("display", "none").text(InquiryPagination.list[i].inquiryNo);
								
								const td3 = $("<td>");
								if( InquiryPagination.list[i].answered > 0 ){
									td3.text("답변완료");
								}else{ td3.text("미답변"); }
								
								const td4 = $("<td>");
								if( InquiryPagination.list[i].privately > 0 ){
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text((InquiryPagination.list[i].inquiryTitle) + " 🔒 "));
								}else{
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text(InquiryPagination.list[i].inquiryTitle));
								}
								
								const idLength = InquiryPagination.list[i].inquirer.length;
								const td5 = $("<td>").text(InquiryPagination.list[i].inquirer);
								
								const td6 = $("<td>").text(InquiryPagination.list[i].regDate.substring(0,10));
		
								const tr = $("<tr>").addClass("inquiryTr").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
								$("#forInquiries").append(tr);
			    			}
						$("#forPageNavi").append(InquiryPagination.pageNavi);
					}
				}
			});
		}

	// 이 .jsp 페이지를 방문할 때 문의글 첫 페이지 조회로 시작
		$(document).ready(function() {
			getInquiries(1, 0);
			refrechWishList();
		});


	// 문의글의 제목을 누르면 아래에 tr로 문의글 내용이 삽입되면서 펼쳐지는 효과로 출력
		function expandIt(obj){
			const targetInquiryNo = $(obj).parent().prev().prev().text();
			if( $(obj).parent().parent().next().children().eq(3).attr("colspan") == 3 ){
				 $(obj).parent().parent().nextUntil(".inquiryTr").remove();
			}else{
				$.ajax({
					url : "/inquiryView.do",
					data: {inquiryNo : targetInquiryNo, productCategory : 2, productNo : $("[name=houseNo]").val()},
					dataType : "json",
					async : false,
					success : function(Inquiry){
						if(Inquiry.inquiryNo <= 0){
							alert(Inquiry.inquiryContent);
						}else{
							$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-ansI displayForSeller").append( $("<td>") ).append( $("<td>").addClass("inquiryTd").text("답변하기") ).append( $("<td>").addClass("inquiryExpanded").attr("colspan", "4").html("<textarea class='form-control'></textarea>").append( $("<button>").attr("onclick", "insertAnswer(this)").text("답변 등록") ) ) );
							if(Inquiry.answerList.length>0){
								for(let j=0; j<Inquiry.answerList.length; j++){
									$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-ans").append( $("<td>").html("<button type='button' class='displayForSeller' onclick='editAnswerContent(this)'>수정</button><br><button type='button' class='displayForSeller' onclick='deleteAnswerConfirm(this)'>삭제</button>") ).append( $("<td>").css("display", "none").text(Inquiry.answerList[j].answerNo) ).append( $("<td>").addClass("inquiryTd").html("답변: ") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "3").html("<span>"+Inquiry.answerList[j].answerContent.replaceAll("\n","<br>")+"</span>") ) );
								}
							}
							$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-inq").append( $("<td>").html("<button type='button' class='displayForGeneralMember' onclick='editInquiryContent(this)'>수정</button><br><button type='button' class='displayForGeneralMember' onclick='deleteInquiryConfirm(this)'>삭제</button>") ).append( $("<td>").css("display", "none") ).append( $("<td>").addClass("inquiryTd").text("문의 내용") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "3").html("<span>"+Inquiry.inquiryContent.replaceAll("\n","<br>")+"</span>") ) );
						}
					}
				});
			}
		}


	// 문의글 등록 폼 제출
		function insertInquiryAjax(obj){
			const trimedTitle = $("[name=inquiryTitle]").val().trim().replace(/\s+/g," ");
			$("[name=inquiryTitle]").val(trimedTitle);
			
			let privately = 0;
			if($(obj).find("[name=privately]").prop("checked")){
				privately = 1;
			}
			$.ajax({
				url : "/insertInquiry.do",
				data: {privately : privately , inquiryTitle : $(obj).find("[name=inquiryTitle]").val() , inquiryContent : $(obj).find("[name=inquiryContent]").val(), productCategory : 2, productNo : $("[name=houseNo]").val()},
				dataType : "text",
				success : function(result){
					alert(result);
					$("#writeFormReset").click();
					$("#writeModalClose").click();
					getInquiries(1, 0);
				}
			});
		}


	// 문의글 수정 버튼을 눌렀을 때
		function editInquiryContent(obj){
			const getContent = $(obj).parent().next().next().next().children().eq(0).html().replaceAll("<br>","\n");
			$(obj).parent().next().next().next().children().css("display", "none");
			$(obj).parent().next().next().next().append( $("<textarea>").addClass("form-control").attr("rows", 4).css("width", "100%").val(getContent) );
			$(obj).parent().next().next().next().append( $("<button>").attr("onclick", "updateInquiry(this)").text("내용 수정") );
			$(obj).attr("onclick", "cancleEditInquiry(this)");
			$(obj).text("취소");
		}


	// 문의글 내용수정 버튼을 누르면 동작하는 ajax
		function updateInquiry(obj){
			$.ajax({
				url : "/updateInquiry.do",
				data: {inquiryNo : $(obj).parent().parent().prev().children().eq(1).text(), inquiryContent : $(obj).prev().val()},
				dataType : "text",
				success : function(result){
					alert(result);
					const target = $(obj).parent().parent().prev().children().eq(3).children().eq(0);
					target.click();
					target.click();
				}
			});
		}


	// 문의글 수정 취소 버튼을 눌렀을 때
		function cancleEditInquiry(obj){
			$(obj).parent().next().next().next().children().eq(2).remove();
			$(obj).parent().next().next().next().children().eq(1).remove();
			$(obj).parent().next().next().next().children().eq(0).css("display", "inline");
			$(obj).attr("onclick", "editInquiryContent(this)");
			$(obj).text("수정");
		}


	// 문의글 삭제 버튼을 눌렀을 때
		function deleteInquiryConfirm(obj){		
			const inquiryNo = $(obj).parent().parent().prev().children().eq(1).text();
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				deleteInquiry(inquiryNo);
			}
		}


	// 문의글 삭제 버튼을 누르면 동작하는 ajax
		function deleteInquiry(inquiryNo){
			$.ajax({
				url : "/deleteInquiry.do",
				data: {inquiryNo : inquiryNo},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "문의글을 삭제했습니다."){
						getInquiries(1, 0);
					}
				}
			});
		}


	// 답변 등록 버튼을 누르면 동작하는 ajax
		function insertAnswer(obj){
			$.ajax({
				url : "/insertAnswer.do",
				data: {inquiryNo : $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(1).text(), answerContent : $(obj).prev().val(), productCategory : 2, productNo : $("[name=houseNo]").val()},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "답변을 등록했습니다."){
						const target = $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(3).children().eq(0);
						target.click();
						target.click();
					}
				}
			});
		}


	// 답변 수정 버튼을 눌렀을 때
		function editAnswerContent(obj){
			const getContent = $(obj).parent().next().next().next().children().eq(0).html().replaceAll("<br>","\n");
			$(obj).parent().next().next().next().children().css("display", "none");
			$(obj).parent().next().next().next().append( $("<textarea>").addClass("form-control").attr("rows", 4).css("width", "100%").val(getContent) );
			$(obj).parent().next().next().next().append( $("<button>").attr("onclick", "updateAnswer(this)").text("내용 수정") );
			$(obj).attr("onclick", "cancleEditAnswer(this)");
			$(obj).text("취소");
		}


	// 답변 내용수정 버튼을 누르면 동작하는 ajax
		function updateAnswer(obj){
			$.ajax({
				url : "/updateAnswer.do",
				data: {answerNo : $(obj).parent().prev().prev().text(), answerContent : $(obj).prev().val()},
				dataType : "text",
				success : function(result){
					alert(result);
					const target = $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(3).children().eq(0);
					target.click();
					target.click();
				}
			});
		}


	// 답변 수정 취소 버튼을 눌렀을 때
		function cancleEditAnswer(obj){
			$(obj).parent().next().next().next().children().eq(2).remove();
			$(obj).parent().next().next().next().children().eq(1).remove();
			$(obj).parent().next().next().next().children().eq(0).css("display", "inline");
			$(obj).attr("onclick", "editAnswerContent(this)");
			$(obj).text("수정");
		}


	// 답변 삭제 버튼을 눌렀을 때
		function deleteAnswerConfirm(obj){		
			const answerNo = $(obj).parent().next().text();
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				deleteAnswer(answerNo);
			}
		}


	// 답변 삭제 버튼을 누르면 동작하는 ajax
		function deleteAnswer(answerNo){
			$.ajax({
				url : "/deleteAnswer.do",
				data: {answerNo : answerNo},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "답변을 삭제했습니다."){
						getInquiries(1, 0);
					}
				}
			});
		}


	// 로그인된 회원의 등급에 따라 특정 요소들을 display:none 처리
		$(document).ready(function(){
			const stylesheet = document.styleSheets[0];		// 링크된 .css 파일들 중 첫 번째 파일
			let elementRules;
		
			// 관리자(Grade 1) 또는 판매자(Grade 2)가 아닌 경우에만 변경할 css
			for(let i = 0; i < stylesheet.cssRules.length; i++) {
				if(stylesheet.cssRules[i].selectorText === '.displayForSeller') {
				elementRules = stylesheet.cssRules[i];
				}
			}
			if( $(".hiddenMemberGrade").val()==1 || $(".hiddenMemberGrade").val()==2 ){
			}else{
				elementRules.style.setProperty('display', 'none');
			}
			
			// 관리자(Grade 1) 또는 일반회원(Grade 3)가 아닌 경우에만 변경할 css
			for(let i = 0; i < stylesheet.cssRules.length; i++) {
				if(stylesheet.cssRules[i].selectorText === '.displayForGeneralMember') {
					elementRules = stylesheet.cssRules[i];
				}
			}
			if( $(".hiddenMemberGrade").val()==1 || $(".hiddenMemberGrade").val()==3 ){
			}else{
				elementRules.style.setProperty('display', 'none');
			}
		});



	// 평점 select
		$(document).ready(function() {
			const score = $("[name=houseScore]").val();
			if(score <0.5){
			}else if(score >= 0.5 && score < 1){
				$("#rating2-0").prop("checked", false);
				$("#rating2-05").prop("checked", true);
			}else if(score >= 1 && score < 1.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-10").prop("checked", true);
			}else if(score >= 1.5 && score < 2){
				$("#rating2-0").prop("checked", false);
				$("#rating2-15").prop("checked", true);
			}else if(score >= 2 && score < 2.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-20").prop("checked", true);
			}else if(score >= 2.5 && score < 3){
				$("#rating2-0").prop("checked", false);
				$("#rating2-25").prop("checked", true);
			}else if(score >= 3 && score < 3.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-30").prop("checked", true);
			}else if(score >= 3.5 && score < 4){
				$("#rating2-0").prop("checked", false);
				$("#rating2-35").prop("checked", true);
			}else if(score >= 4 && score < 4.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-40").prop("checked", true);
			}else if(score >= 4.5 && score < 5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-45").prop("checked", true);
			}else if(score >= 5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-50").prop("checked", true);
			}
		});
	</script>

</body>
</html>