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
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>wishList - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
</head>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<style>
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
        /*border-bottom: 2px solid rgb(226, 226, 226);*/
        width: 555px;
        padding: 30px 10px 10px 10px;
        position: relative;
        display:inline-block;
    }
    .close-icon{
        position: absolute;
        top: 30px;
        right: 10px;
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
        padding-bottom: 13px;
        border-bottom: 2px solid rgb(226, 226, 226);
    }
    .wishList-box-bottom>.product-img{
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
                                <div>전체 (<span>4</span>)</div>
                                <div>강습 (<span>2</span>)</div>
                                <div>숙박 (<span>2</span>)</div>
                            </div>
                            <div class="line"></div>
                            
                            <div class="wishList-list">
                                <div class="all-wishList">
                                    <c:forEach items="${wishList }" var="w">
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">1가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <a href="/deleteWishList.do?memberId=${sessionScope.m.memberId }&wishNo=${wishNo}" class="material-symbols-outlined close-icon">close</a>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                    	
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                </div>

                                <div class="lesson-wishList">
                                	<c:forEach items="${wishList }" var="w">
                                	   <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">${w.lessonTitle }</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">강습</span> | <span class="location">${w.lessonCity }</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">${w.lessonNameLevel }</a></div>
                                                    <div><span>${w.lessonStartTime }</span> ~ <span>${w.lessonEndTime }</span></div>
                                                    <div>모집인원 <span>${w.lessonMaxNo }</span>명</div>
                                                    <div class="product-price"><span>${w.lessonPrice }</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                	</c:forEach>
                                </div>

                                <div class="house-wishList">
                                    <div class="wishList-box-wrap">
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">3가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wishList-box">
                                            <div class="wishList-box-top">
                                                <div>
                                                    <div class="product-title"><a href="#">가격 실화? 멋지다 짜잔호텔</a></div>
                                                    <div class="material-symbols-outlined close-icon">close</div>
                                                </div>
                                                <div><span class="product-name">숙박</span> | <span class="location">강원도 양양군 그 어딘가</span></div>
                                            </div>
                                            <div class="wishList-box-bottom">
                                                <div class="product-img"></div>
                                                <div class="wishList-box-detail">
                                                    <div><a ref="#">짜잔호텔</a></div>
                                                    <div><span>2023-03-12</span> ~ <span>2023-03-13</span></div>
                                                    <div>객실인원 <span>4</span>명</div>
                                                    <div class="product-price"><span>200,000</span>원</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
</body>
<script>
    $(".wishList-category>div").on("click",function(){
        $(".wishList-content>.line").removeClass("active-line1");
        $(".wishList-content>.line").removeClass("active-line2");
        $(".wishList-content>.line").removeClass("active-line3");

        const num = $(".wishList-category>div").index($(this));

        $(".wishList-list>div").hide();

        if(num == 0) {
            $(".wishList-content>.line").addClass("active-line1");
        } else if(num == 1) {
            $(".wishList-content>.line").addClass("active-line2");
        } else if(num == 2) {
            $(".wishList-content>.line").addClass("active-line3");
        }

        $(".wishList-list>div").eq(num).show();
    });
</script>
</html>