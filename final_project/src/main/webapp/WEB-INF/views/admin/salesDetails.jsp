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
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <div>
            <form action="/adminSearchMemberSalesDetails.do" method="get"  class="search-bar" name="search-member">
                	<select name="searchType" class="search-type">
						<option value="i">아이디</option>
						<option value="o">주문상품</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="searchKeyword"
						onkeyup="enterkey();"> <input type="submit"
						style="display: none;">
					<div class="search-icon">검색</div>
            </form>
            <div class="list-wrapper">
                <div class="orderList-top list-top">
                    <div class="count">판매내역 <span>${orderCount }</span>건</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="orderCheck" class="all-check"></th>
                            <th>주문번호</th>
                            <th>아이디</th>
                            <th>주문상품</th>
                            <th>총 결제금액</th>
                            <th>주문날짜</th>
                            <th>처리상태</th>
                            <th>주문 상세</th>
                        </tr>
                        <c:forEach items="${orderList }" var="o">
                        <tr>
                            <td><input type="checkbox" name="orderCheck" class="check"></td>
                            <td>${o.orderNo }</td>
                            <td>${o.memberId }</td>
                            <td>${o.orderProductString }</td>
                            <td><span>${o.orderAllPrice }</span>원</td>
                            <td>${o.orderDate }</td>
                            <td>${o.orderStatusString }</td>
                            <td><a href="/orderDetail.do?orderNo=${o.orderNo }">주문 상세 내역</a></td>
                        </tr>
                        </c:forEach>
                    </table>
                    <div></div>
                </div>
                <div class="list-bottom">
                    <div>
                        <button class="deleteCheckedOrder btn bc1">선택 내역 삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(document).ready(function(){
        $(".top-menu-title").text("판매 내역");
    });
    
    /*내역 삭제*/
    //1개
	$(".deleteOrder").on("click", function() {
		//클릭한 버튼 기준으로 해당 주문 번호
		const orderNo = $(this).parent().children().eq(2).text();

		location.href = "/deleteOrder.do?orderNo="+orderNo;
	});

    
    //체크박스 선택상품
	$(".deleteCheckedOrder").on("click", function() {
		const check = $(".check:checked");

		if (check.length == 0) {
			alert("선택된 회원이 없습니다.");
			return;
		}

		//체크된 상품 번호 저장 배열
		const no = new Array();

		//체크된 체크박스 기준으로 해당 상품 번호를 찾아서 배열에 넣는 작업
		check.each(function(index, item) {
			//클릭한 버튼 기준으로 해당 상품 번호
			const orderNo = $(item).parent().next().text();
			no.push(orderNo);
		});

		location.href = "/deleteCheckedOrder.do?no=" + no.join("/");
	});
</script>
</html>