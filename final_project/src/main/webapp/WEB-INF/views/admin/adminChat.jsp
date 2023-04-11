<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul>li{
	overflow: hidden;
	}
	ul>li>div{
		float: left;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
	<div class="admin-content">
		<div>
			<ul>
				<c:forEach items="${list }" var="ca" varStatus="status">
					<li><div>${status.count}</div><div>${ca.memberId }</div>
					<c:choose>
						<c:when test="${ca.chatActivation == 1 }">
							<div>채팅중</div>
						</c:when>
						<c:otherwise>
							<div>채팅종료</div>
						</c:otherwise>					
					</c:choose>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
</body>
</html>