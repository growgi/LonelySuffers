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
.adminChatContent>ul>li>div {
	overflow: hidden;
}

.adminChatContent>ul>li>div>div {
	float: left;
}

.chatting {
	display: none;
}

.active_chat_content {
	display: block;
}

.adminMessageArea {
	overflow-y: auto;
	border: 1px solid black;
	height: 550px;
	width: 500px;
	display: flex;
	flex-direction: column;
	background-color: #b2c7d9;
}

.chat {
	margin-bottom: 10px;
	padding: 8px;
	border-radius: 3px;
}
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
			<c:forEach items="${list }" var="ca" varStatus="status">
				<ul>
					<li><div class="active_chat_title" value="${ca.memberId }">
							<input type="hidden" class="memberId" value="${ca.memberId }">
							<div class="td">${status.count }</div>
							<div class="td">${ca.memberId }</div>
							<div class="td timeDiv"></div>
							<div class="td">
								<c:choose>
									<c:when test="${ca.chatActivation == 1}">
								채팅중
							</c:when>
									<c:otherwise>
								채팅종료
							</c:otherwise>
								</c:choose>
							</div>
						</div></li>
					<li>
						<div class="chatting">
							<div class="adminMessageArea"></div>
							<div class="sendBox">
								<input type="text" class="adminSendInput">
								<button id="adminSendBtn"
									onClick="adminSendMsg('${ca.memberId }');">전송</button>
							</div>
						</div>
					</li>

				</ul>
			</c:forEach>
			<button type="button" name="divValue">DIV벨류체크</button>
		</div>
	</div>

	<script src="/resources/js/adminChat.js"></script>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/chat.js"></script>
</body>
</html>