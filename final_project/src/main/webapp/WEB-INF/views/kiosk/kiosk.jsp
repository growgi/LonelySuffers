<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디로 떠나볼까요? - Lonely Surfers</title>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
	*{
		margin:0;
		padding:0;
	}
	::-webkit-scrollbar {
    width: 10px;
    
	}
	::-webkit-scrollbar-thumb {
	    background-color: #000000;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	
	}
	::-webkit-scrollbar-track {
	    background-color: white;
	}
	.modal{
	z-index:1200 !important;
	}
	.modal-content{
	overflow-y: initial !important;
	}
	.modal-body{
	height: 700px;
	overflow-y: auto;
	}
	.fade.in{
	z-index:1180;
	}
	.modal-dialog {
    position: absolute !important;
    top: 1.5%;
    left: 20%;
    transform: translate(-50%, -50%);
    margin: 0 auto !important;
    }
	
	.modal-content{
	width: 1200px;
	margin-right:180px;
	}
	h4.modal-title {
    text-align: center;
	}
	.modal-open .modal {
    width: 1500px;
   	}
   	#myModal, #lessonModal{
   	overflow-y: hidden;
   	}
   	div#bookingArea {
    width: 800px;
    margin-left: 200px;
    margin-top: 69px;
	}
	div#lessonBookModalContent{
	width: 800px;
    margin-left: 200px;
    margin-top: 69px;
	}
	
	.product-info{
	margin-top:15px;
	}
	.clickToLarger {
	width: 80px;
	height: 80px;
	}
	.clickToLarger:hover { cursor: pointer; }
	.onViewing { border: 4px solid #3ac5c8; }
	.product-detail>div{
		margin-top:20px;
		margin-bottom:20px;
	}
	.nav-item { background-color: #3ac5c8;}
	.nav-link { color: #ffffff; }
	
	#roomNo-modal{
	height:30px;
	margin-bottom:5px;
	}
	select[name=modal-option]{
	height:30px;
	margin-top:5px;
	margin-top:5px;
	margin-left:15px;
	}
	#booking-modal{
	height:150px;
	}
	#modal-okay, #modal-cancel, #modal-okay2, #modal-cancel2{
	width:70px;
	
	}
	#modal-okay{
	margin-right:15px;
	}
	
	#daterangepicker{
	width:596px;
	height:80px;
	font-size:30px;
	text-align:center;
	margin-left:300px;
	border: 2px solid;
	border-radius:15px;
	font-weight:800;
	}
	
	#travel-days{
	width:396px;
	height:60px;
	font-size:25px;
	text-align:center;
	margin-left:400px;
	margin-top: 80px;
	border: 2px solid;
	border-radius:10px;
	font-weight:800;
	}
	
	
	.content-wrapper{
		width:1200px;
		overflow:hidden;
	}
	.title-wrapper{
		width:1200px;
		margin: 0 auto;
		text-align:center;
	
	}
	.title-wrapper>img{
		width:70px;
		height:70px;
		vertical-align: text-bottom;
	}
	.title{
		text-align:center;
		font-size:50px;
		font-weight:bold;
		color:rgb(51, 51, 51);
		width:1000px;
		height:100px;
		line-height:300%;
	}
	.money-wrapper{
		width:1200px;
		height: 100px;
		overflow:hidden;
	}
	.money-emoji{
		width:50px;
		height:50px;
		margin-top:25px;
		margin-right:5px;
		float:right;
	}
	.money{
		font-size:30px;
		font-weight:400;
		float:right;
		margin-right:50px;
		line-height:100px;
		color:rgb(51, 51, 51);
	}
	.map-wrapper{
		width: 1000px;
		
	}
	
	.scroll-wrapper{
		position:relative;
		float:right;
		width:300px;
		z-index: 2;
	}
	#scroll{
		position:absolute;
		top:0px;
		left:0px;
		overflow:hidden;
	}
	
	.circle-wrap{
		width: 1200px;
		height: 1300px;
		margin-right:100px;
		padding-top:50px;
	}
	.circle{
		background-repeat: no-repeat;
		background-size: 930px 930px;
		margin-left: 30px;
	}
	.map{
		width:550px;
		height:1000px;
		margin-left: 285px;
		padding-top: 65px
	}
	.location-info{
		width:1200px;
	}
	#travel-location{
		width:396px;
		height:60px;
		font-size:25px;
		text-align:center;
		margin-left:85px;
		margin-top: 300px;
		border: 2px solid;
		border-radius:10px;
		font-weight:800;
	}
	.calendar-wrap{
		width:1200px;
		height:600px;
	}
	#daterangepicker{
		margin-top:50px;
	}
	.headcount-wrap{
		width:1200px;
		height:800px;
		margin-top: 50px;
		overflow:hidden;
	}
	#headcount{
		width:596px;
		height:80px;
		font-size:30px;
		text-align:center;
		margin-left:300px;
		border: 2px solid;
		border-radius:15px;
		font-weight:800;
	}
	#whole-people{
		width:396px;
		height:60px;
		font-size:25px;
		text-align:center;
		margin-left:400px;
		margin-top: 80px;
		border: 2px solid;
		border-radius:10px;
		font-weight:800;
	}
	.option-select{
		width:1200px;
		margin-top:50px;
		margin-bottom:50px;
	}
	.rooms-wrap{
		width:1200px;
		overflow:hidden;
		margin-top:50px;
		margin-bottom:50px;
	}
	.roomList{
		width:390px;
		height:382px;
		float:left;
		box-sizing:border-box;
		margin:5px;
		padding:5px;
	}
	.roomList:hover{
		box-shadow: 1px 1px 14px rgba(0,0,0,0.4);
	}
	.image-wrap{
		height: 220px;
		margin-bottom: 20px;
		overflow: clip;
	}
	.roomImage{
		width: 100%;
	}
	.info-wrap{
		height:100px;
		border-top-style:none
	}
	.info-wrap>p{
		text-align:center;
		font-weight:800;
		color:rgb(51, 51, 51);
		margin-bottom:5px;
	}
	.level-select{
		width:1200px;
		overflow:hidden;
		margin-top:50px;
		margin-bottom:50px;
	}
	.level-select>div{
		width:400px;
		float:left;
	}
	.level-select img{
		width:300px;
		height:300px;
		margin-left:50px;

	}
	.lessons-wrap{
		width:1200px;
		overflow:hidden;
		margin-top:50px;
		margin-bottom:50px;
	}
	.lessonList{
		width:390px;
		height:382px;
		float:left;
		box-sizing:border-box;
		margin:5px;
		padding:5px;
	}
	.lessonList:hover{
		box-shadow: 1px 1px 14px rgba(0,0,0,0.4);
	}
	.lessonImage{
		width: 100%;
	}
	.boxes{
		margin-left:50px;
		margin-top:20px;
		overflow:hidden;
	}
	.level-name{
		float:left;
		margin-left:20px;
	}
	.level-name>p{
		font-size:24px;
		font-weight:bold;
		color:rgb(51, 51, 51);
	}
	input[type="checkbox"]{
        display: none;
      }
	input[type="checkbox"] + label{
        display: inline-block;
        width: 30px;
        height: 30px;
        border:3px solid #707070;
        position: relative;
        float:left;
      }
	input[id="level1"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="level2"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="level3"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
    .option-select{
		width:1200px;
		overflow:hidden;
	}
	.option-select>div{
		width:400px;
		float:left;
		margin-left: calc(400px/3);
	}  
    .option-select img{
		width:300px;
		height:300px;
		margin-left:50px;
	}
	
	input[id="barbecue"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
     input[id="party"]:checked + label::after{
        content:'✔';
        font-size: 25px;
        width: 30px;
        height: 30px;
        text-align: center;
        color:#d4683d;
        position: absolute;
        left: 0;
        top:0;
      }
    .option-name{
		float:left;
		margin-left:20px;
	}
	.option-name>p{
		font-size:24px;
		font-weight:bold;
		color:rgb(51, 51, 51);
	}
	.receipt-wrap{
	margin-top:50px;
	margin-bottom:50px;
	}
	.receipt-wrap li{
		list-style:none;

	}
	.receipt-wrap input{
		border:none;
	}
	.btn-wrap{
		width:1200px;
		margin-top:15px;
		margin-bottom:15px;
	}
	.btn-wrap>button{
		width:196px;
		height:60px;
		border-radius:5px;
		border: 2px solid #3da9d4;
		margin-left:145px;
		background-color:#fff;
	}
	.btn-wrap p{
		font-weight: 600px;
		font-size:20px;
		margin-top:15px;
		color:rgb(51, 51, 51);
	}
	.shaka{
		margin-left:344px;
		margin-top:50px;
		margin-bottom:50px;
	}
	.nav-item:hover {
		cursor: not-allowed;
	}
	.nav-link:hover {
		cursor: not-allowed;
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
        margin-left: 260px;
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
        margin-bottom: 50px;
        margin-left:265px;
        box-shadow: 1px 2px 2px 2px rgba(231, 231, 231, 0.19), 1px 2px 2px 2px rgba(214, 214, 214, 0.23);
    }
    .orderDetail-info span{
        font-weight: 400;
    }
    .orderDetail-info>div:first-child{
        justify-content: space-between;
        margin-bottom: 20px;
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
    .orderDetail-product>div{
    	margin-bottom:5px;
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
    
    /*키오스크 리뷰 css*/
    .reviewListView{
	    background-color: #3ac5c8;
	    color: #fff;
	    text-align: center;
	}
	
	.reviewListView> th{
	    border: none;
	    text-align: center;
	    font-weight: bold;
	    padding-bottom: 10px;
	    padding-top: 10px;
	}
	.reviewListView> th:first-child{
	    border-top-left-radius: 5px;
	
	}
	.reviewListView> th:last-child{
	    border-top-right-radius: 5px;
	}
	
	.reviewModalContent{
	    border-bottom: 1px solid #006bd6;
	}
	
	.reviewModalContent>td{
	    padding: 5px;
	}
	
	.reviewModalBtn{
	    margin-top: 10px;
	    margin-bottom: 10px;
	}
	
	.container1 {
	    max-height: 300px; /* 초기 높이값 */
	    overflow: hidden;
	    position: relative;
	    height: 100%;
	}
	
	
	.show-more {
	    position: absolute;
	    bottom: 0;
	    left: 0;
	    width: 840px;
	    background-color: #fff;
	    padding: 10px;
	    cursor: pointer;
	}
	
	.show-more::before {
	    content: '▼';
	    display: inline-block;
	    margin-right: 5px;
	    transform: rotate(0deg);
	    transition: transform 0.3s ease-in-out;
	}
	
	.container1.show-more-open .show-more::before {
	    transform: rotate(180deg);
	}
	
	.container1.show-more-open {
	    max-height: 100%;
	}
	
	.trans5:hover{
	    transform: scale(3, 3);
	}
</style>
<!-- naver map -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=osh0s8np34&submodules=geocoder" ></script>
<script src="resources/js/MarkerClustering.js"></script>
<!-- daterangepicker -->
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<section class="section">
		<!-- 스크롤 메뉴 -->
				<div class="scroll-wrapper">  
       				 <div id="scroll">
       				 	<span class="money"><span class="stat-count">0</span>원</span>
           				<img class="money-emoji" src="/resources/images/won.png">
           				<input type="hidden" id="current-page" value="1">
           				<input type="hidden" class="memberName" value="${sessionScope.m.memberName }">
           				<input type="hidden" class="memberPhone" value="${sessionScope.m.memberPhone }">
           				<input type="hidden" class="memberEmail" value="${sessionScope.m.memberEmail }">
           				<input type="hidden" class="memberNo" value="${sessionScope.m.memberNo }">
        			</div>  
				</div> 
		<div class="container">
			<!-- 키오스크 1페이지 -->
			<div class="content-wrapper">
				<div class="title-wrapper">
					<img src="/resources/images/wave.png">	
					<img src="/resources/images/palm-tree.png" style="margin-right: 10px">
					<span class="title">어디로 떠나볼까요?</span>
					<img src="/resources/images/palm-tree.png" style="margin-left: 10px">
					<img src="/resources/images/wave.png">
					<div class="values-wrapper">
						
					</div>
				</div>
				
				<!-- 돋보기 모양으로 해보기 -->
				<div class="pages page1">
					<div class="map-wrapper">
						<div class="row">
							<div class="col-md-8">
								<div class="circle-wrap">
									<div class="circle" style="background-image:url(/resources/images/magnify.png)">
										<div class="map">
											<div id="map" style="width:580px;height:580px;border-radius:50%;"></div>
											<input type="text" id="travel-location" value="원하시는 지역을 클릭해주세요"readonly>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
					</div>
					<div class="btn-wrap" id="page1">
						<button class="page1-before" onClick="location.href='/'"><p>메인으로</p></button>
						<button class="page1-okay"><p>확정</p></button>
						<button class="page1-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 1페이지 종료 -->
				<!-- 키오스크 2페이지 -->
				<div class="pages page2">
					<div class="calendar-wrap">
						<div>
						<input type="text" id="daterangepicker" name="daterangepicker" readonly>
						</div>
						<div>
						<input type="text" id="travel-days" value="0박 0일"readonly>
						<!-- hidden으로 숨겨놓았다가 나중에 쓸 값 -->
						<input type="hidden" id="bookStartDate" value="" >
						<input type="hidden" id="bookEndDate" value="" >
						</div>
					</div>
					<div class="btn-wrap" id="page2">
						<button class="page2-before"><p>이전으로</p></button>
						<button class="page2-okay"><p>확정</p></button>
						<button class="page2-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 2페이지 종료 -->
				<!-- 키오스크 3페이지 -->
				<div class="pages page3">
					<div class="headcount-wrap">
						<select id="headcount">
						  <option value="" disabled selected>몇 명이신가요?</option>
						  <option value="1">1명</option>
						  <option value="2">2명</option>
						  <option value="3">3명</option>
						  <option value="4">4명</option>
						  <option value="5">5명</option>
						  <option value="6">6명</option>
						  <option value="7">7명</option>
						  <option value="8">8명</option>
						</select>
					<input type="text" id="whole-people" value="총 0명 입니다"readonly>
					<!-- 진짜 총원 인원을 킵하고 있는 부분 -->
					<input type="hidden" id="people-value" value="">
						<div class="head-icon-wrap">
						</div>
					</div>
					<div class="btn-wrap" id="page3">
						<button class="page3-before"><p>이전으로</p></button>
						<button class="page3-okay"><p>확정</p></button>
						<button class="page3-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 3페이지 종료 -->
				<!-- 키오스크 4페이지(숙소 옵션을 미리 선택) -->
				<div class="pages page4">
					<div class="option-select">
						<div class="barbecue">
							<div>
							<img src="/resources/images/barbecue.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="barbecue" value="barbecue">
								<label for="barbecue"></label>
								<div class="option-name"><p>바베큐</p></div>
							</div>
							<input type="hidden" id="barbecue-choice" value="0">
						</div>
						<div class="party">
							<div>
								<img src="/resources/images/party.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="party" value="party">
								<label for="party"></label>
								<div class="option-name"><p>파티</p></div>
							</div>
							<input type="hidden" id="party-choice" value="0">
						</div>
					</div>
					<div class="btn-wrap" id="page4">
						<button class="page4-before"><p>이전으로</p></button>
						<button class="page4-okay"><p>확정</p></button>
						<button class="page4-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 4페이지 종료 -->
				<!-- 키오스크 5페이지 숙소리스트 -->
				<div class="pages page5">
					<div class="rooms-wrap">
					
					</div>
					
					<div class="btn-wrap" id="page5">
						<button class="page5-before"><p>이전으로</p></button>
						<button class="page5-okay"><p>확정</p></button>
						<button class="page5-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 5페이지 숙소리스트 종료-->
				<!-- 키오스크 6페이지 -->
				<div class="pages page6">
					<div class="level-select">
					<!-- 중복선택이 가능하게 -->
						<div class="level1">
							<div>
							<img src="/resources/images/level1.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level1" value="1">
								<label for="level1"></label>
								<div class="level-name"><p>초급</p></div>
								<input type="hidden" id="level1-choice" value="0">
							</div>
						</div>
						<div class="level2">
							<div>
								<img src="/resources/images/level2.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level2" value="2">
								<label for="level2"></label>
								<div class="level-name"><p>중급</p></div>
								<input type="hidden" id="level2-choice" value="0">
							</div>
						</div>
						<div class="level3">
							<div>
							<img src="/resources/images/level3.png">
							</div>
							<div class="boxes">
								<input type="checkbox" id="level3" value="3">
								<label for="level3"></label>
								<div class="level-name"><p>상급</p></div>
								<input type="hidden" id="level3-choice" value="0">
							</div>
						</div>
					</div>
					<div class="btn-wrap" id="page6">
						<button class="page6-before"><p>이전으로</p></button>
						<button class="page6-okay"><p>확정</p></button>
						<button class="page6-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 6페이지 종료-->
				<!-- 키오스크 7페이지 강습리스트 -->
				<div class="pages page7">
					<div class="lessons-wrap">
						
					</div>
					<div class="btn-wrap" id="page7">
						<button class="page7-before"><p>이전으로</p></button>
						<button class="page7-okay"><p>확정</p></button>
						<button class="page7-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- 키오스크 7페이지 강습리스트 종료-->
				<!-- 키오스크 8페이지 -->
				<div class="pages page8">
					<div class="receipt-wrap">
						<form action="#" class="receipt-submit">
									
									<input type="text" id="roomTotalPrice" value="" hidden>
									<input type="text" id="options-choice" value="" hidden>
									<input type="text" id="lessonPeople-choice" value="" hidden>
									<input type="text" id="lessonTotalPrice" value="" hidden>
									<input type="text" id="totalPriceVal" value="" hidden>
									<input type="text" id="roomBookNo" value="0" hidden>
									<input type="text" id="lessonBookNo" value="" hidden>
									<input type="text" id="orderNo" value="" hidden>
									<input type="text" id="orderDetailNo" value="" hidden>
									<input type="text" id="totalPrice-choice" value="" hidden>
						</form>
					<!-- 영수증 테스트 -->
					 <div class="orderDetail-wrapper admin-content">
        <div style="width:75%;">
            <div class="orderDetail-title">
                <div class="bold orderTitle">주문 내역</div>
            </div>
            <div class="orderDetail-info">
            	<div class="orderDetail-product">
            	<div>
            		 <div class="bold" style="font-size:23px; margin-bottom:30px;">숙박주문내역</div>
            	</div>
                <div>
                    <div class="bold">숙소정보 : <span class="houseTitle-choice"></span></div>
                </div>
                <div>
                    <div class="bold">이름(호수) : <span class="roomTitleNo-choice"></span></div>
                </div>
                <div>    
                    <div class="bold">숙소옵션 : <span class="options-choice"></span></div>
                </div>
                 <div>    
                    <div class="bold">숙박날짜 : <span class="bookDate-choice"></span></div>
                </div>
                <div>    
                    <div class="bold">숙박총액 : <span class="roomTotalPrice-choice"></span></div>
                </div>
            	</div>
            	<div class="orderDetail-product">
            	<div>
            		 <div class="bold" style="font-size:23px; margin-bottom:30px;">강습주문내역</div>
            	</div>
                <div>
                    <div class="bold">강습명 : <span class="lessonTitle-choice"></span></div>
                </div>
                <div>
                    <div class="bold">강습날짜 : <span class="lessonDate-choice"></span></div>
                </div>
                <div>    
                    <div class="bold">강습시간 : <span class="lessonTime-choice"></span></div>
                </div>
                <div>    
                    <div class="bold">강습인원 : <span class="lessonMaxNo-choice"></span>
                    </div>
                </div>
                <div>
                    <div class="bold">강습총액 : <span class="lessonTotalPrice-choice"></span>
                    </div>
                </div>
            	</div>
           
            <div class="pay-info bold">
                <div>결제하실 금액</div>
                <div>총 <span class="totalPriceVal"></span>원</div>
            </div>
        </div>
    </div>
					<!-- 영수증 테스트 끝 -->
					</div>
					<div class="btn-wrap" id="page8">
						<button class="page8-before"><p>이전으로</p></button>
						<button class="page8-okay"><p>확정</p></button>
						<button class="page8-pass"><p>건너뛰기</p></button>
					</div>
				</div>
				<!-- receipt wrap 종료 -->
				</div>
				<!-- 키오스크 8페이지 종료 -->
				
			<!-- 기본 버튼랩 양식 
				<div class="btn-wrap">
					<button class="before"><p>이전으로</p></button>
					<button class="okay"><p>확정</p></button>
					<button class="pass"><p>넘어가기</p></button>
				</div>
			 -->
				<!-- 키오스크 9페이지 -->
				<div class="pages page9">
					<div class="last-page">
						<img class="shaka" src="/resources/images/shaka.png">
					</div>
					<div class="btn-wrap" id="page9">
						<button class="page9-before" onClick="location.href='/myPage.do?reqPage=1&tabNo=1'"><p>구매내역</p></button>
						<button class="page9-okay" onClick="location.href='/'"><p>메인으로</p></button>
						<button class="page9-pass" onClick="location.href='/carpoolMain.do'"><p>카풀하기</p></button>
					</div>
				</div>
				<!-- 키오스크 9페이지 종료 -->
			</div><!-- content-wrapper 종료 -->
		</div>
	</section>



		<!-- 숙박 상품 상세보기용 Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" id="roomBook-close"data-dismiss="modal">&times;</button>
						<h4 class="modal-title">숙소 상세정보</h4>
					</div>
					<div class="modal-body">
						<section class="section">
							<div class="container">
								<div class="row">
									<div class="col-md-5">
										<div class="row photo-check"
											style="height: 450px; display: none;">
											<div class="col-md-2"></div>
											<div class="col-md-8">
												<div class="waveEffect" style="margin: 0 auto;">
													<p class="waveEffectWord-back"
														style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
													<p class="waveEffectWord-front"
														style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
												</div>
											</div>
										</div>

										<div style="height: 450px; overflow: clip">
											<img class="bigThumbnailImage" src="" style="width: 100%;">
										</div>
										
										<div class="row">
											<div class="col-md-12">
												<ul class="pagination" style="text-align: center;">
													<li><img class="clickToLarger onViewing photo1" src=""></li></ul>
											</div>
										</div>

									</div>
									<!-- end col -->

									<div class="col-md-1"></div>

									<div class="col-md-6 product-detail">
										<input type="hidden" name="roomTitle" value="">
										<p class="modal-room-title"></p>
										<div class="row">
											<h1 class="modal-house-title" style="padding-bottom: 40px;"></h1>
											<input type="hidden" name="housePrice" value="">
											<h3><span class="modal-house-price" style="font-size: 36px; font-weight: bold;"></span>원/1박</h3>
											<div class="col-md-9">
												<p style="text-indent: 10px;">
													<a href="#" data-toggle="tooltip" data-placement="right" title="주말(입실일 기준 금/토)에는 1.5배의 할증이 있습니다. 성수기(6월~8월)에는 1.2배의 할증이 추가로 붙습니다.">(※ 비성수기 평일 기준 )</a>
												</p>
											</div>
											<div class="col-md-3">
												<input type="hidden" name="roomCapa">
												<p style="text-align: left; font-size: 22px; font-weight: bold">
													<span class="label label-primary modal-house-roomCapa"></span>
												</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5">
												별평점 평균값 들어올 자리
											</div>
											<div class="col-md-1"></div>
											<div class="col-md-3">
												<!-- 판매량 넣을 자리 -->
											</div>
										</div>
										<div class="row" style="margin-top: 30px;">
											<p>주소지 : 
											<span class="modal-house-houseAddress"></span></p>
										</div>
										<div>
											<button type="button" class="btn" data-toggle="modal" data-target="#bookingModal" id="goBooking">예약하기</button>
										</div>
									</div>
									<!-- end col -->
								</div>
								<!-- end row -->
								<hr class="invis">
								<!-- 상품 정보 표시 시작 -->
								<div class="row">
									<div class="col-md-9 card mt-3 tab-card">
										<div class="row tab-card-header">
											<ul class="nav nav-tabs card-header-tabs">
												<li class="nav-item active"><a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">상품설명</a></li>
												<li class="nav-item">
													<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">상품평</a>
												</li>
												<li class="nav-item">
													<a class="nav-link" id="three-tab" data-toggle="tab" href="#three" role="tab" aria-controls="Three" aria-selected="false">상품문의</a>
												</li>
											</ul>
										</div>
										<div class="tab-content" id="myTabContent">
											<div class="tab-pane fade p-3 active in" id="one" role="tabpanel" aria-labelledby="one-tab"></div>
											<div class="tab-pane fade p-3" id="two" role="tabpanel" aria-labelledby="two-tab">
											
<!-- 별점 후기 영역 시작  -->
													
							
							<!--별점 & 후기 리스트 나오는 부분 -->
							<div class="container1">
								<div class="content1">	
									<table class ="review-table" style="width: 845px; margin: 0 auto;">
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
																<a class="reviewModalBtn button-73" href="/deleteReview.do?reviewNo=${review.reviewNo }">삭제</a>
															</c:if>
														</td>
													</tr>
												</c:forEach>
									</table>
									<button class="show-more">더보기</button>
								</div> <!-- content1 닫는 div -->
							</div> <!-- container1 닫는 div -->
							
							

<!-- 별점 후기 영역 끝  -->
											
											
											</div>
										</div>
									</div>
									<div class="col-md-3">
										<div class="panel panel-default">
											<div class="panel-body" style="height: 600px; overflow: clip">
												광고 등 배너 영역<br>높이 600px을 넘는 사진은 종횡비는 고정하되 아래쪽을 잘라서 출력됨
											</div>
										</div>
									</div>
								</div>
								<!-- end row -->
								<!-- 상품 정보 표시 끝 -->
							</div>
							<!-- end container -->
						</section>
						<!-- end section -->

					</div>
					<div class="modal-footer">
						<button type="button" id="closeBtn"class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div><!-- 숙박 상품 상세보기용 Modal 끝 -->



	<!-- 숙박 예약모달 -->
		<div class="row">
		<!-- 예약 진행용 Modal -->
			  <div class="modal fade bd-example-modal-lg" id="bookingModal" role="dialog">
			    <div class="modal-dialog modal-lg">
			    
			      <!-- Modal content-->
			      <div id="bookingArea" class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">예약하기</h4>
			        </div>
			        <div class="modal-body" id="booking-modal">
			        <!--  
			        <form action="/orderRoom.do" onsubmit="return checkOrder();" method="post">
			        -->
			        	<!-- <fieldset> -->
			        	
							<input type="hidden" name="houseNo" value="">
							<select name="roomName" id="roomName-modal">
								<option value="0" selected>객실을 먼저 선택해주세요</option>
							</select>
			        		<div class="row">
				        		<div class="col-md-4">
									<input type="text" name="bookStartDate" id="bookStart" placeholder="숙박 시작일" required readonly>
								</div>
			        			<div class="col-md-2"></div>
			        			<div class="col-md-4">
									<input type="text" name="bookEndDate" id="bookEnd" placeholder="숙박 퇴실일" required readonly>
								</div>
			        		</div>
				        	<div class="row">
				        	<input type="hidden" name="modalOptionPrice1" value="">
				        	<input type="hidden" name="modalOptionPrice2" value="">
				        	<select name="modal-option"></select>
					        	
			        		</div>
							
			       	 <!-- </fieldset> -->	
			       <!-- </form> --> 
			        </div>
			        <div class="modal-footer">
			        <input type="hidden" name="roomBookPrice" value="">
					  <button type="button" class="modal-okay" id="modal-okay" data-dismiss="modal">주문</button>
			          <button type="button" id="modal-cancel" data-dismiss="modal">닫기</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
		</div>
	<!-- 숙박 예약모달 row 끝-->



	<!-- 강습 상세보기용 modal 시작 -->
		<div id="lessonModal" class="modal fade" role="dialog">
			
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" id="lessonBook-close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">강습 상세정보</h4>
		      </div>
		      <div class="modal-body">
				<section class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-5">
								<div class="row lessonPic-check" style="height: 450px;">
									<div class="col-md-2"></div>
									<div class="col-md-8">
										<div class="waveEffect" style="margin: 0 auto;">
											<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
											<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
										</div>
									</div>
								</div>
								<div style="height: 450px; overflow: clip"><img id="modal-lesson-pic" src="" style="width: 100%;"></div>
							</div>
							<!-- end col -->
		
							<div class="col-md-1"></div>
		
							<div class="col-md-6 product-detail">
									<input type="hidden" id="modal-lessonNo" value="">
									<p><span id="modal-lesson-teacher"></span> 강사</p>
									<hr>
									<div class="row">
										<h1 id="modal-lesson-title"></h1>
										<h1 id="modal-lesson-time" style="padding-bottom: 40px;"></h1>
										<input type="hidden" name="lessonPrice" value="">
										<input type="hidden" name="lessonTotalPrice" value="">
										<h3><span id="modal-lesson-price" style="font-size: 36px; font-weight: bold;"></span>원</h3>
										<div class="col-md-6">
										</div>
										<div class="col-md-6">
											<input type="hidden" name="lessonMaxNo">
											<p style="text-align: left; font-size: 22px; font-weight: bold">
											<span id="modal-lesson-level" class="label label-primary"></span>&nbsp;
											<span id="modal-lesson-time" class="label label-info"></span></p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											별평점 평균값 들어올 자리
										</div>
										<div class="col-md-1"></div>
										<div class="col-md-3">
											<!-- 판매량 넣을 자리 -->
										</div>
									</div>
									<p>지역 : <span id="modal-lesson-city"></span></p>
								<div>
									<button type="button" class="btn" data-toggle="modal" data-target="#lessonBookModal" id="goLessonBook">예약하기</button>
								</div>
							</div>
							<!-- end col -->
						</div>
						<!-- end row -->
						<hr class="invis">
						<div class="row">
							<div class="col-md-9 card mt-3 tab-card">
								<div class="row tab-card-header">
									<ul class="nav nav-tabs card-header-tabs">
										<li class="nav-item active">
											<a class="nav-link" id="tab1" data-toggle="tab" href="#modal-lesson-info" role="tab" aria-controls="One" aria-selected="false">상품설명</a>
										</li>
										<li class="nav-item"><a class="nav-link">상품평</a></li>
										<li class="nav-item"><a class="nav-link">상품문의</a></li>
									</ul>
								</div>
								<div class="tab-content" id="lessonTabContent">
									<div class="tab-pane fade p-3 active in" id="modal-lesson-info" role="tabpanel" aria-labelledby="tab1"></div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="panel panel-default">
									<div class="panel-body" style="height: 600px; overflow: clip">광고 등 배너 영역<br>높이 600px을 넘는 사진은 종횡비는 고정하되 아래쪽을 잘라서 출력됨</div>
								</div>
							</div>
						</div><!-- end row -->
					</div>
					<!-- end container -->
				</section>
				<!-- end section -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="closeBtn2" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div><!-- 강습 상세보기용 modal 끝 -->



	<!-- 강습 예약 modal 시작 -->
		<div class="row">
		
			  <div class="modal fade bd-example-modal-lg" id="lessonBookModal" role="dialog">
			    <div class="modal-dialog modal-lg">
			    
			      <!-- Modal content-->
			      <div id="lessonBookModalContent" class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">예약하기</h4>
			        </div>
			        <div class="modal-body" id="booking-modal" style="height:350px;">
						<select name="lessonPeople">
						</select>
						<input type="text" name="lessonBookDate" placeholder="강습일" required>
						<input type="hidden" name="lessonBookPrice">
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="modal-okay" id="modal-okay2">주문</button>
			          <button type="button" id="modal-cancel2" data-dismiss="modal">닫기</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
		</div>
	<!-- 강습 예약 modal 끝-->



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<!-- <script src="resources/js/parallax.js"></script> -->
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>



<script>
//markers배열
var markers = [];

//네이버지도 스크립트
var map = new naver.maps.Map("map",{
	center : new naver.maps.LatLng(37.551399,126.988259),
	zoom : 6,
	maxZoom : 7,
	zoomControl : true,
	zoomControlOptions : {
		position : naver.maps.Position.TOP_RIGHT,
		style : naver.maps.ZoomControlStyle.SMALL
	}
});



$(document).ready(function(){
	var htmlMarker1 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-1.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker2 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-2.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker3 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-3.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker4 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-4.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    },
	    htmlMarker5 = {
	        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:40px;font-size:20px;color:white;text-align:center;font-weight:bold;background:url(https://raw.githubusercontent.com/navermaps/marker-tools.js/master/marker-clustering/images/cluster-marker-5.png);background-size:contain;"></div>',
	        size: N.Size(40, 40),
	        anchor: N.Point(20, 20)
	    };

	$.ajax({
		url : "/allAddress.do",
		type : "get",
		dataType : "json",
		success : function(data){
			for(let i=0;i<data.length;i++){
				const marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(data[i].houseLat,data[i].houseLng),
					map : map,
					title : data[i].houseCity
				})
				 markers.push(marker);
			}	
			
			
	var markerClustering = new MarkerClustering({
        minClusterSize: 2,
        maxZoom: 8,
        map: map,
        markers: markers,
        disableClickZoom: false,
        averageCenter: true, 
        gridSize: 120,
        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
        indexGenerator: [10, 100, 200, 500, 1000],
    	
       	 getClusterMember: function() {
       	    return this._clusterMember;
       	  },
        stylingFunction: function(clusterMarker, count) {
            $(clusterMarker.getElement()).find('div:first-child').text(count);
            //클러스터를 클릭했을 때 동작하는 이벤트
            naver.maps.Event.addListener(clusterMarker, 'click', function(e) {
            	const mar = markers;
            	console.log(mar);
            	//lat, lng 초기화
	           	let lat = 0;
	           	let lng = 0;
	           	let count = 0;
	           	console.log(clusterMarker);
	           	console.log(clusterMarker.position.y);
	           	console.log(clusterMarker.position.x);
	           	lat = clusterMarker.position.y;
	           	lng = clusterMarker.position.x;
            	
            	const mapCenter = new naver.maps.LatLng(lat,lng);
    
            	
	            	//위경도를 통해서 해당 위치의 주소를 알아내기(reverseGeocode)
	    			naver.maps.Service.reverseGeocode({ //주소를 주면 위경도를 구해주는건 Geocode의 반대
	    				location : new naver.maps.LatLng(lat,lng)
	    			}, function(status, response){
	    				if(status != naver.maps.Service.Status.OK){
	    					return alert("주소를 찾을 수 없습니다");
	    				}
	    				console.log(response);
	    				const address = response.result.items[0].address;
	    				console.log("주소"+address);
		    				if(address.includes('서울')){
		    					$("#travel-location").attr("value",'서울');
		    				}else if(address.includes('제주')){
		    					$("#travel-location").attr("value",'제주');
		    				}else if(address.includes('부산')){
		    					$("#travel-location").attr("value",'부산');
		    				}else if(address.includes('인천')){
		    					$("#travel-location").attr("value",'인천');
		    				}else if(address.includes('대구')){
		    					$("#travel-location").attr("value",'대구');
		    				}else if(address.includes('대전')){
		    					$("#travel-location").attr("value",'대전');
		    				}else if(address.includes('광주')){
		    					$("#travel-location").attr("value",'광주');
		    				}else if(address.includes('울산')){
	    						$("#travel-location").attr("value",'울산');
		    				}else if(address.includes('경기도')){
		    					$("#travel-location").attr("value",'경기');
		    				}else if(address.includes('충청북도')){
		    					$("#travel-location").attr("value",'충북');
		    				}else if(address.includes('충청남도')){
		    					$("#travel-location").attr("value",'충남');
		    				}else if(address.includes('강원도')){
		    					$("#travel-location").attr("value",'강원');
		    				}else if(address.includes('경상북도')){
		    					$("#travel-location").attr("value",'경북');
		    				}else if(address.includes('경상남도')){
		    					$("#travel-location").attr("value",'경남');
		    				}else if(address.includes('전라북도')){
		    					$("#travel-location").attr("value",'전남');
		    				}else if(address.includes('전라남도')){
		    					$("#travel-location").attr("value",'전남');
		    				};
	    				});
            	
           			});
       			}
 			});
		}
	});
	
});



//daterangepicker api
$("#daterangepicker").daterangepicker({
    locale: {
    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
    "format": 'YYYY-MM-DD',     // 일시 노출 포맷
    "applyLabel": "확인",                    // 확인 버튼 텍스트
    "cancelLabel": "취소",                   // 취소 버튼 텍스트
    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]

    },
    showDropdowns: true,                     // 년월 수동 설정 여부
    minDate: moment(),
    maxDate: moment().add(12, 'months')
},function(start, end, label) {
    console.log(start.format('YYYYMMDD'), end.format('YYYYMMDD'));
    //위로 넘겨줄 value값
    var startVal = start.format('YYYY-MM-DD');
    var endVal = end.format('YYYY-MM-DD');
    
    
    
    var date1 = new Date(start.format('YYYY-MM-DD'));
    var date2 = new Date(end.format('YYYY-MM-DD'));
    const result = date1.getInterval(date2);
    
    $("#travel-days").attr("value",result+"박"+(result+1)+"일");
    //bookStartDate와 bookEndDate
    $("#bookStartDate").attr("value",startVal);
    $("#bookEndDate").attr("value",endVal);
});

//daterangepicker에 placeholder 삽입
$("#daterangepicker").val('');
$("#daterangepicker").attr("placeholder","여행을 떠날 날짜를 골라주세요:)");

//날짜의 차이를 구하는 함수
Date.prototype.getInterval = function (otherDate) {
    var interval;
 
    if(this > otherDate)
        interval = this.getTime() - otherDate.getTime();
    else
        interval = otherDate.getTime() - this.getTime();
 
    return Math.floor(interval / (1000*60*60*24));
}

//고른 인원수에 따른 아이콘 추가
$("#headcount").on('change',function(){
	
	var value = this.value;
	$(".head-icon-wrap").empty();
	if(value>0){
		for(var i=0;i<value;i++){
			var url = '/resources/images/headcount.png';
			var image = new Image();
			image.src = url;
			$(".head-icon-wrap").append(image);
			$(".head-icon-wrap").children().css({"width": "300px", "height": "300px", "float": "left"});
		}
		 $("#whole-people").attr("value","총 "+value+"명 입니다");
		 $("#people-value").attr("value",value);
	}
});
//체크박스 선택시 테두리 변경
$('input[type=checkbox]').on('change',function(){
	 if ($(this).is(':checked')) {
		 $(this).parent().prev().children().css("border", "8px solid #3da9d4");
	 }else{
		 $(this).parent().prev().children().css("border", "none");
	 }
})
//체크박스 선택시 값 전달(바베큐 옵션)
$("#barbecue").on('click',function(){
	if($(this).prop('checked')){
		$("#barbecue-choice").attr("value",1);
	} else{
		$("#barbecue-choice").attr("value",0);
	}
});
//체크박스 선택시 값 전달(파티 옵션)
$("#party").on('click',function(){
	if($(this).prop('checked')){
		$("#party-choice").attr("value",1);
	} else{
		$("#party-choice").attr("value",0);
	}
})

//체크박스 선택시 값 전달(초급레벨)
$("#level1").on('click',function(){
	if($(this).prop('checked')){
		$("#level1-choice").attr("value",1);
	} else{
		$("#level1-choice").attr("value",0);
	}
});
//체크박스 선택시 값 전달(중급레벨)
$("#level2").on('click',function(){
	if($(this).prop('checked')){
		$("#level2-choice").attr("value",1);
	} else{
		$("#level2-choice").attr("value",0);
	}
})
//체크박스 선택시 값 전달(상급레벨)
$("#level3").on('click',function(){
	if($(this).prop('checked')){
		$("#level3-choice").attr("value",1);
	} else{
		$("#level3-choice").attr("value",0);
	}
})


//따라다니는 메뉴

$("document").ready(function() {  
	 $(".pages").hide();
     $(".page1").show();
	 $(".title").text("어디로 떠나볼까요?")
	 $("#current-page").attr("value",1);
	//주문내역에 회원 아이디 미리 넣어놓기
	$(".orderTitle").text($('.memberName').val()+" 님의 주문내역");
	
    $(window).scroll(function()  
    {  
        $('#scroll').animate({top:$(window).scrollTop()+"px" },{queue: false, duration: 350});
        /*
        $(".pages").hide();
        $(".page1").show();
		$(".title").text("어디로 떠나볼까요?")
		$("#current-page").attr("value",1);
		*/
    });  
  
});  

//페이지별 버튼 동작
//page1 지역 선택
	$(".page1-okay").on('click',function(){
		if($("#travel-location").val()=="원하시는 지역을 클릭해주세요"){
			alert("지도에서 원하시는 지역을 클릭해주세요:)")
		}else{
			//아예 다 한번 hide하고 show 하자
			$(".pages").hide();
			$(".page2").show();
			$(".title").text("떠날 날짜를 골라주세요")
			$("#current-page").attr("value",2);
		}
	})
	$(".page1-pass").on('click',function(){
		alert("지역은 꼭 정해주셔야해요:)")
	})
//page2 날짜 선택
	$(".page2-before").on('click',function(){
		$(".pages").hide();
		$(".page1").show();
		$(".title").text("어디로 떠나볼까요?")
		$("#current-page").attr("value",1);
	})
	$(".page2-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($("#travel-days").val().indexOf("0박") !== -1){
			alert("날짜는 꼭 정해주셔야해요:)")
		}else{
			$(".pages").hide();
			$(".page3").show();
			$(".title").text("몇 명이신가요?");
			$("#current-page").attr("value",3);
		}
	});
	$(".page2-pass").on('click',function(){
		alert("날짜는 꼭 정해주셔야해요:)")
	})
//page3 인원수 선택
	$(".page3-before").on('click',function(){
		$(".pages").hide();
		$(".page2").show();
		$(".title").text("떠날 날짜를 골라주세요");
		$("#current-page").attr("value",2);
		
	})
	$(".page3-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($("#people-value").val() == ""){
			alert("인원수는 꼭 정해주셔야해요:)")
		}else{
			$(".pages").hide();
			$(".page4").show();
			$(".title").text("옵션을 골라주세요");
			$("#current-page").attr("value",4);
		}
	});
	$(".page3-pass").on('click',function(){
		alert("인원수는 꼭 정해주셔야해요:)")
	})
//page4 숙소옵션선택
	$(".page4-before").on('click',function(){
		$(".pages").hide();
		$(".page3").show();
		$(".title").text("옵션을 골라주세요")
		$("#current-page").attr("value",3);
	})
	$(".page4-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
			$(".pages").hide();
			$(".page5").show();
			$(".title").text("조건에 맞는 방 리스트예요")
		//숙소 리스트 ajax
			const result = $(".rooms-wrap");
			const bookStartDate = $("#bookStartDate").val();
			const bookEndDate = $("#bookEndDate").val();
			const roomCapa = $("#people-value").val();
			const houseBarbecue = $("#barbecue-choice").val();
			const houseParty = $("#party-choice").val();
			const houseCity = $("#travel-location").val();
			result.empty();
			$.ajax({
				url : "/roomList.do",
				type : "get",
				data : {bookStartDate : bookStartDate, bookEndDate : bookEndDate, roomCapa : roomCapa, houseBarbecue : houseBarbecue, houseParty : houseParty, houseCity : houseCity},
				dataType : "json",
				success : function(data){
					console.log(data);
					for(let i=0;i<data.length;i++){
						const div=$("<div class=roomList></div>");
						
						const imageWrap = $("<div class=image-wrap></div>");
						if(data[i].housePhoto1 != null){
							imageWrap.append("<img class=roomImage src=resources/upload/house/" + data[i].housePhoto1 + " />");
						}else {
							imageWrap.append("<div style='height: 220px; margin-bottom: 15px;'><div class='waveEffect' style='margin: 0 auto;'><p class='waveEffectWord-back' style='text-indent: 13px; line-height: 550%;'>사진이 없습니다</p><p class='waveEffectWord-front' style='text-indent: 13px; line-height: 550%;'>사진이 없습니다</p></div></div>");
						}
						div.append(imageWrap);
						
						const infoWrap = $("<div class=info-wrap></div>");
						infoWrap.append("<div style='height: 58px;'><a href='/houseView.do?houseNo="+data[i].houseNo+"' target='_blank' style='font-size: 20px;'>"+data[i].houseTitle+"</a><div>");
						infoWrap.append("<input type='hidden' id='houseNo' value = '"+data[i].houseNo+"'>")
						
						const col4 = $("<div>").addClass("col-md-4");
						if(data[i].houseBarbecuePrice > 0){
							col4.append("<img style='width: 30px;' src='resources/images/barbecue.png'>");
						}
						if(data[i].housePartyPrice > 0){
							col4.append("<img style='width: 30px;' src='resources/images/party.png'>");
						}

						const col5 = $("<div>").addClass("col-md-5");
						col5.append("<p style='font-size: 18px;'>"+data[i].housePrice+"원/1박</p>");
						
						const col3 = $("<div>").addClass("col-md-3");
						col3.append("<span class='label label-primary'>"+data[i].roomCapa+"인실</span>");

						infoWrap.append( $("<div>").addClass("row").append(col4).append(col5).append(col3) );
						
						//모달 테스트
						infoWrap.append("<button onclick=getRoom("+data[i].houseNo+") class=btn btn-info btn-lg data-toggle=modal data-target=#myModal>예약하기</button>");
					
						div.append(infoWrap);
						
						result.append(div);
						//result.addClass('roomList')
					}
				},
					error : function(){
						console.log("숙소리스트 불러오기 에러");
					}
			});
			$("#current-page").attr("value",5);
	});

//버튼 클릭하면 모달 띄워주는 function
					function getRoom(houseNo){
						console.log("하우스넘버"+houseNo);
						$(".photo-check").css("display","none");
						$(".bigThumbnailImage").parent().css("display","none");
						$(".photo1").css("display","none");
						$(".extra-photo").remove();
						$.ajax({
							url : "/houseModalView.do",
							type : "get",
							data : {houseNo : houseNo},
							dataType : "json",
							success : function(data){
								console.log(data);
								console.log("데이터체크:"+data.housePhoto1);
								const url = "resources/upload/house/";
								//모달 사진 부분
								if(data.housePhoto1 == null){
									$(".photo-check").css("display","block");
								}else {
									$(".bigThumbnailImage").parent().css("display","block");
									$(".photo1").css("display","inline");
									
									$(".bigThumbnailImage").attr("src",url+data.housePhoto1);
									$(".photo1").attr("src",url+data.housePhoto1);
									
									if(data.housePhoto2!=null){
										$(".pagination").append("<li class=extra-photo><img class=clickToLarger photo2 src="+url+data.housePhoto2+">");
										$(".photo2").attr("src",url+data.housePhoto2);
										console.log("데이터체크2:"+data.housePhoto2);
									}
									if(data.housePhoto3!=null){
										$(".pagination").append("<li class=extra-photo><img class=clickToLarger photo3 src="+url+data.housePhoto3+">");
										$(".photo3").attr("src",url+data.housePhoto3);
										console.log("데이터체크3:"+data.housePhoto3);
									}
									if(data.housePhoto4!=null){
										$(".pagination").append("<li class=extra-photo><img class=clickToLarger photo4 src="+url+data.housePhoto4+">");
										$(".photo4").attr("src",url+data.housePhoto4);
										console.log("데이터체크4:"+data.housePhoto4);
									}
								}
								
								//모달 글부분
								//방, 숙소이름
								$(".modal-room-title").text(data.roomTitle);
								$("input[name=roomTitle]").attr("value",data.houseTitle);
								$(".modal-house-title").text(data.houseTitle);
								//숙박가격
								let housePrice = data.housePrice;
								//console.log("가격테스트 : "+housePrice.toLocaleString("ko-KR"));
								$("input[name=housePrice]").attr("value",data.housePrice);
								$(".modal-house-price").text(housePrice.toLocaleString("ko-KR"));
								//인원수
								$("input[name=roomCapa]").attr("value",data.roomCapa);
								$(".modal-house-roomCapa").text(data.roomCapa+"인실");
								//주소
								$(".modal-house-houseAddress").text(data.houseAddress);
								//숙소 상품설명
								$("#one").html(data.houseDescription);
								
								// 부트스트랩 tooltip(비성수기 평일기준 그거 나오는거)
								$(document).ready(function(){
									$('[data-toggle="tooltip"]').tooltip();   
								});
								//모달의 조그만 사진 클릭하면 그 사진 확대 해주는거
								$(function(){
									$(".clickToLarger").click(function () {
										$(".clickToLarger").removeClass("onViewing");
										$(this).addClass("onViewing");
										$(".bigThumbnailImage").attr("src",$(this).attr("src"));
									});
								});
				
				
// (숙박업소 & 인원 수) 조건에 맞는 객실들을 받는 ajax
								const roomTitleVal = data.roomTitle;
								//const roomCapaVal = data.roomCapa;
								const bookStartDate = $("#bookStartDate").val();
								const bookEndDate = $("#bookEndDate").val();
								
								$.ajax({//작업중
										url : "/availableModalRoomsList.do",
										data: {roomTitle : roomTitleVal, houseNo : houseNo, bookStartDate : bookStartDate, bookEndDate : bookEndDate},
										dataType : "json",
										success : function(List){
											console.log(List)
											$("[name=roomName]").empty();
											//$("[name=roomName]").append($("<option>").text("객실을 먼저 선택해주세요"));
											$("[name='roomName']").append('<option value="0" selected>객실을 먼저 선택해주세요</option>');
											$("[name=modalOptionPrice1]").attr("value",List[0].houseBarbecuePrice);
											$("[name=modalOptionPrice2]").attr("value",List[0].housePartyPrice);
											$("[name=housePrice]").attr("value",List[0].housePrice);
											$("[name=houseroomTitle]").attr("value",List[0].roomTitle);
											for(let i=0; i<List.length; i++){
												const option = $("<option>");
												option.val(List[i].roomNo);
												option.text(List[i].roomName);
												$("[name=roomName]").append(option);
												$("<input type='hidden' id='roomNo-option' value="+List[i].roomName+">");
							    			}
											//$("[name=roomName] option:selected").val();
											//리뷰리스트 불러오기
											
										}
								});
								
								$.ajax({
									url : "/selectAllReview.do",
									data: {houseNo : houseNo},
									dataType : "json",
									success : function(List){
										console.log("ajax 테스트중"+ JSON.stringify(List));
										if(List.length  === "empty"){
											const table=$(".review-table").children();
											const tr=$("<tr>");
											tr.append("<td colspan=7 style=text-align:center;>조회된 리뷰가 없습니다.</td>");
											table.append(tr);
										}else{
											const table=$(".review-table").children();
											for(let j=0; j<List.length; j++){
												const tr=$("<tr class=reviewModalContent></tr>");
												tr.append("<td style=text-align:center;>"+List[j].reviewTitle+"</td>");
												tr.append("<td style=text-align:center;>"+List[j].reviewWriter+"</td>");
												tr.append("<td style=text-align:center;>"+List[j].reviewContent+"</td>");
												const rating=$("<td style='text-align:center; color:orange;'></td>");
												
												if(List[j].rating == 1){
													rating.append("★");
												}else if(List[j].rating == 2){
													rating.append("★★");
												}else if(List[j].rating == 3){
													rating.append("★★★");
												}else if(List[j].rating == 4){
													rating.append("★★★★");
												}else if(List[j].rating == 5){
													rating.append("★★★★★");
												};
												tr.append(rating);
												for(let k=0; k<List[j].rfileList.length; k++){
													const fileList = $("<div style=display:inline-block;></div>");
													fileList.append("<img src=/resources/upload/review/"+List[j].rfileList[k].filepath+" width=60 height=60 class=trans5>");
													fileList.append("<input type=hidden value="+List[j].rfileList[k].filepath+">");
													fileList.append("<input type=hidden value="+List[j].rfileList[k].fileNo+">");
													tr.append(fileList);
												};
												
												
												table.append(tr);
											}
											
										}
									},
									error : function(){
										console.log("리뷰 ajax 에러났음");
									}
								})//리뷰리스트 불러오기 끝
							},
							//getroom function success 끝
							error : function(){
								console.log("모달 에러났음");
							}
						}); //숙소 상세정보 모달 ajax끝
					} //getroom function 끝
					
					
					
// 예약하기 modal 띄우면 실행되는 함수 시작
								$("#goBooking").on("click", function(){
									
									//키오스크 2페이지에서 받아온 예약시작일과 종료일
									let bookStartDate = $("#bookStartDate").val();
									$("#bookStart").val(bookStartDate);
									console.log("키오스크2페이지"+bookStartDate);
									let bookEndDate = $("#bookEndDate").val();
									$("#bookEnd").val(bookEndDate);
									
									const houseBarbecue = $("#barbecue-choice").val();
									const houseParty = $("#party-choice").val();
									//선택한 옵션에 따른 옵션 dropdown메뉴
									$("[name=modal-option]").empty();
									$("[name=modal-option]").append($("<option>").text("선택하신 옵션입니다."));
									let result = $("[name=housePrice]").val();
									
									if(houseBarbecue == 1){
										const option = $("<option>");
										//option.val(List[i].roomNo);
										option.text("바베큐 "+$("[name=modalOptionPrice1]").val()+"원");
										$("[name=modal-option]").append(option);
										result= result+$("[name=modalOptionPrice1]").val();
									}
									if(houseParty ==1){
										const option = $("<option>");
										//option.val(List[i].roomNo);
										option.text("파티"+$("[name=modalOptionPrice2]").val()+"원");
										$("[name=modal-option]").append(option);
										result= result+$("[name=modalOptionPrice2]").val();
									}
									//receipt에 숙박총액 넘겨주는 함수
									$("#roomTotalPrice-choice").attr("value","선택하신 옵션을 포함한 가격은 총 "+result+"원입니다.");
								});
							// 예약하기 modal 띄우면 실행되는 함수 끝

// roomBookPrice를 계산하는 함수(예약하기 클릭하면 나오는 함수)
								$("#modal-okay").on("click", function(){
									if($("[name=roomName] option:selected").text() != "객실을 먼저 선택해주세요"){

										let onedayPrice = $("[name=housePrice]").val();
										console.log("하루 방값"+$("[name=housePrice]"));
										console.log("시작일"+$("#bookEndDate").val());
										console.log("끝나는 날"+$("#bookStartDate").val());
										
											let result = 0;
											let days = moment($("#bookEndDate").val()).diff(moment($("#bookStartDate").val()), 'days');
											for(let i=0; i<days; i++){
												let adjustment = 1;
												if(moment($("#bookStartDate").val()).add(i, 'days').format('M')>=6 && moment($("#bookStartDate").val()).add(i, 'days').format('M')<=8){
													console.log("6~8월은 성수기 할증으로 요금이 1.2배가 됩니다.");
													adjustment *= 1.2;
												}
												if(moment($("#bookStartDate").val()).add(i, 'days').isoWeekday() == 5 || moment($("#bookStartDate").val()).add(i, 'days').isoWeekday() == 6){
													console.log("주말은 할증으로 요금이 1.5배가 됩니다.");
													adjustment *= 1.5;
												}
												result += onedayPrice * adjustment;
												console.log((i+1)+"일째까지 누계 "+result+"원");
											}
											if($("#barbecue-choice").val()==1){
												result += Number($("[name=modalOptionPrice1]").val());
											}
											if($("#party-choice").val()==1){
												result += Number($("[name=modalOptionPrice2]").val());
											}
											
											// 주문내역에 옵션 가격 및 정보 전달		
											const houseBarbecue = $("#barbecue-choice").val();
											const houseParty = $("#party-choice").val();
											if(houseBarbecue == 1 && houseParty != 1){
												$("#options-choice").attr("value","바베큐 "+$("[name=modalOptionPrice1]").val()+"원");
												$(".options-choice").text("바베큐 "+$("[name=modalOptionPrice1]").val()+"원");
											}else if(houseBarbecue != 1 && houseParty == 1){
												$("#options-choice").attr("value","파티"+$("[name=modalOptionPrice2]").val()+"원");
												$(".options-choice").text("파티"+$("[name=modalOptionPrice2]").val()+"원");
											}else if(houseBarbecue != 1 && houseParty == 1){
												$("#options-choice").attr("value","바베큐 "+$("[name=modalOptionPrice1]").val()+"원","value","파티"+$("[name=modalOptionPrice2]").val()+"원");
												$(".options-choice").text("바베큐 "+$("[name=modalOptionPrice1]").val()+"원","파티"+$("[name=modalOptionPrice2]").val()+"원");
											}else{
												$("#options-choice").attr("value","선택하신 옵션이 없습니다.");
												$(".options-choice").text("선택하신 옵션이 없습니다.");
											}   
												$("#modal-cancel").click();
												$("#roomBook-close").click();
												alert("주문이 완료되었습니다");
												//roomBookPrice에 result값 넣어주는 함수+stat-count 숫자 변경
												console.log("옵션을 포함한 총 요금은 "+result+"원으로 계산되었습니다.");
												$("[name=roomBookPrice]").val(result);
												$(".stat-count").text("0");
												$(".stat-count").text(result);
												//주문내역에 숙소 총액,숙소 호수&이름,예약날짜 넣어주는 함수
												$(".houseTitle-choice").text($("input[name=roomTitle]").val());
												
												
												$(".roomTitleNo-choice").text($("[name=roomTitle]").val()+"("+$("[name=roomName] option:selected").val()+"호)");
												
												$(".bookDate-choice").text($("#bookStartDate").val()+"~"+$("#bookEndDate").val());
												
												$(".roomTotalPrice-choice").text("옵션을 포함한 총 요금은 "+result+"원으로 계산되었습니다.");
												//나중에 쓰기 위해 hidden으로 숨겨놓은 input에 값 전달
												$("#roomTotalPrice").attr("value",result);
												//stat-count 애니메이션 효과! 아래에서 강습때에도 마찬가지로 적용하자
												$('.stat-count').each(function(){
											        $(this).prop('Counter',0).animate({
											            Counter: $(this).text()
											        },{
											            duration: 1000,
											            easing: 'swing',
											            step: function (now){
											                $(this).text(Math.ceil(now));
											            }
											        });
											    });
									}else{
										alert("원하시는 방 호수를 먼저 골라주세요");
									}
									
								});
	
	$(".page4-pass").on('click',function(){
		
		const result = confirm("숙소 옵션은 필요없으신가요?\n클릭하시면 옵션 선택없이 숙소만 표시됩니다.");
		if(result == true){
			alert("옵션선택을 건너뜁니다");
			$(".pages").hide();
			$(".page4-okay").click();
			//$(".page5").show();
			//$(".title").text("조건에 맞는 방 리스트예요~!");
			//$("#current-page").attr("value",5);
		}else{
			alert("숙소를 골라주세요");
		}
	})
	
	
//page5 숙소리스트
	$(".page5-before").on('click',function(){
		$(".pages").hide();
		$(".page4").show();
		$(".title").text("옵션을 골라주세요");
		$("#current-page").attr("value",4);
	})
	$(".page5-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
		if($(".stat-count").text()==0){
			const result = confirm("숙소가 필요없으신가요?\n확인을 클릭하시면 다음 페이지로 넘어갑니다.");
			if(result == true){
				alert("숙소선택을 건너뜁니다");
				$(".pages").hide();
				$(".page6").show();
				$(".title").text("원하시는 강습레벨을 골라주세요");
				$("#current-page").attr("value",6);
			}else{
				alert("숙소를 골라주세요");
			}
		}else{
			$(".pages").hide();
			$(".page6").show();
			$(".title").text("원하시는 강습레벨을 골라주세요");
			$("#current-page").attr("value",6);
		}
	});
	$(".page5-pass").on('click',function(){
		const result = confirm("숙소는 필요없으신가요?");
		if(result == true){
			alert("숙소를 고르지 않고 숙소선택을 건너뜁니다");
			$(".stat-count").text("0");
			$(".pages").hide();
			$(".page6").show();
			$(".title").text("원하시는 강습레벨을 골라주세요");
			$("#current-page").attr("value",6);
		}else{
			alert("숙소를 골라주세요");
		}
	})
//page6 레벨선택
	$(".page6-before").on('click',function(){
		$(".pages").hide();
		$(".page5").show();
		$(".title").text("조건에 맞는 방 리스트예요")
		$("#current-page").attr("value",5);
	})
	$(".page6-okay").on('click',function(){
		//아예 다 한번 hide하고 show 하자
			$(".pages").hide();
			$(".page7").show();
			$(".title").text("조건에 맞는 강습리스트예요~!");
		//숙소 리스트 ajax
			const result = $(".lessons-wrap");
			const bookStartDate = $("#bookStartDate").val();
			const bookEndDate = $("#bookEndDate").val();
			const lessonMaxNo = $("#people-value").val();
			const level1 = $("#level1-choice").val();
			const level2 = $("#level2-choice").val();
			const level3 = $("#level3-choice").val();
			const lessonCity = $("#travel-location").val();
			//console.log("레벨1:"+level1);
			//console.log("레벨2:"+level2);
			//console.log("레벨3:"+level3);
			if(level1 != 0 || level2 != 0 || level3 != 0){
				result.empty();
				$.ajax({
					url : "/lessonList.do",
					type : "get",
					data : {lessonMaxNo : lessonMaxNo, level1 : level1, level2 : level2, level3 : level3, lessonCity : lessonCity},
					dataType : "json",
					success : function(data){
						console.log(data);
						for(let i=0;i<data.length;i++){
							const div=$("<div class=lessonList></div>");
							console.log(data[i].lessonTitle);
							console.log(data[i].lessonMaxNo+"명");
							
							console.log("레슨 ajax");
							
							const imageWrap = $("<div class=image-wrap></div>");
							if(data[i].lessonInfoPic != null){
								imageWrap.append("<img class=lessonImage src=resources/upload/lesson/" + data[i].lessonInfoPic + " />");
							}else {
								imageWrap.append("<div style='height: 220px; margin-bottom: 15px;'><div class='waveEffect' style='margin: 0 auto;'><p class='waveEffectWord-back' style='text-indent: 13px; line-height: 550%;'>사진이 없습니다</p><p class='waveEffectWord-front' style='text-indent: 13px; line-height: 550%;'>사진이 없습니다</p></div></div>");
							}
							div.append(imageWrap);

							const infoWrap = $("<div class=info-wrap></div>");
							infoWrap.append("<div style='height: 58px;'><a href='/lessonView.do?lessonNo="+data[i].lessonNo+"' target='_blank' style='font-size: 20px;'>"+data[i].lessonTitle+"</a><div>");
							
							const col4 = $("<div>").addClass("col-md-4");
							col4.append("<span class='label label-primary'>정원 "+data[i].lessonMaxNo+"명</span>");

							const col5 = $("<div>").addClass("col-md-5");
							col5.append("<p style='font-size: 18px;'>"+data[i].lessonPrice+"원/1인</p>");
							
							const col3 = $("<div>").addClass("col-md-3");
							if(data[i].lessonLevel == 1){
								col3.append("<span class='label label-primary'>초급</span>");
							}else if(data[i].lessonLevel == 2){
								col3.append("<span class='label label-primary'>중급</span>");
							}else if(data[i].lessonLevel == 3){
								col3.append("<span class='label label-primary'>고급</span>");
							}

							infoWrap.append( $("<div>").addClass("row").append(col4).append(col5).append(col3) );

							//강습상품 상세보기용 modal을 여는 버튼을 삽입
							infoWrap.append("<button onclick=getLesson("+data[i].lessonNo+") class=btn btn-info btn-lg data-toggle=modal data-target=#lessonModal>예약하기</button>");
							
							result.append(div.append(infoWrap));
						}
					},
						error : function(){
							console.log("레슨리스트 불러오기 에러");
						}
				});
				$("#current-page").attr("value",7);
			}else {
				alert("강습레벨은 꼭 정해주셔야해요:)");
				$(".pages").hide();
				$(".page6").show();
				$(".title").text("원하시는 강습레벨을 골라주세요");
			}
			
	});
	$(".page6-pass").on('click',function(){
		alert("강습레벨은 꼭 정해주셔야해요");
	});
//page7 강습선택
	$(".page7-before").on('click',function(){
		$(".pages").hide();
		$(".page6").show();
		$(".title").text("원하시는 강습레벨을 골라주세요");
		$("#current-page").attr("value",6);
		
	})
	$(".page7-okay").on('click',function(){
		if($(".stat-count").text() == "0" || $("#lessonTotalPrice").val() == 0){
			alert("강습은 꼭 선택해주셔야해요");
			}else{
				$(".pages").hide();
				$(".page8").show();
				$(".title").text("주문내역을 확인해주세요");
				$("#current-page").attr("value",8);
			}
			
	});
	$(".page7-pass").on('click',function(){
			alert("강습은 꼭 선택해주셔야해요");
	})
//page8 주문내역
	$(".page8-before").on('click',function(){
		$(".pages").hide();
		$(".page7").show();
		$(".title").text("조건에 맞는 강습리스트예요~!");
		$("#current-page").attr("value",7);
		
	})
	$(".page8-okay").on('click',function(){

		if(confirm("결제 하시겠습니까? ")){
			const memberName = $('.memberName').val();
			const memberPhone = $('.memberPhone').val();
			const memberEmail = $('.memberEmail').val();
			
		const price = $('#totalPriceVal').val();	//결제 금액
		const priceCheck = isNaN(price); //결제금액 숫자인지 check

		const regExp = /^[0-9]+00$/;	
		const regCheck = regExp.test(price);
		
		if(priceCheck){
			alert('숫자만 입력하세요');
		}else{
			if(regCheck){
		const d = new Date();
		const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		console.log(price);
		console.log(date);
		
		IMP.init("imp32171865");
		
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : "card",
			merchant_uid : "상품번호_"+date,//상점에서 관리하는 주문번호
			name : "Lonely Surfers",	//결제이름
			amount : price,		//결제금액
			buyer_email : memberEmail, //구매자 email
			buyer_name : memberName, //구매자 이름
			buyer_tel : memberPhone, //구매자 전화번호
			buyer_addr : "",//구매자 주소
			buyer_postcode : "12345"  
		},function(rsp){
			if(rsp.success){
				console.log("ajax값들 콘솔로그");
				const houseNo = $("#houseNo").val();
				console.log("houseNo"+houseNo);
				const memberNo = $(".memberNo").val();
				console.log("memberNo"+memberNo);
				const bookStartDate = $("#bookStartDate").val();
				console.log("bookStartDate"+bookStartDate);
				const bookEndDate = $("#bookEndDate").val();
				console.log("bookEndDate"+bookEndDate);
				let roomNo;
				if($("[name=roomName]").val() == "0"){
					roomNo = 0;
					console.log("숙박선택하지 않을때 roomNo"+roomNo);
				}else if($("[name=roomName]").val() != "0"){
					roomNo = $("[name=roomName] option:selected").val();
					console.log("숙박선택 했을 때roomNo"+roomNo)
				}
				
				const roomBookPrice = $("#roomTotalPrice").val();
				console.log("roomBookPrice"+roomBookPrice);
				const optionDetail = $(".options-choice").text();
				console.log("optionDetail"+optionDetail);
				
				const lessonBookDate = $(".lessonDate-choice").text();
				console.log("lessonBookDate"+lessonBookDate);
				const lessonPeople = $("#lessonPeople-choice").val();
				console.log("lessonPeople"+lessonPeople);
				const lessonNo = $("#modal-lessonNo").val();
				console.log("lessonNo"+lessonNo);
				const lessonBookPrice= $("#lessonTotalPrice").val();
				console.log("lessonBookPrice"+lessonBookPrice);
				
				
				const orderAllPrice = $("#totalPriceVal").val();
				console.log("orderAllPrice"+orderAllPrice);
				let orderProduct = 0;
				if($("#roomTotalPrice").val() != "" && $("lessonTotalPrice").val() != ""){
					orderProduct = 3;
				} else if($("#roomTotalPrice").val() != "" && $("lessonTotalPrice").val() == ""){
					orderProduct = 2;
				} else if($("#roomTotalPrice").val() == "" && $("lessonTotalPrice").val() != ""){
					orderProduct = 1;
				}else{
					console.log("orderProduct에 문제가 있음");
				}
				console.log("orderProduct"+orderProduct);
				alert("결제가 완료되었습니다");
				
				
				//결제관련 정보를 DB에 insert 하는 작업이 필요

						//숙박 선택 자체를 하지 않았을 때
						if(roomNo != 0){
								//ajax로 room_book에 insert
								$.ajax({
									url:"/roomBookInsert.do",
									type:"post",
									data:{roomNo : roomNo, memberNo : memberNo, bookStartDate : bookStartDate, bookEndDate : bookEndDate, houseNo : houseNo, roomBookPrice : roomBookPrice, optionDetail : optionDetail},
									success:function(data){
										//나중에 쓸 수 있게 receipt부분의 roomBookNo에 값을 넣어줌
										$("#roomBookNo").attr("value",data);
										console.log("ajax roomBookNo"+data);
									},
									error:function(){
										console.log("roomBook insert에 문제있음");
									}
								});
							};

					//ajax로 lesson_book에 insert
					$.ajax({
						url:"/lessonBookInsert.do",
						type:"post",
						data:{lessonBookDate : lessonBookDate, lessonPeople : lessonPeople, memberNo : memberNo, lessonNo : lessonNo, lessonBookPrice : lessonBookPrice},
						success:function(data){
							//나중에 쓸 수 있게 receipt부분의 lessonBookNo에 값을 넣어줌
							$("#lessonBookNo").attr("value",data);
							console.log("ajax lessonBookNo"+data);
							
							
							//ajax로 order_tbl에 insert(const는 모두 만들어놨음 ajax만 돌리면 된다)
							$.ajax({
								url:"/oderTblInsert.do",
								type:"post",
								data:{houseNo : houseNo, memberNo : memberNo, orderAllPrice : orderAllPrice, orderProduct : orderProduct},
								success:function(data){
									//나중에 쓸 수 있게 receipt부분의 orderNo에 값을 넣어줌
									$("#orderNo").attr("value",data);
									console.log("ajax orderNo"+data);
										//ajax로 order_detail에 insert
										
												const orderNo = data;
												console.log("orderNo"+orderNo);
												const roomBookNo = $("#roomBookNo").val();
												console.log("roomBookNo"+roomBookNo);
												const lessonBookNo = $("#lessonBookNo").val();
												console.log("lessonBookNo"+lessonBookNo);
										$.ajax({
											url:"/orderDetailInsert.do",
											type:"post",
											data:{orderNo : orderNo, houseNo : houseNo, roomBookNo : roomBookNo, lessonNo : lessonNo, lessonBookNo : lessonBookNo},
											success:function(data){
												
												//나중에 쓸 수 있게 receipt부분의 orderDetailNo에 값을 넣어줌
												$("#orderDetailNo").attr("value",data);
												//다음 페이지 이동
												$(".pages").hide();
												console.log("page9 숨김")
												$(".page9").show();
												console.log("page9 보여줌")
												$(".title").text("즐거운 여행 되세요");
												console.log("page9 제목")
												$("#current-page").attr("value",9);
												
											}
										})
									//
								}
							});//order_tbl, orderDetail에 insert끝
						},
						error:function(){
							console.log("roomBook insert에 문제있음");
						}
					});//결제 성공 이후 insert 로직 끝
					
				
					
			}else{
				alert("결제를 취소합니다");	
			}
		});
			}else{
				alert("100원 단위로 결제 가능합니다.");
			}
		}//결제 모듈 else 구문 끝
		
		}
	});
	//다음 페이지로 이동
	
		
		
		
		
		/*
		let result = confirm("주문하신 내역이 맞으신가요?");
		if(result == true){
			$(".pages").hide();
			$(".page8").show();
			$(".title").text("주문내역을 확인해주세요");
			$("#current-page").attr("value",8);
		}else{
			alert("원하시는 강습을 선택해주세요");
		}
		*/
	
	$(".page8-pass").on('click',function(){
			alert("주문내역을 확인하시고 확정버튼을 눌러주세요");
	});

//page9 마무리

		




//강습상품의 상세정보 보기 버튼 클릭하면 modal을 띄워주는 function
			function getLesson(lessonNo){
				console.log("레슨넘버"+lessonNo);
				$(".lessonPic-check").css("display","none");
				$("#modal-lesson-pic").parent().css("display","none");
		
				$.ajax({
					url : "/lessonModalView.do",
					data : {lessonNo : lessonNo},
					dataType : "json",
					success : function(data){
						const photoUrl = "resources/upload/lesson/";
						//모달 사진 부분
						if(data.lessonInfoPic == null){
							$(".lessonPic-check").css("display","block");
						}else {
							$("#modal-lesson-pic").parent().css("display","block");
							$("#modal-lesson-pic").attr("src",photoUrl+data.lessonInfoPic);						
						}
						
						//모달 글부분
						//강사이름, 강습제목 
						$("#modal-lesson-teacher").text(data.lessonTeacher);
						$("#modal-lesson-title").text(data.lessonTitle);
						$("#modal-lesson-time").text("("+data.lessonStartTime+"~"+data.lessonEndTime+")")
						$("#modal-lessonNo").attr("value",lessonNo);
						//강습가격
						let lessonPrice = data.lessonPrice;
						$("input[name=lessonPrice]").attr("value",data.lessonPrice);
						
						$("#modal-lesson-price").text(lessonPrice.toLocaleString("ko-KR"));
						//정원 수
						$("input[name=lessonMaxNo]").attr("value",data.lessonMaxNo);
						//강습레벨
						if(data.lessonLevel == 1){ $("#modal-lesson-level").text("초급"); }
						else if(data.lessonLevel == 2){ $("#modal-lesson-level").text("중급"); }
						else if(data.lessonLevel == 3){ $("#modal-lesson-level").text("고급"); }
						$("#modal-lesson-time").text(data.lessonStartTime+"~ "+data.lessonEndTime.trim());
						//지역
						$("#modal-lesson-city").text(data.lessonCity);
						//상품설명
						$("#modal-lesson-info").text(data.lessonInfo);
						
						const maxLessonPeople = $("#people-value").val();
						const lessonPeopleInput = $("[name=lessonPeople]");
						lessonPeopleInput.children().remove();
						lessonPeopleInput.append($("<option>").attr("selected", true).attr("disabled", true).text("인원 수를 먼저 선택해주세요."));
						for(let i=1; i<=maxLessonPeople; i++){
							lessonPeopleInput.append($("<option>").attr("value", i).text(i+"명"));
						}
		
					
					},
					error : function(){
						console.log("모달 에러났음");
					}
				}); //상품 상세정보 모달 ajax끝
			} //강습상품의 상세정보 보기 modal 함수 끝
			
// 예약하기 modal 띄우면 실행되는 함수 시작
				$("#goLessonBook").on("click", function(){
					$("[name=lessonPeople]").on("change", function(){
						const lessonCapa = $("input[name=lessonMaxNo]").val() - $("[name=lessonPeople]").val();
						const lessonNo = $("#modal-lessonNo").val();
			console.log($("[name=lessonPeople]").val() +"명을 예약하려고 함");
			console.log("강습정원 - 지금 예약할 인원 수 = " + lessonCapa +"(필요한 남은 자리 수)");
					// 이미 결제완료 인원 된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax
						if($("[name=lessonPeople]").val()>=1){
							$.ajax({
								url : "/bookOneLesson.do",
								data: {lessonNo : lessonNo},
								dataType : "json",
								success : function(List){
									let invalidDateRanges = [];
									for(let i=0; i<List.length; i++){
			console.log(List[i].lessonBookDate +"에는 결제완료 상태의 인원이 이미 "+ List[i].lessonPeople +"명 있음");
										if(List[i].lessonPeople > lessonCapa){
			console.log("남은 자리가 "+ $("[name=lessonPeople]").val() +"이 안 되므로 "+ List[i].lessonBookDate +"는 막음");
										invalidDateRanges[i] = { 'start': moment(List[i].lessonBookDate), 'end': moment(List[i].lessonBookDate) };}
									}
								//강습 1인 가격 넘겨줌
								$("[name=lessonPrice]").attr("value", $("#modal-lesson-price").val());

								// 선택된 인원 수 바뀔 때마다 날짜 관련 데이터들 모두 초기화
									$("[name=lessonBookDate]").val("");
									$("[name=lessonBookDate]").attr("value", null);

								// 예약일을 선택하는 date range picker 생성
									$('[name=lessonBookDate]').daterangepicker({
									    parentEl: "#lessonBookModalContent .modal-body",
										locale: {
										format: "YYYY-MM-DD",
										fromLabel: "시작",
										toLabel: "종료"
							    		},
								    	alwaysShowCalendars: true,
										autoApply: true,
										singleDatePicker: true,
										showDropdowns: true,
										minDate: moment($("#bookStartDate").val()),
										maxDate: moment($("#bookEndDate").val()),
										isInvalidDate: function(date) {
											return invalidDateRanges.reduce(function(bool, range) {
											}, false);
										}
									});
									$("[name=lessonBookDate]").val("");
									$("[name=lessonBookDate]").attr("value", null);	// value 없는 상태로 생성 필요
								
								},
								error : function(){
									console.log("인원 수를 먼저 선택해주세요에 focus됨");
									$(".daterangepicker").remove();
									$("[name=lessonBookDate]").val("");
									$("[name=lessonBookDate]").attr("value", null);
								}
							});
						}else{
							$("[name=lessonBookDate]").val("");
							$("[name=lessonBookDate]").attr("value", null);
						}
						//가격을 계산 하는 곳
						$("[name=lessonTotalPrice]").attr("value",0);
						const result = $("[name=lessonPrice]").val()*$("[name=lessonPeople]").val();
						console.log(result);
						$(".lessonTotalPrice-choice").text($("[name=lessonPeople]").val()+"명 강습 요금 "+result+"원");
						
						$("#lessonTotalPrice").attr("value",result);
						$("[name=lessonTotalPrice]").attr("value",result);
					}); // 예약하기 modal 띄우면 실행되는 함수 끝
				});


				
//stat-count 총합 올려주는 함수
						$("#modal-okay2").on("click", function(){
							if($("[name=lessonBookDate]").val() != "" && $("[name=lessonPeople]").val() != null){
								$(".stat-count").text("0");
								const result = Number($("#roomTotalPrice").val())+Number($("[name=lessonTotalPrice]").val());
								console.log("업데이트된 결과 : "+result);
								$(".stat-count").text(result);
								//receipt에 총액 넘겨주는 함수
								$("#totalPrice-choice").attr("value",result+"원");
								//결제 모듈로 넘길 총액
								$("#totalPriceVal").attr("value",result);
								$(".totalPriceVal").text(result);
								//주문하기를 눌렀을 때 동작하는 함수
								$("#modal-cancel2").click();
								$("#lessonBook-close").click();
								alert("주문이 완료되었습니다");
								//roomBookPrice에 result값 넣어주는 함수+stat-count 숫자 변경
								console.log("옵션을 포함한 총 요금은 "+result+"원으로 계산되었습니다.");
								$("[name=roomBookPrice]").val(result);
								$(".stat-count").text("0");
								$(".stat-count").text(result);
								//주문내역에 숙소 총액,숙소 호수&이름,예약날짜 넣어주는 함수
								$(".lessonTitle-choice").text($("#modal-lesson-title").text());
								
								$(".lessonTime-choice").text($("#modal-lesson-time").text());
								
								$(".lessonDate-choice").text($("[name=lessonBookDate]").val());
								
								$(".lessonMaxNo-choice").text($("[name=lessonPeople]").val()+"명");
								
								$("#lessonPeople-choice").attr("value",$("[name=lessonPeople]").val());
								
								//stat-count 애니메이션 효과!
								$('.stat-count').each(function(){
							        $(this).prop('Counter',0).animate({
							            Counter: $(this).text()
							        },{
							            duration: 1000,
							            easing: 'swing',
							            step: function (now){
							                $(this).text(Math.ceil(now));
							            }
							        });
							    });
							}else{
								alert("원하시는 강습일과 인원을 선택해주세요");
							}
						});		

						
//뒤로가기 막기

			// 스택 추가

			history.pushState({page: 1}, null, location.href); 

			// 뒤로가기 이벤트감지 -> 현재페이지로 이동

			window.onpopstate = function() { 
				
				if($("#current-page").val() == 1){
					const result = confirm("이대로 나가시면 저장된 정보가 사라집니다 나가시겠습니까?");
					if(result == true){
						$(".page1-before").trigger("click");
					}else{
						alert("지역을 골라주세요");
					}
					
				}else if($("#current-page").val() == 2){
					  $(".page2-before").trigger("click");
				}else if($("#current-page").val() == 3){
					  $(".page3-before").trigger("click");
				}else if($("#current-page").val() == 4){
					  $(".page4-before").trigger("click");
				}else if($("#current-page").val() == 5){
					  $(".page5-before").trigger("click");
					  $("#modal-cancel").trigger("click");
					  $("#closeBtn").trigger("click");
				}else if($("#current-page").val() == 6){
					  $(".page6-before").trigger("click");
				}else if($("#current-page").val() == 7){
					  $(".page7-before").trigger("click");
					  $("#modal-cancel2").trigger("click");
					  $("#closeBtn2").trigger("click");
				}else if($("#current-page").val() == 8){
					  $(".page8-before").trigger("click");	
				}else if($("#current-page").val() == 9){
					  $(".page9-before").trigger("click");
				};
				
			history.pushState(null, null, location.href); 
				//history.go(1);
				

			};
//새로고침할때 알림창 띄워주는 것(버전이 올라가서 더 이상 문구 변경 지원을 안 해줌)
			window.addEventListener('beforeunload', (event)=>{
				event.preventDefault();
				event.returnValue = '';
				
			});
			
			// review 더보기 버튼 실행
			
			const showMoreBtn = document.querySelector('.show-more');
			const container1 = document.querySelector('.container1');
			
			showMoreBtn.addEventListener('click', function() {
			  container1.classList.toggle('show-more-open');
			  if (container1.classList.contains('show-more-open')) {
			    showMoreBtn.style.display = 'none';
			  }
			});

</script>					
</body>
</html>