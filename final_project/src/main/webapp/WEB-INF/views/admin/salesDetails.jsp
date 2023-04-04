<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/adminTable.css"></link>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <form action="/adminSearchMember.do" method="get"  class="search-bar" name="search-member">
            <span class="material-symbols-outlined search-icon">search</span>
            <input type="search" placeholder="아이디로 사용자 검색" name="searchMember">
        </form>
        <div class="list-wrapper">
            <form action="/changeGrade.do" method="get" name="memberList">
                <div class="memberList-top list-top">
                    <div class="count">전체 사용자 <span>n</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck"></th>
                            <th>주문번호</th>
                            <th>아이디</th>
                            <th>주문상품</th>
                            <th>총 결재금액</th>
                            <th>주문날짜</th>
                            <th>처리상태</th>
                            <th></th>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="memberCheck"></td>
                            <td>4</td>
                            <td>hong123</td>
                            <td>숙박</td>
                            <td>65,000원</td>
                            <td>결제완료</td>
                            <td><a href="#">주문 상세</a></td>
                        </tr>
                    </table>
                    <div></div>
                </div>
                <div class="list-bottom">
                    <div>
                        <input type="submit" value="등급 변경" class="btn bc1">
                    </div>
                </div>
            </form>
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