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
    .newProduct-wrapper>div{
        overflow: hidden;
    }
    .newProduct-wrapper>div>.product-choice{
        float: left;
        margin-right: 20px;
    }
    .newProduct-wrapper>div>.list-wrapper{
        width: 70%;
        float: left;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="newProduct-wrapper admin-content">
        <form action="/adminSearchMember.do" method="get"  class="search-bar" name="search-member">
            <span class="material-symbols-outlined search-icon">search</span>
            <input type="search" placeholder="상품명으로 검색" name="searchMember">
        </form>
        <div>
            <div class="product-choice">
                <div>강습</div>
                <div>숙박</div>
            </div>
            <div class="lesson-list list-wrapper">
                <form action="/changeGrade.do" method="get" name="memberList">
                    <div class="newProduct-top list-top">
                        <div class="count">전체 상품 <span>n</span></div>
                        <table>
                            <tr>
                                <th><input type="checkbox" name="memberCheck"></th>
                                <th>상품명</th>
                                <th>판매자</th>
                                <th>강습 레벨</th>
                                <th>가격</th>
                                <th>모집정원</th>
                                <th>지역</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="memberCheck"></td>
                                <td>개쉬운 서핑 너도 하자</td>
                                <td>hong123</td>
                                <td>Level1</td>
                                <td>120,000원</td>
                                <td>40명</td>
                                <td>강원도</td>
                                <td><a href="#">신청폼 확인</a></td>
                                <td><input type="submit" value="승인" class="btn bc1"></td>
                            </tr>
                        </table>
                        <div></div>
                    </div>
                    <div class="list-bottom">
                        <div>
                            <input type="submit" value="선택 상품 승인" class="btn bc1">
                        </div>
                    </div>
                </form>
            </div>
            <div class="house-list list-wrapper" style="display:none;">
                <form action="/changeGrade.do" method="get" name="memberList">
                    <div class="newProduct-top list-top">
                        <div class="count">전체 상품 <span>n</span></div>
                        <table>
                            <tr>
                                <th><input type="checkbox" name="memberCheck"></th>
                                <th>상품명</th>
                                <th>판매자</th>
                                <th>숙박소 이름</th>
                                <th>가격</th>
                                <th>객실 인원</th>
                                <th>지역</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="memberCheck"></td>
                                <td>가격 실화? 멋지다 짜잔호텔</td>
                                <td>hong123</td>
                                <td>짜잔호텔</td>
                                <td>200,000원</td>
                                <td>6인실</td>
                                <td>강원도</td>
                                <td><a href="#">신청폼 확인</a></td>
                                <td><input type="submit" value="승인" class="btn bc1"></td>
                            </tr>
                        </table>
                        <div></div>
                    </div>
                    <div class="list-bottom">
                        <div>
                            <input type="submit" value="선택 상품 승인" class="btn bc1">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(document).ready(function(){
        $(".top-menu-title").text("신규 상품 승인");
        $(".product-choice>div").first().click();
    });

</script>
</html>