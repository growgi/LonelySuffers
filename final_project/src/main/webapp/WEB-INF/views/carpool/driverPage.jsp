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
<title>Lonely Suffers-Carpool Main</title>
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
					style="border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="carpoolMain.do">전체보기</a>
						</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="driverPage.do">태워드려요</a>
						</p>
					</div>
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="passengerPage.do">태워주세요</a>
						</p>
					</div>
					<div class="menu" style="float: right;">
						<h3
							style="color: #1A5F7A; text-shadow: 0 0 2px #fff; font-weight: 900;">운전자
							페이지</h3>
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
							style="display: inline-block; width: 45%; font-size: 20px; font-weight: 900;">태워주세요
							신청을 보내온 회원들입니다.</div>
						<div class="">
							<c:forEach items="${list}" var="c">
								<hr>
								<div class="wrapper"
									style="background-color: #FFF3E2; border-radius: 30px; width:800px; margin: 0 auto;">
									<div class="head-info"
										style="text-align: center; background-color: #FFDEB4; padding: 10px; border-top-left-radius: 20px; border-top-right-radius: 20px;">
										<h3 style=>${c.departureDate }(${c.returnTimeRange })</h3>
										<h3>탑승인원/모집인원 : ${c.reserved }/${c.capacity }명</h3>
									</div>
									<c:forEach items="${c.passengerList }" var='p'>
										<table
											style="border-collapse: initial; border: 1px solid #FFB4B4; border-top:0; padding: 15px; width: 100%;">
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">아이디</th>
												<td>${p.passengerId }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">성별</th>
												<td>${p.passengerMaFe }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">이름</th>
												<td>${p.passengerName }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">전화번호</th>
												<td>${p.passengerPhone }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">이메일</th>
												<td>${p.passengerEmail }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">요청사항</th>
												<td>${p.passengerMsg }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">요청일</th>
												<td>${p.requestDate }</td>
											</tr>
											<tr class="table-wrapper">
												<th style="padding-right: 40px; width: 200px; text-align: right;">수락상태</th>
												<td class="matchResultMsg">
													<c:choose>
														<c:when test="${p.matchStatus==1}">매칭을 거부하셨습니다.</c:when>
														<c:when test="${p.matchStatus==2}">매칭을 수락하셨습니다.</c:when>
														<c:otherwise>수락 혹은 거절을 선택해주세요.</c:otherwise>
													</c:choose>
												</td>
											</tr>
											<tr>	
												<td colspan="2" style="text-align:right";>
													<div class="passenger-mng">
														<div class="decision-wrapper">
															<input type="hidden" name="matchNo" value="${p.matchNo }">
															<input type="hidden" id="matchStatus" value="${p.matchStatus }">
																<c:choose>
																	<c:when test="${p.matchStatus eq 0 }">
																			<button type="button"  class="btn btn-success accept" value="2" 
																			onclick="decides(this)">수락</button>
																			<button type="button" class="btn btn-danger reject" style="background-color: #F15A59;" value="1"
																			onclick="decides(this)">거절</button>
																	</c:when>
																	<c:otherwise>
																			<button type="button"  class="btn btn-success accept" value="2" 
																			onclick="decides(this)" style="cursor:not-allowed;" disabled>수락</button>
																			<button type="button" class="btn btn-danger reject" style="background-color: #F15A59;" value="1"
																			onclick="decides(this)" style="cursor:not-allowed;" disabled>거절</button>
																	
																	</c:otherwise>
																</c:choose>
														</div>
													</div>
												</td>
											</tr>	
										</table>
										
									</c:forEach>
									<div class="buttons" style="padding: 20px; background-color: #FFDEB4; border-bottom-left-radius: 20px; border-bottom-right-radius: 20px; text-align: center;">
										<button type="button" title="이 버튼을 누르면 해당 건은 마감처리되어 더 이상 신청을 받을 수 없습니다."
											data-toggle="popover" data-trigger="hover" style="margin-right: 30px;" onclick="closing(this)">마감</button> 
										<button type="button" title="해당 건의 카풀을 취소하시면 탑승자들에게 탑승불가 알림이 가고 이 건은 사라집니다."
											data-toggle="popover" data-trigger="hover" onclick="closing(this)">취소</button>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<hr>

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
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->


	<script>
	function decides(obj){
		const matchNo = Number($(obj).parent().children().eq(0).val()); //input에 matchNo라는 키값을 넣어 보내줘야한다. 
		console.log("매치넘버jsp페이지 matchNo: "+matchNo,$(obj).val());
		  $.ajax({
		    url: "/driverDecide.do",
		    type: "post",
		    data: {matchStatus: $(obj).val(), matchNo:matchNo},
		    success : function(decision){
		      console.log(decision);
		      if(decision=="success"){
		        $(obj).parent().children().prop("disabled",true);
		        $(obj).parent().children().css("cursor","now-allowed");
		        
		        //클릭했을 때 도는게 아니라, 
	        	$(obj).parent().parent().parent().parent().prev().children().next().text("매칭을 거부하셨습니다.");
	        	$(obj).parent().parent().parent().parent().prev().children().next().text("매칭을 수락하셨습니다.");
	        	
		      }else{
		        alert("다시 시도해주세요.");
		      }
		    },
		    error: function(){
		      alert("에러났습니다.");
		    }
		  });
		}
	
	//update 두개 해주기 carpoolNo 보내주면된다.
	
	
	</script>
	
</body>
</html>