<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
    	<div>
            <form action="/searchSellerAppMember.do" method="get" id="frm" class="search-bar" name="searchMember">
                <input type="text" placeholder="아이디로 사용자 검색" name="searchMemberId" onkeyup="enterkey();">
                <span class="material-symbols-outlined search-icon">search</span>
            </form>
	        <div class="list-wrapper">
                <div class="memberList-top list-top">
                    <div class="count">신청한 사용자 <span>${sellerAppCount }</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck" class="all-check"></th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>성별</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>신청일</th>
                            <th>현재 등급</th>
                        </tr>
						<c:forEach items="${sellerAppList }" var="s">
						<tr>
						    <td><input type="checkbox" name="memberCheck" class="check" value="${s.memberNo }"></td>
						    <td>${s.memberName }</td>
						    <td>${s.memberId }</td>
						    <td>
						    <c:choose>
                            <c:when test="${s.memberGender == 1}">
                            	남
                            </c:when>
                            <c:when test="${s.memberGender == 2}">
                            	여
                            </c:when>
                            </c:choose>
						    </td>
						    <td>${s.memberPhone }</td>
						    <td>${s.memberEmail }</td>
						    <td>${s.enrollDate }</td>
						    <td>${s.applicationDate }</td>
						    <td>
						    <c:choose>
						    <c:when test="${s.memberGrade == 2}">
						        <select class="grade-change">
						            <option value="2" selected>판매자</option>
						            <option value="3">사용자</option>
						        </select>
						    </c:when>
						    <c:otherwise>
						        <select class="grade-change">
						            <option value="2">판매자</option>
						            <option value="3" selected>사용자</option>
						        </select>
						    </c:otherwise>
						    </c:choose>
						    </td>
						</tr>
						</c:forEach>
                    </table>
                    <div></div>
                </div>
                <div class="list-bottom">
                    <div>
                        <button class="checkedChangeGradeSeller btn bc1">선택회원 판매자로 전환</button>
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
        $(".top-menu-title").text("판매자 신청 회원 조회");
        $(".product-choice>div").first().click();
    });
    
  	//체크박스 선택회원
    $(".checkedChangeGradeSeller").on("click",function(){
        const check = $(".check:checked");

        if(check.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        //체크된 회원아이디 저장 배열
        const id = new Array();
        const no = new Array();

        //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
        check.each(function(index,item){
            const memberId = $(item).parent().parent().children().eq(2).text();
            id.push(memberId);
            
            const checkMemberNo = $(item).val();
            no.push(checkMemberNo);
        });

        location.href="/checkedChangeGradeSeller.do?id="+id.join("/")+"&no="+no.join("/");
    });
  	
  	$(".check").on("click",function(){
  		const check = $(".check:checked").val();
        console.log(check);
  	});
</script>
</html>