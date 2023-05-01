<%@page import="kr.co.carpool.model.vo.Carpool"%>
<%@page import="kr.co.carpool.model.vo.Passenger"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운전자 페이지</title>
</head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Surfers-Carpool Main</title>
<link rel="stylesheet" href="resources/css/carpool/carpoolMain.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
.buttons button {
	background-color: #FFACAC;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 10px 20px;
	margin-right: 30px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	color: white;
}

.buttons button:hover {
	background-color: #FBFFB1;
	color: black;
}

.category:hover a{
	font-size: 1.1em;
	font-weight: 800;
}
</style>
</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section transheader homepage parallax"
			style="background-image: url('resources/images/carpool/surftruck2.png'); opacity: 0.7">
			<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="title"
						style="padding-top: 100px; padding-left: 40px; color: #000;">
						<h2 style="color: black;">카풀</h2>
						<h3 style="color: black; font-weight: bold;">함께하면 더 즐거운 서핑!</h3>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

		<section class="section"
			style="padding-top: 50px; padding-bottom: 10px;">
			<div class="container">
				<div class="row"
					style="padding-left: 120px; padding-bottom: 20px; padding-right: 140px; border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="carpoolMain.do">전체보기</a>
						</p>
					</div>
					<div class="col-md-2">
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="/driverPage.do?driverNo=${sessionScope.m.memberNo }">태워드려요</a>
								</p>
							</c:when>
							<c:otherwise>
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="#" onclick="alert('로그인하고 이용해주세요.');">태워드려요</a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-2">
						<c:choose>
							<c:when test="${not empty sessionScope.m }">
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="/passengerPage.do?memberNo=${sessionScope.m.memberNo }">태워주세요</a>
								</p>
							</c:when>
							<c:otherwise>
								<p class="category" style="font-weight: 900; font-size: 20px;">
									<a href="#" onclick="alert('로그인하고 이용해주세요.');">태워주세요</a>
								</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="menu" style="float: right;">
						<h3 style="color: #1A5F7A; text-shadow: 0 0 2px #fff; font-weight: 900;">운전자 페이지</h3>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<section class="section" style="padding: 20px 0 20px 0;">
			<div class="container" style="margin-top: 10px; margin-bottom: 10px;">
				<div class="row">
					<div class="wrapper" style="border-radius: 20px;">
						<div
							style="display: inline-block; width: 45%; font-size: 20px; font-weight: 900;"><span id="driverName"></span>님, 탑승
							신청을 보내온 카풀 목록입니다.</div>
						<div class="big-wrapper">
									<c:forEach items="${list}" var="c">
									<hr>
								<div class="wrapper" style="background-color: #FFF3E2; border-radius: 30px; width: 800px; margin: 0 auto;">
									<div class="head-info"
										style="text-align: center; background-color: #FFDEB4; padding: 10px; border-top-left-radius: 20px; border-top-right-radius: 20px;">
										<h3 style=>${c.departureDate }(${c.returnTimeRange })</h3>
										<h3>탑승인원/모집인원 : <span class="reserved">${c.reserved }</span>/${c.capacity }명</h3>
										<h3>${c.departureRegion }(${c.departureDistrict}) → ${c.arrivalRegion }(${c.arrivalDistrict})</h3>
										<input type="hidden" name="substract" value=${c.capacity - c.reserved}>
									</div>
							<c:choose>
								<c:when test="${c.passengerList.size() >0 }">
									<c:forEach items="${c.passengerList }" var='p'>
										<table
											style="border-collapse: initial; border: 1px solid #FFB4B4; border-top: 0; padding: 15px; width: 100%;">
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">아이디</th>
												<td>${p.passengerId }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">성별</th>
												<td>${p.passengerMaFe }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">이름</th>
												<td>${p.passengerName }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">전화번호</th>
												<td>${p.passengerPhone }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">이메일</th>
												<td>${p.passengerEmail }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">요청사항</th>
												<td>${p.passengerMsg }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">요청일</th>
												<td>${p.requestDate }</td>
											</tr>
											<tr class="table-wrapper">
												<th
													style="padding-right: 40px; width: 200px; text-align: right;">수락상태</th>
												<td class="matchResultMsg"><c:choose>
														<c:when test="${p.matchStatus==1}">매칭을 거부하셨습니다.</c:when>
														<c:when test="${p.matchStatus==2}">매칭을 수락하셨습니다.</c:when>
														<c:otherwise>수락 혹은 거절을 선택해주세요.</c:otherwise>
													</c:choose></td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: right";>
													<div class="passenger-mng">
														<div class="decision-wrapper">
															<input type="hidden" name="matchNo" value="${p.matchNo }">
															<input type="hidden" id="matchStatus"
																value="${p.matchStatus }">
															<c:choose>
																<c:when test="${p.matchStatus eq 0 && c.closure eq 2 }">
																	<button type="button" class="btn btn-success accept"
																		value="2" onclick="decides(this)">수락</button>
																	<button type="button" class="btn btn-danger reject"
																		style="background-color: #F15A59;" value="1"
																		onclick="decides(this)">거절</button>
																</c:when>
																<c:otherwise>
																	
																</c:otherwise>
															</c:choose>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</c:forEach>
								</c:when>
								<c:otherwise>
								<h2 style="font-size:18px; text-align:center; color:red;">신청된 건이 없습니다.</h2>
								</c:otherwise>
							</c:choose>
									<c:choose>
										<c:when test="${c.closure eq 2}">
											<div class="buttons"
												style="padding: 20px; background-color: #FFDEB4; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; text-align: center;">
												<input type="hidden" name="carpoolNo" value="${c.carpoolNo }">
												<button type="button"
													title="이 버튼을 누르면 해당 건은 마감처리되어 더 이상 신청을 받을 수 없습니다."
													value="1" data-toggle="popover" data-trigger="hover"
													style="margin-right: 30px;" onclick="closing(this)">마감</button>
												<button type="button"
													title="해당 건의 카풀을 삭제하시면 탑승자들에게 탑승불가 알림이 가고 이 건은 삭제됩니다."
													value="3" data-toggle="popover" data-trigger="hover"
													onclick="closing(this)">삭제</button>
											</div>
										</c:when>
										<c:when test="${c.closure eq 1}">
											<div class="buttons"
												style="padding: 20px; background-color: #FFDEB4; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; text-align: center;">
												<div class="closureMsg" style="font-weight: 900;  color: red;">마감되었습니다.</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="buttons"
												style="padding: 20px; background-color: #FFDEB4; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; text-align: center;">
												<div class="closureMsg" style="font-weight: 900; color: red;">삭제되었습니다.</div>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
							
						</div>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->


	<script>
		function decides(obj) {
			const matchNo = Number($(obj).parent().children().eq(0).val()); //input에 matchNo라는 키값을 넣어 보내줘야한다. 
			console.log("매치넘버jsp페이지 matchNo: " + matchNo, $(obj).val());
			$.ajax({
						url : "/driverDecide.do",
						type : "post",
						data : {
							matchStatus : $(obj).val(),
							matchNo : matchNo
						},
						dataType: "json",
						success : function(decision) {
							const wrapper = $(obj).parents(".wrapper").eq(0);
							if (decision == "error") {
								alert("실패햇닷");
							} else {
								
								if(decision.result == 1){
									
									//한번 버튼 선택하면 버튼 비활성화 
									$(obj).parent().children().prop("disabled",true);
									$(obj).parent().children().css("cursor","now-allowed");
	
									//내가 선택한거에 따라서 메세지 바뀌게 해준다. 페이지를 새로고침해도 남아있다. 
									
									//정원에 자리가 한 자리 남았을 때, 수락을 누르면 마감, 삭제 버튼 사라지고 정원이 다 찼습니다 메세지 나온다. 
									if($(obj).text()=="수락"){
										if($(obj).parentsUntil(".wrapper").find("[name=substract]").val()==1){
						/* 해당되는 하나만 바뀌는게 아니라 wrapper 클래스 모두가 '정원이 다 찼습니다'로 바뀜 		*/	
											$(obj).parents(".wrapper").eq(0).find(".buttons").empty();
											$(obj).parents(".wrapper").eq(0).find(".buttons").text("정원이 다 찼습니다.");
										}
										$(obj).parent().parent().parent().parent()
												.prev().children().next().text("매칭을 수락하셨습니다.");
										$(obj).parent().parent().parent().parent()
										.prev().prev().prev().prev().prev().children().next().text(decision.p.passengerPhone);
										$(obj).parent().parent().parent().parent()
										.prev().prev().prev().prev().children().next().text(decision.p.passengerEmail);
										const reserved = wrapper.find(".reserved");
										reserved.text(Number(reserved.text())+1);
									}else{
										$(obj).parent().parent().parent().parent()
												.prev().children().next().text(	"매칭을 거부하셨습니다.");
									}
								}else{
									//한번 버튼 선택하면 버튼 비활성화 
									$(obj).parent().children().prop("disabled",true);
									$(obj).parent().children().css("cursor","now-allowed");
									//한번 버튼 선택하면 버튼 비활성화 
									$(obj).parent().children().prop("disabled",true);
									$(obj).parent().children().css("cursor","now-allowed");
									
									if($(obj).parentsUntil(".wrapper").find("[name=substract]").val()==1){
					/* 해당되는 하나만 바뀌는게 아니라 wrapper 클래스 모두가 '정원이 다 찼습니다'로 바뀜 		*/	
										$(obj).parents(".wrapper").eq(0).find(".buttons").empty();
										$(obj).parents(".wrapper").eq(0).find(".buttons").text("정원이 다 찼습니다.");
									}
									$(obj).parent().parent().parent().parent()
											.prev().children().next().text("매칭을 수락하셨습니다.");
									$(obj).parent().parent().parent().parent()
									.prev().prev().prev().prev().prev().children().next().text(decision.p.passengerPhone);
									$(obj).parent().parent().parent().parent()
									.prev().prev().prev().prev().children().next().text(decision.p.passengerEmail);
									
									
									
									
									const rejectBtn = wrapper.find(".reject:enabled");
									console.log(rejectBtn);
									rejectBtn.click();
									
									const reserved = wrapper.find(".reserved");
									reserved.text(Number(reserved.text())+1);
									const buttons = wrapper.find(".buttons");
									buttons.empty();
									const div = $("<div>");
									div.text("정원이 다 차서 마감되었습니다.");
									buttons.append(div);
									
									
								}
							}
						},
						error : function() {
							alert("decision 에러났습니다.");
						}
					});
		}

		//closure 상태 update 두개 해주기 carpoolNo 보내주면된다.
		//마감1 모집중2 삭제함3 : 운전자가 강제 마감했는지 안했는지에 따른 변수 , 기한만료와 정원 찬것과는 상관없는 변수임.
		function closing(obj) {
			//carpoolNo 키값으로 보내주기
			const carpoolNo = Number($(obj).parent().children().eq(0).val());
			console.log("driverPage.jsp의 carpoolNo : " + carpoolNo
					+ ",1:마감 3:삭제" + $(obj).val());
			$.ajax({
				url : "driverClosing.do",
				type : "post",
				data : {
					closure : $(obj).val(),
					carpoolNo : carpoolNo
				},
				success : function(closeit) {
					console.log(closeit);
					if (closeit == "success") {
						$(obj).parent().children().hide();
						//<div class="closureMsg" style="background-color: red;"></div>
						const div = $("<div>");
						div.addClass("closureMsg").css("font-weight", "900");
						if ($(obj).val() == "1") {
							div.text("이 건은 마감되었습니다.");
							$(obj).parent().parent().find($(".btn")).remove();
						} else if ($(obj).val() == "3") {
							div.text("이 건은 삭제되었습니다.");
							$(obj).parent().parent().find($(".btn")).remove();
						} else {
							div.text("매칭 중입니다.");
						}
						$(obj).parent().append(div);
						//한번 버튼 선택하면 버튼 사라진다.
						//새로고침해도 상태 메세지 그대로 뜨도록

					} else {
						alert("다시 시도해주세요.");
					}
				},
				error : function() {
					alert("closeit 에러났습니다")
				}
			});
		};
		
		//header에서 hidden된 input으로 가져온 값.
		$("#driverName").text($("[name=memberName]").val());
		
		
	</script>

</body>
</html>