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
            <form action="/adminSearchCarpool.do" method="get"  class="search-bar" name="search-member">
					<!-- <span class="material-symbols-outlined search-icon">search</span>  -->
					<input
						type="text" placeholder="운전자 아이디로 카풀 게시글 조회" name="searchKeyword"
						onkeyup="enterkey();">
                        <div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
            </form>
            <div class="list-wrapper">
                <div class="carpoolList-top list-top">
                    <div class="count">게시물 <span>${carpoolCount }</span>건</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="carpoolCheck" class="all-check"></th>
                            <th>운전자 아이디</th>
                            <th style="width:100px;">편도/왕복</th>
                            <th>출발지/도착지</th>
                            <th>모집인원</th>
                            <th>출발일</th>
                            <th>마감여부</th>
                            <th></th>
                        </tr>
                        <c:choose>
						<c:when test="${empty carpoolList }">
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
                        <c:forEach items="${carpoolList }" var="c">
                        <tr>
                            <td><input type="checkbox" name="orderCheck" class="check"></td>
                            <td style="display:none;">${c.carpoolNo}</td>
                            <td>${c.driverId }</td>
                            <td>
                            <c:choose>
                           		<c:when test="${c.onewayRound == 1 }">
                           		편도
                           		</c:when>
                           		<c:otherwise>
                           		왕복
                           		</c:otherwise>
                           	</c:choose>
                            </td>
                            <td>
                            ${c.departureRegion }/${c.arrivalRegion }
                            </td>
                            <td>${c.capacity }명</td>
                            <td>${c.departureDate }</td>
                            <td style="color:#19A7CE">
                            <c:choose>
                           		<c:when test="${c.closure == 1 }">
                           		마감
                           		</c:when>
                           		<c:when test="${c.closure == 2 }">
                           		모집중
                           		</c:when>
                           		<c:when test="${c.closure == 3 }">
                           		삭제
                           		</c:when>
                           	</c:choose>
                            </td>
                            <td><a href="/carpoolRequest.do?carpoolNo=${c.carpoolNo }" class="btn-r bc5" style="width:150px">게시글 상세보기</a></td>
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
                        <button class="deleteCheckedCarpool-btn btn-m bc2">게시글 삭제</button>
                        <button class="deleteCheckedCarpool" style="display:none;">게시글 삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(document).ready(function(){
        $(".top-menu-title").text("게시물 관리");
        $(".menu-detail>li>a").eq(5).addClass("active-menu-click");
    });
    
    /*게시글 삭제*/
    $(".deleteCheckedCarpool-btn").on("click",function(){
        const result = confirm("해당 게시글을 삭제하시겠습니까?");
    
        if(result == true) {
            $(this).next().click();
            alert("성공적으로 삭제되었습니다.");
        } else {
            alert("해당 작업이 취소되었습니다.");
        }
    });

    //체크박스 선택상품
	$(".deleteCheckedCarpool").on("click", function() {
		const check = $(".check:checked");

		if (check.length == 0) {
			alert("선택된 게시글이 없습니다.");
			return;
		}

		//체크된 카풀 번호 저장 배열
		const no = new Array();

		//체크된 체크박스 기준으로 해당 카풀 번호를 찾아서 배열에 넣는 작업
		check.each(function(index, item) {
			//클릭한 버튼 기준으로 해당 상품 번호
			const carpoolNo = $(item).parent().next().text();
			no.push(carpoolNo);
		});

		location.href = "/deleteCheckedCarpool.do?no=" + no.join("/");
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