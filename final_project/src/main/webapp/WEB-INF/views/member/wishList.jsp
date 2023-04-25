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
        width: 535px;
        padding: 30px 5px 0px 5px;
        margin: 0 10px 0 10px;
        box-sizing: border-box;
        position: relative;
        display:inline-block;
    }
    .close-icon{
        padding: 5px;
        position: absolute;
        top: 30px;
        right: 0px;
        transition-duration : 0.4s;
        border-radius: 24px;
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
    	width: 530px;
        display: flex;
        padding-top: 13px;
        padding-bottom: 10px;
    }
    .wishList-box-bottom>div>.product-img{
        width: 100px;
        height: 110px;
        background-color: blue;
        margin-right: 10px;
    }
    .wishList-box-detail{
        width: 400px;
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

    /*active*/
    .active-wishList-content{
        display: block;
    }
    .active-line1{
        left: 0px;
    }
    .active-line2{
        left: 100px;
    }
    .active-line3{
        left: 200px;
    }
    .black-box{
        width: 546px;
        height: 205px;
    	background-color: rgba(0, 0, 0, 0.06);
        position: absolute;
        top: 23px;
        left: -5px;
        border-radius: 5px;
        transition-duration : 0.5s;
        text-align: center;
        line-height: 205px;
        font-size: 30px;
        font-weight: 900;
        color: rgb(247, 247, 247);
    }
    .black-box:hover{
        background-color: rgba(0, 0, 0, 0.3);
        
    }
    .close-icon:hover{
        background-color: rgba(194, 194, 194, 0.3);
        
    }
</style>
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
				
                    <div class="wishList-wrapper">

                        <div class="wishList-title">
                            <a href="/" class="material-symbols-outlined">arrow_back_ios</a>
                            <div>관심상품</div>
                        </div>

                        <div class="wishList-content">

                            <div class="wishList-category">
                                <div>전체 (<span>${allWishListCount }</span>)</div>
                                <div>강습 (<span>${lessonWishListCount }</span>)</div>
                                <div>숙박 (<span>${houseWishListCount }</span>)</div>
                            </div>
                            <div class="line"></div>
                            
                            <div class="wishList-list">
                                <div class="all-wishList">
                                    <c:forEach items="${allWishList }" var="w">
                                    	<c:choose>
                                    		<c:when test="${w.houseNo ne 0}">
	                                        <div class="wishList-box">
                                                <c:if test="${w.houseStatus eq 0}">
                                                <div class="black-box"></div>
                                                </c:if>
	                                            <div class="wishList-box-top">
	                                                <div>
	                                                    <div class="product-title"><a href="#">${w.houseTitle }</a></div>
	                                                    <div class="material-symbols-outlined close-icon">close</div>
	                                                    <input type="hidden" value="${w.wishNo }">
                                                    	<input type="hidden" value="${sessionScope.m.memberId }">
	                                                </div>
	                                                <div><span class="product-name">숙박</span> | <span class="location">${w.houseCity }</span></div>
	                                            </div>
	                                            <div class="wishList-box-bottom">
	                                                <div><img src="resources/upload/house/${w.housePhoto1 }" class="product-img"></div>
	                                                <div class="wishList-box-detail">
	                                                    <div><a href="#">${w.roomTitle }</a></div>
	                                                    <div><span>${w.houseDescription}</span></div>
	                                                    <div>객실인원 <span>${w.roomCapa }</span>명</div>
	                                                    <div class="product-price"><span><fmt:formatNumber value="${w.housePrice }" pattern="#,###" /></span>원</div>
	                                                </div>
	                                            </div>
	                                        </div>
                                    		</c:when>
                                    		<c:when test="${w.lessonNo ne 0}">
 											<div class="wishList-box">
                                                <c:if test="${w.lessonStatus eq 0}">
                                                <div class="black-box"></div>
                                                </c:if>
	                                            <div class="wishList-box-top">
	                                                <div>
	                                                    <div class="product-title"><a href="#">${w.lessonTitle }</a></div>
	                                                    <div class="material-symbols-outlined close-icon">close</div>
	                                                    <input type="hidden" value="${w.wishNo }">
                                                    	<input type="hidden" value="${sessionScope.m.memberId }">
	                                                </div>
	                                                <div><span class="product-name">강습</span> | <span class="location">${w.lessonCity }</span></div>
	                                            </div>
	                                            <div class="wishList-box-bottom">
	                                           		<div><img src="resources/upload/lesson/${w.lessonInfoPic }" class="product-img"></div>
	
	                                                <div class="wishList-box-detail">
	                                                    <div><a href="#">Level ${w.lessonNameLevel }</a></div>
	                                                    <div><span>강습시간 ${w.lessonStartTime }</span> ~ <span>${w.lessonEndTime }</span></div>
	                                                    <div>모집인원 <span>${w.lessonMaxNo }</span>명</div>
	                                                    <div class="product-price"><span><fmt:formatNumber value="${w.lessonPrice }" pattern="#,###" /></span>원</div>
	                                                </div>
	                                            </div>
                                        	</div>
                                    		</c:when>
                                    	</c:choose>
                                    </c:forEach>
                                </div>

                                <div class="lesson-wishList">
                                	<c:forEach items="${lessonWishList }" var="lw">
                                	   <div class="wishList-box">
                                            <c:if test="${lw.lessonStatus eq 0}">
                                            <div class="black-box"></div>
                                            </c:if>
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">${lw.lessonTitle }</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                    <input type="hidden" value="${lw.wishNo }">
                                                    <input type="hidden" value="${sessionScope.m.memberId }">
                                                </div>
                                                <div><span class="product-name">강습</span> | <span class="location">${lw.lessonCity }</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                           		<div><img src="resources/upload/lesson/${lw.lessonInfoPic }" class="product-img"></div>

                                                <div class="wishList-box-detail">
                                                    <div><a href="#">${lw.lessonNameLevel }</a></div>
                                                    <div><span>강습시간 ${lw.lessonStartTime }</span> ~ <span>${lw.lessonEndTime }</span></div>
                                                    <div>모집인원 <span>${lw.lessonMaxNo }</span>명</div>
                                                    <div class="product-price"><span><fmt:formatNumber value="${lw.lessonPrice }" pattern="#,###" /></span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                	</c:forEach>
                                </div>

                                <div class="house-wishList">
                                	<c:forEach items="${houseWishList }" var="hw">
                                        <div class="wishList-box">
                                            <c:if test="${hw.houseStatus eq 0}">
                                            <div class="black-box"></div>
                                            </c:if>
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">${hw.houseTitle }</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                    <input type="hidden" value="${hw.wishNo }">
                                                    <input type="hidden" value="${sessionScope.m.memberId }">
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">${hw.houseCity }</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div><img src="resources/upload/house/${hw.housePhoto1 }" class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a href="#">${hw.roomTitle }</a></div>
                                                    <div><span>${hw.houseDescription}</span></div>
                                                    <div>객실인원 <span>${hw.roomCapa }</span>명</div>
                                                    <div class="product-price"><span><fmt:formatNumber value="${hw.housePrice }" pattern="#,###" /></span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>

				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
</body>
<script>
	/*탭별 조회*/	
	$(".wishList-category>div").click(function(){
	    $(".wishList-list>div").hide();
	    $(".wishList-content>.line").removeClass("active-line1");
	    $(".wishList-content>.line").removeClass("active-line2");
	    $(".wishList-content>.line").removeClass("active-line3");
	
	    const num = $(this).index();
	    
	    if(num == 0) {
	        $(".wishList-content>.line").addClass("active-line1");
	        $(".wishList-list>div").eq(num).show();
	    } else if(num == 1) {
	        $(".wishList-content>.line").addClass("active-line2");
	        $(".wishList-list>div").eq(num).show();
	    } else if(num == 2) {
	        $(".wishList-content>.line").addClass("active-line3");
	        $(".wishList-list>div").eq(num).show();
	    }
	
	});
	
	$(".wishList-category>div").eq(0).click(); //[전체] 클릭
	
	/*관심상품 삭제*/
	$(".close-icon").on("click",function(){
		const wishNo = $(this).next().val();
		const memberId = $(this).next().next().val();
		
		console.log(wishNo);
		console.log(memberId);

		location.href = "/deleteWishList.do?wishNo="+wishNo+"&memberId="+memberId;
	});

    $(".black-box").hover(function(){
        $(this).text("판매중지");
        $(this).css("cursor","default");
    }, function() {
        $(this).text("");
    });
    
</script>
</html>