<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<style>
	table th:last-child{
		width: 180px;
	}
	.orderList-top .btn-r{
		width: 150px;
	}	
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <div>
        	<input type="hidden" value="${hiddenVal }" class="hidden-input">
            <form action="/adminSearchMemberSalesDetails.do" method="get"  class="search-bar" name="search-member">
                	<select name="searchType" class="search-type">
						<option value="i">아이디</option>
						<option value="op">주문상품</option>
					</select>
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="검색어를 입력하세요" name="searchKeyword"
						onkeyup="enterkey();">
                        <div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
            </form>
            <div class="list-wrapper">
                <div class="orderList-top list-top">
                    <div class="count">판매내역 <span>${orderCount }</span>건</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="orderCheck" class="all-check"></th>
                            <th style="width:100px;">주문번호</th>
                            <th>아이디</th>
                            <th style="width:100px;">주문상품</th>
                            <th>총 결제금액</th>
                            <th>주문날짜</th>
                            <th>처리상태</th>
                            <th>주문 상세</th>
                        </tr>
                      	<c:choose>
						<c:when test="${empty orderList }">
						<tr>
							<td colspan="8">
							    <div class="noInfo-wrapper">
							        <div>
							            <span class="material-symbols-outlined noInfo-icon">info</span>
							            <div class="noInfo-text">조회된 정보가 없습니다.</div>
							        </div>
							    </div>
						    </td>
						</tr>
						</c:when>
						<c:otherwise>
                        <c:forEach items="${orderList }" var="o">
                        <tr>
                            <td><input type="checkbox" name="orderCheck" class="check"></td>
                            <td>${o.orderNo }</td>
                            <td>${o.memberId }</td>
                            <td>${o.orderProductString }</td>
                            <td><span><fmt:formatNumber value="${o.orderAllPrice }" pattern="#,###" /></span>원</td>
                            <td>${o.orderDate }</td>
                            <td style="color:#19A7CE">${o.orderStatusString }</td>
                            <td><a href="/orderDetail.do?orderNo=${o.orderNo }" class="btn-r bc5">주문 상세 내역</a></td>
                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                    </table>
                    <div id="pageNavi">
                    	${pageNavi }
                    </div>
                </div>
                <div class="list-bottom">
                    <div>
                        <button class="deleteCheckedOrder-btn btn-m bc2">선택 내역 삭제</button>
                        <button class="deleteCheckedOrder" style="display:none;">선택 내역 삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(function(){
        $(".top-menu-title").text("상품 판매내역");
        $(".menu-detail>li>a").eq(4).addClass("active-menu-click");
    });
    
    /*내역 삭제*/
    //1개
	$(".deleteOrder").on("click", function() {
		//클릭한 버튼 기준으로 해당 주문 번호
		const orderNo = $(this).parent().children().eq(2).text();

		location.href = "/deleteOrder.do?orderNo="+orderNo;
	});

    $(".deleteCheckedOrder-btn").on("click",function(){
        const result = confirm("해당 내역을 삭제하시겠습니까?");
    
        if(result == true) {
            $(this).next().click();
            alert("성공적으로 삭제되었습니다.");
        } else {
            alert("해당 작업이 취소되었습니다.");
        }
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
    

	/*검색 결과에 count 출력 삭제*/
	$(function(){
	    if($('.hidden-input').val()==1) {
	        $(".count").hide();
	    } else {
	        $(".count").show();
	    }
	});
</script>
</html>