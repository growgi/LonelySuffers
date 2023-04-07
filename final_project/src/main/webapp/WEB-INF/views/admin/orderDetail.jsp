<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/adminTable.css"></link>
<style>
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
        width: 100%;
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
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="orderDetail-wrapper admin-content">
        <div>
            <div class="orderDetail-title">
                <a href="/salesDetails.do" class="material-symbols-outlined">arrow_back_ios</a>
                <div class="bold">주문 상세</div>
            </div>
            <div class="orderDetail-info">
                <div>
                    <div class="bold">주문번호 <span class="order-no">4</span></div>
                    <div class="bold">아이디 <span class="member-id">hong123</span></div>
                </div>
                <div class="bold">주문날짜 <span class="order-date">2023-03-12</span></div>
            </div>
            <div class="orderDetail-product">
                <div class="produtc-count bold">주문상품 <span>3</span>개</div>
                <div class="orderDetail-product-list">
                    <div class="product-box">
                        <div class="product-box-top">
                            <div class="product-title bold">개쉬운 서핑! 너도 하자</div>
                            <div><span class="product-type">강습</span> | <span class="product-location">강원도 양양군 그 어딘가</span></div>
                        </div>
                        <div class="product-box-bottom">
                            <div class="product-img"></div>
                            <div>
                                <div class="product-info">
                                    <div class="product-name bold">Level 1</div>
                                    <div><span class="product-start-time">2023-03-12</span> ~ <span class="product-end-time">2023-03-13</span></div>
                                    <div class="product-etc">강사명 : <span class="product-etc-val">홍길동</span></div>
                                </div>
                                <div>
                                    <div>결제완료</div>
                                    <div class="bold"><span class="product-price">200,000</span>원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-box-top">
                            <div class="product-title bold">개쉬운 서핑! 너도 하자</div>
                            <div><span class="product-type">강습</span> | <span class="product-location">강원도 양양군 그 어딘가</span></div>
                        </div>
                        <div class="product-box-bottom">
                            <div class="product-img"></div>
                            <div>
                                <div class="product-info">
                                    <div class="product-name bold">Level 1</div>
                                    <div><span class="product-start-time">2023-03-12</span> ~ <span class="product-end-time">2023-03-13</span></div>
                                    <div class="product-etc">강사명 : <span class="product-etc-val">홍길동</span></div>
                                </div>
                                <div>
                                    <div>결제완료</div>
                                    <div class="bold"><span class="product-price">200,000</span>원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pay-info bold">
                <div>결제 정보</div>
                <div>총 <span class="all-price">600,000</span>원</div>
            </div>
        </div>
    </div>
    <script src="js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(document).ready(function(){
        $(".top-menu-title").text("판매 내역");
        $(".product-choice>div").first().click();
    });

</script>
</html>