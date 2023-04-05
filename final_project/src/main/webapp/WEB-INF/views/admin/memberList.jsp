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
<style>
    .list-bottom>div{
        display: flex;
    }
    .list-bottom>div>.btn:last-of-type{
        display: block;
        margin-left: 10px;
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <form action="/adminSearchMember.do" method="get"  class="search-bar" name="search-member">
            <span class="material-symbols-outlined search-icon">search</span>
            <input type="search" placeholder="아이디로 사용자 검색" name="searchMember">
        </form>
        <div class="list-wrapper">
            <form action="/changeGrade.do" method="get" name="memberList">
            <input type="hidden" name="memberId" value="${m.memberId }">
                <div class="memberList-top list-top">
                    <div class="count">전체 사용자 <span>n</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck"></th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>성별</th>
                            <th>전화번호</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>회원 등급</th>
                        </tr>
                        <c:forEach items="${memberList }" var="m">
                        <tr>
                        
                            <td><input type="checkbox" name="memberCheck"></td>
                            <td>${m.memberName }</td>
                            <td>${m.memberId }</td>
                            <td>${m.memberGender }</td>
                            <td>${m.memberPhone }</td>
                            <td>${m.memberEmail }</td>
                            <td>${m.enrollDate }</td>
                            <td>
                            <c:choose>
                            <c:when test="${m.memberGrade == 1}">
                                <select name ="updateMemberGrade" class="grade-change">
                                	<option value="1" selected>관리자</option>
                                    <option value="2">판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:when test="${m.memberGrade == 2}">
                                <select name ="updateMemberGrade" class="grade-change">
                                	<option value="1">관리자</option>
                                    <option value="2" selected>판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                            	<select name ="updateMemberGrade" class="grade-change">
                            		<option value="1">관리자</option>
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
                        <input type="submit" value="등급 변경" class="btn bc1">
                        <a href="#" class="btn bc1">회원 탈퇴</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    $(".search-bar>input").on("click",function(){
        $(this).toggleClass("active-search-bar");
    });
</script>
</html>