<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <form action="/adminSearchMember.do" method="get" id="frm" class="search-bar" name="searchMember">
                <span class="material-symbols-outlined search-icon" onclick="document.getElementById('frm').submit();">search</span>
                <input type="text" placeholder="아이디로 사용자 검색" name="searchMemberId" onkeyup="enterkey();">
                <input type="submit" style="display:none;">
            </form>
	        <div class="list-wrapper">
	            <form action="/changeGrade.do" method="get" name="memberList">
	                <div class="memberList-top list-top">
	                    <div class="count">신청한 사용자 <span>${sellerAppCount }</span>명</div>
	                    <table>
	                        <tr>
	                            <th><input type="checkbox" name="memberCheck"></th>
	                            <th>이름</th>
	                            <th>아이디</th>
	                            <th>성별</th>
	                            <th>전화번호</th>
	                            <th>이메일</th>
	                            <th>가입일</th>
	                            <th>신청일</th>
	                            <th>회원 등급</th>
	                        </tr>
						<c:forEach items="${sellerAppList }" var="s">
                        <c:if test="${s.memberGrade != 4 }"> <!-- 탈퇴회원(4) 조회 X -->
                        <tr>
                            <td><input type="checkbox" name="memberCheck" class="check"></td>
                            <td>${s.memberName }</td>
                            <td>${s.memberId }</td>
                            <td>${s.memberGender }</td>
                            <td>${s.memberPhone }</td>
                            <td>${s.memberEmail }</td>
                            <td>${s.enrollDate }</td>
                            <td>${s.applicationDate }</td>
                            <td>
                            <c:choose>
                            <c:when test="${s.memberGrade == 1}">
                                <select class="grade-change">
                                    <option value="1" selected>관리자</option>
                                    <option value="2">판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:when test="${s.memberGrade == 2}">
                                <select class="grade-change">
                                    <option value="1">관리자</option>
                                    <option value="2" selected>판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select class="grade-change">
                                    <option value="1">관리자</option>
                                    <option value="2">판매자</option>
                                    <option value="3" selected>사용자</option>
                                </select>
                            </c:otherwise>
                            </c:choose>
                            </td>
                            <td>
                                <button class="changeGrade btn bc1">등급 변경</button>
                            </td>
                        </tr>
                        </c:if>
                        </c:forEach>
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
    </div>
    <script src="js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(document).ready(function(){
        $(".top-menu-title").text("판매자 신청 회원 조회");
        $(".product-choice>div").first().click();
    });
</script>
</html>