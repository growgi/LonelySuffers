<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers</title>
<link rel="stylesheet" href="/resources/css/myPage.css">
<link rel="stylesheet" href="/resources/css/chat.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,100,0,-25" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,-25" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />





<!-- section은 container의 바탕(배경색)을 담당합니다. -->
<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section">
<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="main">
						<div class="main-left">
							<div class="left-content">
								<p>마이페이지</p>
								<span class="material-symbols-outlined">account_circle</span>
								<span class="sessionMemberName">${sessionScope.m.memberName }</span>
								<span class="sessionMemberEmail">${sessionScope.m.memberEmail }</span>
								<input type="hidden" value="${tabNo }" class="tabNo">
								<input type="hidden" value="${chatActivation }" class="chatActivation">
								<ul class="tab-content">
									<li>프로필관리</li>
									<li>구매내역</li>
									<li class="chatList">1대1문의<span class="chatChkSpan"></span></li>
									<c:if test="${sessionScope.m.memberGrade == 2}">
									<!-- <li><a href="/productInsert.do">판매자전용</a></li> -->
									<li><a href="/productListBySeller.do?reqPage=1">판매자전용</a></li>
							
									</c:if>
								</ul>
							</div>
						</div>
						<div class="main-right">
							<div class="right-content">
								<div class="myProfile hide-div">
								<div>
									<h2 class="h2Title">프로필 관리</h2>
									<ul style="padding: 0;">
										<li class="myProfileList">내정보 변경</li>
										<li style="width: 300px;border: 1px solid #3D4856;">
											<div>
												<form action="/updateMember.do" method="post" >
													<label for="memberId">아이디</label><br>
													<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.m.memberNo }">
													<input type="hidden" name="memberGrade" id="memberGrade" value="${sessionScope.m.memberGrade }">
													<input type="text" name="memberId" id="memberId" class="longInput" required value="${sessionScope.m.memberId }" readonly><br>
													<label for="memberName">이름</label><br>
													<input type="text" name="memberName" id="memberName" class="longInput" required value="${sessionScope.m.memberName }"><br>
													<label for="memberPhone">전화번호</label><br>
													<input type="text" name="memberPhone" id="memberPhone" class="longInput" required value="${sessionScope.m.memberPhone }"><br>
													<label for="memberEmail">이메일</label><br>
													<input type="text"  class="longInput" id="email" required value="${sessionScope.m.memberEmail }" readonly><br>
													<label for="enrollDate">가입일</label><br>
													<input type="text" name="enrollDate" class="longInput" id="enrollDate" readonly value="${sessionScope.m.enrollDate }"><br>
													<button type="submit" id="updateMemberBtn" class="button">변경</button>
												</form>
											</div>
										</li>
										<li>비밀번호 변경</li>
										<li class="hidden-li">
											<div>
												<div class="beforePassWordFrm customInput">
													<div>
													<input type="password" id="beforePassWord" name="beforePassWord" required>
													<label for="beforePassWord">이전 비밀번호</label>
													<span></span>													
													</div>
													<button type="button" class="beforePassWordBtn button">확인</button>
													</div>
												<div class="updatePassWordFrm customInput">
													<div>
													<input type="password" id="afterPassWord" name="afterPassWord" required>
													<label for="afterPassWord">새 비밀번호</label>
													<span></span>													
													</div>
													<div>
													<input type="password" name="afterPassWordRe" id="afterPassWordRe" required>
													<label for="afterPassWordRe">비밀번호 확인</label>
													<span></span>													
													</div>
													<button type="button" class="passWordChangeBtn button">변경</button>
												</div>
											</div>
										</li>
										<c:if test="${sessionScope.m.memberGrade == 3}">
											<li>판매자로 전환 신청</li>
											<li class="hidden-li">
												<div>
													<c:choose>
														<c:when test="${sellerApplication != 0}">
															<form action="/cancelSeller.do" method="post">
																<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
															<button type="submit" class="cancelSellerBtn button">신청취소</button>
															</form>
														</c:when>
														<c:otherwise>
														<form action="/sellerApplication.do" method="post">
															<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }"> 
															<button type="submit" class="sellerBtn button">판매자 신청</button>
														</form>
														</c:otherwise>
													</c:choose>
												</div>
											</li>
										</c:if>
										<li>회원 탈퇴</li>
										<li class="hidden-li">
											<div>
												<button type="button" class="dropMember button">탈퇴</button>
											</div>
										</li>
									</ul>
									</div>
								</div><!-- myProfile -->
								<div class="buyList hide-div">
								<div>
									<div class="content-top"></div>
									<div>
										<table>
											<tr>
												<td width="12%">번호</td>
												<td width="12%">주문 상품</td>
												<td width="17%">처리 상태</td>
												<td width="17%">결제 금액</td>
												<td width="27%">주문 날짜</td>
												<td width="15%">주문상세내역</td>
											</tr>
											<c:forEach items="${list }" var="o" varStatus="s">
												<tr>
													<td>${s.count}</td>
													<c:choose>
														<c:when test="${o.orderProduct == 1}">
															<td>강습</td>
														</c:when>
														<c:when test="${o.orderProduct == 2}">
															<td>숙박</td>
														</c:when>
														<c:otherwise>
															<td>강습 + 숙박</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${o.orderStatus == 1}">
															<td>결제 완료</td>
														</c:when>
														<c:otherwise>
															<td>결제 취소</td>
														</c:otherwise>
													</c:choose>
													<td><fmt:formatNumber value="${o.orderAllPrice }" pattern="#,###" />원</td>
													<td>${o.orderDate }</td>
													<td><a href="/myOrderDetail.do?orderNo=${o.orderNo }">상세확인</a></td>
												</tr>
											</c:forEach>  
										</table>
										<div>${pageNavi }</div>
									</div>
									</div>
								</div>

								<div class="adminChat hide-div">
								<div>
									<div class="chatting">
										<div class="endBtnDiv">
										<button type="button" name="startChatBtn" onclick="startChatBtn('${sessionScope.m.memberId}');">채팅시작하기</button>
										<button type="button" name="endChatBtn" onclick="endChatBtn('${sessionScope.m.memberId}');">채팅종료</button>
										</div>
										<div class="messageArea">
										</div>
										<div class="sendBox">
											<input type="text" id="sendMsg" readonly>
											<script>
											 $('#sendMsg').on('keyup',function(e){
											        if(e.keyCode == 13){
											            sendMsg();
											        }
											    });
											 </script>
											<button id="sendBtn" onClick="sendMsg();">전송</button> 
										</div>
									</div>
								</div>
								</div>
								

							</div>
						</div>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->






	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/myPage.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
	