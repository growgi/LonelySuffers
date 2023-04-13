<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="resources/css/adminCommon.css"></link>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Delicious+Handrawn&display=swap" rel="stylesheet">
<style>
    /*전체*/
    .admin-menu-wrapper{
        position: relative;
        color: #fff;
    }


    /*메뉴 상단*/
    .top-menu-background{
        /*background-image: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);*/
        background-color: #146C94;
        overflow: hidden;
        position: relative;
        box-shadow: 0 2px 2px 2px rgba(233, 233, 233, 0.19), 0 1px 1px 1px rgba(223, 223, 223, 0.23);
    }
    .top-menu-title{
        font-size: 24px;
        font-weight: 600;
        position: absolute;
        left: 280px;
        line-height: 70px;
        color:#f3faf1;
    }

    .admin-icon{
        float: right;
        background-color: #fff;
        border-radius:40px;
        width: 40px;
        height: 40px;
        margin: 15px;
        margin-right: 20px;
        text-align: center;
        cursor: pointer;
    }
    .admin-icon>span{
        line-height: 40px;
        color: black;
    }

    
    /*링크 박스*/
    .admin-menu-wrapper>.link-box{
        width: 300px;
        position: absolute;
        z-index: 1;
        top: 60px;
        right: 20px;
        border-radius: 5px;
        box-shadow: 0 5px 5px rgba(170, 170, 170, 0.25), 0 5px 5px rgba(194, 194, 194, 0.22);
        background-color: #fff;
    }
    .admin-icon2{
        font-size: 40px;
        margin-right: 5px;
    }
    .box-top{
        padding: 20px;
        padding-top: 25px;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        background-color: rgb(48,48,48);
    }
    .box-top>div:first-child{
        display: flex;
    }
    .box-top>div>div>div:first-of-type {
        font-weight: 900;
        font-size: 18px;
    }
    .box-top>div>div>div:first-of-type>span{
        color: crimson;
    }
    .box-top>div>div>div:last-of-type {
        font-size: 14px;
    }
    .box-bottom{
    	height: 150px;
        padding: 20px;
        position: relative;
    }
    .box-bottom>div{
        margin-bottom: 7px;
        font-size: 16px;
        display: flex;
    }
    .box-bottom>div>a{
        margin-left: 5px;
    }
    .link-icon {
        color: #303030;
    }

    /*왼쪽 메뉴*/
    .left-menu{
        background-color: #0a2647;
        width: 250px;
        z-index: 1;
        height: 100vh;
        overflow: auto;
        position: fixed;


    }
    .left-menu-title{
        font-size: 24px;
        font-weight: 900;
        padding: 70px 25px 40px 25px ;
        
    }
    .waveEffectWord-back{
        color: #f7f7f7;
        font-size: 2.5em;
        color:rgba(255, 255, 255, 0.8);
    }
    .left-menu-list>li>div{
        display: flex;
        font-size: 18px;
        font-weight: 900;
    }
    .menu-detail-title{
        padding: 15px;
        padding-left: 25px;
        position: relative;
        color: #e4f0e1;
    }
    .right-navi{
        position: absolute;
        right: 15px;
    }
    .menu-detail-title>div{
        margin-left: 10px;
        font-size: 18px;
        color:rgba(255, 255, 255, 0.9);
    }
    .menu-detail>li>a{
        display: block;
        padding: 15px;
        padding-left: 50px;
        font-size: 16px;
        color: rgb(173, 173, 173);
        text-decoration: none;
    }
    .menu-detail>li>a:hover{
        background-color: #061629;
    }
	.logout-btn{
		width: 260px;
		position: absolute;
		bottom: 20px;
		right: 20px;
	}
    /*변화*/
    .active-admin-icon{
        background-color: #dfdfdf;
    }
    .menu-detail-title>li:hover{
        background-color: rgb(37, 37, 37);
    }
    .action-menu-detail{
        background-color: rgb(37, 37, 37);
    }
    .action-menu-detail-one{
        background-color: rgb(22, 22, 22);
    }
</style>
<div class="admin-menu-wrapper">
<div class="left-menu">
    <div class="left-menu-wrapper">
        <div class="left-menu-title">
            <a href="/">
                <div class="waveEffect">
                    <p class="waveEffectWord-back" style="font-family: 'Delicious Handrawn', cursive;">Lonely Surfers</p>
                </div>
            </a>
        </div>
        <div class="left-menu-content">
            <ul class="left-menu-list">
                <li>
                    <div class="menu-detail-title">
                        <span class="material-symbols-outlined">deployed_code</span>
                        <div>Dashboard</div>
                    </div>
                </li>
                <li>
                    <div class="menu-detail-title">
                        <span class="material-symbols-outlined">group</span>
                        <div>회원관리</div>
                        <!-- <span class="material-symbols-outlined right-navi">chevron_right</span> -->
                    </div>
                    <ul class="menu-detail">
                        <li><a href="/memberList.do">회원 목록</a></li>
                        <li><a href="/sellerApplicationList.do">판매자 신청 회원 조회</a></li>
                    </ul>
                </li>
                <li>
                    <div class="menu-detail-title">
                        <span class="material-symbols-outlined">inventory</span>
                        <div>상품 관리</div>
                        <!-- <span class="material-symbols-outlined right-navi">chevron_right</span> -->
                    </div>
                    <ul class="menu-detail">
                        <li><a href="/newProductLesson.do">신규 상품 승인</a></li>
                        <li><a href="/productListLesson.do">등록된 상품 관리</a></li>
                        <li><a href="/salesDetails.do">판매 내역</a></li>
                    </ul>
                </li>
                <li>
                    <div class="menu-detail-title">
                        <span class="material-symbols-outlined">fact_check</span>
                        <div>문의사항 관리</div>
                        <!-- <span class="material-symbols-outlined right-navi">chevron_right</span> -->
                    </div>
                    <ul class="menu-detail">
                        <li><a href="/adminChat.do">1:1 문의</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
    <div class="link-box" style="display:none">
        <div class="box-top">
            <div>
                <span class="material-symbols-outlined admin-icon2">admin_panel_settings</span>
                <div>
                    <div><span>${sessionScope.m.memberName}</span> 관리자</div>
                    <div>${sessionScope.m.memberEmail}</div>
                </div>
            </div>
        </div>
        <div class="box-bottom">
            <div>
                <span class="material-symbols-outlined link-icon">home</span>
                <a href="/">홈으로 이동</a>
            </div>
            <div>
                <span class="material-symbols-outlined link-icon">notifications_active</span>
                <a href="/noticeList.do?reqPage=1">공지사항으로 이동</a>
            </div>
            <div>
                <span class="material-symbols-outlined link-icon">help</span>
                <a href="/faqList.do">FAQ로 이동</a>
            </div>
            <button name="logout" class="btn bc1 logout-btn">로그아웃</button>
        </div>
    </div>
    <div class="top-menu">
        <div class="top-menu-background">
            <div class="top-menu-title">회원 목록</div>
            <div class="admin-icon"><span class="material-symbols-outlined">link</span></div>
        </div>
    </div>
</div>
<script>
    /*admin-icon*/
    $(".admin-icon").on("click",function(){
        $(".link-box").fadeToggle(200);
        $(this).toggleClass("active-admin-icon");
    });

    /*왼쪽 메뉴
    $(".menu-detail-title").on("click",function(){
        //$(".menu-detail-title").next().hide();
        $(".menu-detail-title").parent().removeClass("action-menu-detail");

        //$(this).next().slideToggle();
        $(this).parent().toggleClass("action-menu-detail");
    });
    $(".menu-detail>li").on("mouseover",function(){
        $(this).css("background-color","rgb(22, 22, 22)");
    });
    $(".menu-detail>li").on("mouseout",function(){
        $(this).css("background-color","rgb(37, 37, 37)");
    });
    $(".menu-detail>li").on("click",function(){
        $(this).css("background-color","rgb(22, 22, 22)");
    });*/
</script>