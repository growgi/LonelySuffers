<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<style>

.admin-content>div{
    margin-left: 100px;
    margin-top: 50px;
    margin-bottom: 150px;
}

 .bold{
        font-weight: 900;
    }

    .orderDetail-info, .orderDetail-product, .pay-info{
        border-top: 1px solid rgb(245, 245, 245);
    }

    .orderDetail-title{
        display: flex;
        padding-bottom: 10px;
        margin-bottom: 50px;
        border-bottom: 2px solid rgb(223, 223, 223);
        align-items: center;
        
    }
    .orderDetail-title>a {
        font-size: 18px;
        font-weight: 900;
    }
    .orderDetail-title>div{
        font-size: 18px;
    }
    .orderDetail-info{
        padding: 30px;
        box-sizing: border-box;
        margin-bottom: 20px;
        box-shadow: 1px 2px 2px 2px rgba(231, 231, 231, 0.19), 1px 2px 2px 2px rgba(214, 214, 214, 0.23);
    }
    .orderDetail-info span{
        font-weight: 400;
    }
    .orderDetail-info>div:first-child{
        display: flex;
        justify-content: space-between;
        margin-bottom: 5px;
    }
    .orderDetail-info>div:last-child, .orderDetail-info>div>span{
        font-size: 14px;
    }

    /*주문상품 리스트*/
    .orderDetail-product{
        padding: 30px;
        margin-bottom: 20px;
        box-shadow: 1px 2px 2px 2px rgba(231, 231, 231, 0.19), 1px 2px 2px 2px rgba(214, 214, 214, 0.23);
    }
    .product-box{
        padding-bottom: 20px;
        border-bottom: 2px solid rgb(223, 223, 223);
        margin-top: 30px;
    }
    .product-box-top{
        margin-bottom: 10px;
    }
    .product-title{
        font-size: 20px;
    }
    .product-img{
        width: 100px;
        height: 110px;
        background-color: blue;
        margin-right: 10px;
    }
    .product-box-bottom{
        display: flex;
    }
    .product-name{
        font-size: 18px;
    }
    .product-info>div:nth-child(2)>span{
        font-size: 14px;
    }
    .product-box-bottom>div:last-child{
        width: 90%;
    }
    .product-box-bottom>div>div:last-child{
        text-align: right;
    }
    .product-price{
        font-size: 18px;
    }

    /*결제정보*/
    .pay-info{
        padding: 30px;
        display: flex;
        justify-content: space-between;
        box-shadow: 1px 2px 2px 2px rgba(231, 231, 231, 0.19), 1px 2px 2px 2px rgba(214, 214, 214, 0.23);
    }
    .pay-info>div>:last-child{
        font-size: 18px;
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
 			<div class="orderDetail-wrapper admin-content">
        <div style="width:75%;">
            <div class="orderDetail-title">
                <a href="/myPage.do?reqPage=1&tabNo=1" class="material-symbols-outlined">arrow_back_ios</a>
                <div class="bold">주문 상세</div>
            </div>
            <div class="orderDetail-info">
                <div>
                    <div class="bold">주문번호 <span class="order-no">${orderDetailInfo.orderNo }</span></div>
                    <div class="bold">아이디 <span class="member-id">${orderDetailInfo.memberId }</span></div>
                </div>
                <div class="bold">주문날짜 <span class="order-date">${orderDetailInfo.orderDate }</span></div>
            </div>
            <div class="orderDetail-product">
                <div class="product-count bold">주문상품 <span>${orderDetailCount }</span>개</div>
                <div class="orderDetail-product-list">
                	<c:forEach items="${orderDetailList }" var="od">
                	<c:choose>
                		<c:when test="${od.lessonNo ne 0}"> <!-- no는 int이기 때문에 null이 아닌 0으로 비교 -->
                		<div class="product-box">
	                        <div class="product-box-top">
	                            <div class="product-title bold">${od.lessonTitle }</div>
	                            <div><span class="product-type">강습</span> | <span class="product-location">${od.lessonCity }</span></div>
	                        </div>
	                        <div class="product-box-bottom">
	                            <div><img src="resources/upload/lesson/${od.lessonInfoPic }" class="product-img"></div>
	                            <div>
	                                <div class="product-info">
	                                    <div class="product-name bold">Level ${od.lessonNameLevel }</div>
	                                    <div><span class="product-start-time">${od.lessonStartTime }</span> ~ <span class="product-end-time">${od.lessonEndTime }</span></div>
	                                    <div class="product-etc">강사명 : <span class="product-etc-val">${od.lessonTeacher }</span></div>
	                                </div>
	                                <div>
	                                    <div>${od.orderStatusString }</div>
	                                    <div class="bold"><span class="product-price"><fmt:formatNumber value="${od.lessonBookPrice }" pattern="#,###" /></span>원</div>
	                                </div>
	                            </div>
	                        </div>
                    	</div>
                		</c:when>
                		<c:when test="${od.houseNo ne 0}">
                		<div class="product-box">
	                        <div class="product-box-top">
	                            <div class="product-title bold">${od.houseTitle }</div>
	                            <div><span class="product-type">숙박</span> | <span class="product-location">${od.houseCity }</span></div>
	                        </div>
	                        <div class="product-box-bottom">
	                            <div><img src="resources/upload/house/${od.housePhoto1 }" class="product-img"></div>
	                            <div>
	                                <div class="product-info">
	                                    <div class="product-name bold">${od.roomTitle }</div>
	                                    <div><span class="product-start-time">${od.bookStartDate }</span> ~ <span class="product-end-time">${od.bookEndDate }</span></div>
	                                    <div class="product-etc">판매자 : <span class="product-etc-val">${od.houseWriter }</span></div>
	                                </div>
	                                <div>
	                                    <div>${od.orderStatusString }</div>
	                                    <div class="bold"><span class="product-price"><fmt:formatNumber value="${od.roomBookPrice }" pattern="#,###" /></span>원</div>
	                                </div>
	                            </div>
	                        </div>
                    	</div>
                		</c:when>
                		</c:choose>
                    </c:forEach>
                </div>
            </div>
            <div class="pay-info bold">
                <div>결제 정보</div>
                <div>총 <span class="all-price"><fmt:formatNumber value="${orderDetailInfo.orderAllPrice }" pattern="#,###" /></span>원</div>
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
	<script src="resources/js/loginFrm.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
