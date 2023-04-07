<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonly Suffers</title>
<link rel="stylesheet" href="/css/myPage.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,100,0,-25" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
								<ul class="tab-content">
									<li>프로필관리</li>
									<li>구매내역</li>
									<li>1대1문의</li>
									<c:if test="${sessionScope.m.memberGrade == 2}">
									<li>판매자전용</li>
									</c:if>
								</ul>
							</div>

						</div>
						<div class="main-right">
							<div class="right-content">
								<div class="myProfile">
									<h2>프로필 관리</h2>
									<ul>
										<li>내정보 변경</li>
										<li>
											<div>
												<form action="/updateMember.do" method="post">
													<label for="memberId">아이디</label><br>
													<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.m.memberNo }">
													<input type="hidden" name="memberGrade" id="memberGrade" value="${sessionScope.m.memberGrade }">
													<input type="text" name="memberId" id="memberId" class="longinput" required value="${sessionScope.m.memberId }" readonly><br>
													<label for="memberName">이름</label><br>
													<input type="text" name="memberName" id="memberName" class="longinput" required value="${sessionScope.m.memberName }"><br>
													<label for="memberName">전화번호</label><br>
													<input type="text" name="memberPhone" id="memberPhone" class="longinput" required value="${sessionScope.m.memberPhone }"><br>
													<label for="memberEmail">이메일</label><br>
													<input type="text" name="email" class="longinput" id="email" required value="${sessionScope.m.memberEmail }"><br>
													<label for="enrollDate">가입일</label><br>
													<input type="text" name="enrollDate" class="longinput" id="enrollDate" readonly value="${sessionScope.m.enrollDate }">
												</form>
											</div>
										</li>
										<li>비밀번호 변경</li>
										<li class="hidden-li">
											<div>
												<div class="beforePassWordFrm">
													<label for="beforePassWord">이전 비밀번호</label><br>
													<input type="password" id="beforePassWord" name="beforePassWord" required placeholder="이전 비밀번호"><br>
													<button type="button" class="beforePassWordBtn">확인</button>
													</div>
												<div class="updatePassWordFrm">
													<label for="afterPassWord">새 비밀번호</label><br>
													<input type="password" id="afterPassWord" name="afterPassWord" required placeholder="새 비밀번호"><br>
													<label for="afterPassWordRe">비밀번호 확인</label><br>
													<input type="password" name="afterPassWordRe" id="afterPassWordRe" required placeholder="새 비밀번호 확인"><br>
													<button type="button" class="passWordChangeBtn">변경</button>
												</div>
											</div>
										</li>
										<c:if test="${sessionScope.m.memberGrade == 3}">
											<li>판매자로 전환 신청</li>
											<li class="hidden-li">
												<div>
													<c:choose>
														<c:when test="${sellerApplication != 0}">
															<button type="button" class="cancelSellerBtn">신청취소</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="sellerBtn">판매자 신청</button>
														</c:otherwise>
													</c:choose>
												</div>
											</li>
										</c:if>
										<li>회원 탈퇴</li>
										<li class="hidden-li">
											<div></div>
										</li>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->






	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/myPage.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>