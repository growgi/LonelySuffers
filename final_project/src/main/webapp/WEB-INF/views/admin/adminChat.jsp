<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
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
			<ul class="topUl">
				<li >
					<div class="th">
						<div class="td" style="width:15%">문의번호</div>
						<div class="td" style="width:30%">문의자</div>
						<div class="td" style="width:30%">최근 채팅 시간</div>
						<div class="td" style="width:25%">채팅 종료 여부</div>
					</div>
				</li>
				<div class="activeDiv" style="display: none"></div>
				<c:forEach items="${list }" var="ca" varStatus="status">
				<c:if test="${ca.chatActivation == 1 }">
					<li><div class="active_chat_title" value="${ca.memberId }">
							<input type="hidden" class="memberId" value="${ca.memberId }">
							<div class="td" style="width:15% ;float: left;">${status.count }</div>
							<div class="td" style="width:30%; float: left;">${ca.memberId }</div>
							<div class="td timeDiv" style="width:30% ;float: left;"></div>
							<c:choose>
							<c:when test="${ca.chatActivation == 1}">
								<div class="td" style="width:25%; color:#19A7CE; float: left;">
								채팅중
								</div>
							</c:when>
							<c:otherwise>
								<div class="td" style="width:25%; float: left;">
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
					</c:if>
				</c:forEach>
				<li class="hiddenLI" style="display: none"></li>
				<div class="hiddenDiv" style="display: none"></div>
				<c:forEach items="${list }" var="ca" varStatus="status">
				<c:if test="${ca.chatActivation == 2 }">
					<li><div class="active_chat_title" value="${ca.memberId }">
							<input type="hidden" class="memberId" value="${ca.memberId }">
							<div class="td" style="width:15% ;float: left;">${status.count }</div>
							<div class="td" style="width:30%; float: left;">${ca.memberId }</div>
							<div class="td timeDiv" style="width:30% ;float: left;"></div>
							<c:choose>
							<c:when test="${ca.chatActivation == 1}">
								<div class="td" style="width:25%; color:#19A7CE; float: left;">
								채팅중
								</div>
							</c:when>
							<c:otherwise>
								<div class="td" style="width:25%; float: left;">
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
					</c:if>
				</c:forEach>
			</ul>
		</div>
		
		<div class="list-bottom"><button class="upBtn" style="width: 100px">up</button></div>	
		<script type="text/javascript">
			$('.upBtn').on('click',function(){
				const li = $('.active_chat_title').eq(2).parent();
				console.log(li);
				const chatDiv = $('.active_chat_title').eq(2).parent().next();
				$('.topUl').children().eq(0).after(li);
				$('.topUl').children().eq(1).after(chatDiv);
			})
		</script>
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