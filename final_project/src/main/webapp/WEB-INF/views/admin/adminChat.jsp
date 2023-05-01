<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminChat.css">
<style>

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="admin-content">
		<input type="hidden" class="hiddenMemberGrade"
		value="${sessionScope.m.memberGrade }">
		<div class="adminChatContent">
			<c:if test="${not empty sessionScope.m }">
				<input type="hidden" name="chatMemberId"
					value="${sessionScope.m.memberId }">
			</c:if>
			<div class="count">
				1:1 문의 <span>${adminChatCount }</span>건
			</div>
			<ul>
				<li>
					<div class="th">
						<div class="td" style="width:15%">문의번호</div>
						<div class="td" style="width:30%">문의자</div>
						<div class="td" style="width:30%">최근 채팅 시간</div>
						<div class="td" style="width:25%">채팅 종료 여부</div>
					</div>
				</li>
				<c:forEach items="${list }" var="ca" varStatus="status">
					<li><div class="active_chat_title" value="${ca.memberId }">
							<input type="hidden" class="memberId" value="${ca.memberId }">
							<div class="td" style="width:15%">${status.count }</div>
							<div class="td" style="width:30%;">${ca.memberId }</div>
							<div class="td timeDiv" style="width:30%"></div>
							<c:choose>
							<c:when test="${ca.chatActivation == 1}">
								<div class="td" style="width:25%; color:#19A7CE;">
								채팅중
								</div>
							</c:when>
							<c:otherwise>
								<div class="td" style="width:25%">
								채팅종료
								</div>
							</c:otherwise>
							</c:choose>
						</div></li>
					<div> <!--이거 li를 div로 바꿔도 되겠지?-->
						<div class="chatting">
							<div class="adminMessageArea"></div>
							<div class="sendBox">
								<input type="text" class="adminSendInput">
								<button id="adminSendBtn"
									onClick="adminSendMsg('${ca.memberId }');">전송</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</ul>
		</div>
		<div class="list-bottom"></div>	
	</div>

	<script src="/resources/js/adminChat.js"></script>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/chat.js"></script>
</body>
<script>
	/*메뉴 제목*/
	$(function(){
        $(".top-menu-title").text("1:1 문의");
        $(".menu-detail>li>a").eq(6).addClass("active-menu-click");
    });
</script>
</html>