<%@page import="kr.co.carpool.model.vo.Carpool"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>

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
</head>
<style>
.load-more {
  display: block;
  margin: 0 auto;
  margin-top: 30px;
  padding: 10px 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  font-weight: bold;
  text-align: center;
  text-decoration: none;
  color: #333;
  background-color: #f7f7f7;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.load-more:hover {
  background-color: #e6e6e6;
}

.carpool-wrap>td{
	padding: 20px;
	border-top: 2px dotted #FFB4B4;
	padding-bottom: 40px;
}


</style>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section transheader homepage parallax"
			style="background-image: url('resources/images/carpool/surftruck2.png'); opacity: 0.7;">
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
				<div class="row" style="padding-left: 120px; padding-bottom: 20px; padding-right: 140px;">
					<div class="col-md-2">
						<p class="category" style="font-weight: 900; font-size: 20px;">
							<a href="/carpoolMain.do">전체보기</a>
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
						
						<c:choose>
							<c:when test="${not empty sessionScope.m}">
								<a href="/carpoolOfferForm.do"> 
									<span class="material-symbols-outlined edit" id="edit-note-link">edit_note</span>
								</a>
							</c:when>
							<c:otherwise>
								<!-- alert 창에 ip 안뜨게 해야함 -->
								<a href="/loginFrm.do" onclick="alert('로그인한 회원만 작성 가능합니다.');">
									<span class="material-symbols-outlined edit" id="edit-note-link">edit_note</span>
								</a>
							</c:otherwise>
						</c:choose>
			
						<span class="material-symbols-outlined filter"
							style="display: inline-block; width: 50px; height: 30px;">filter_alt</span>
					
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->



		<!--
		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container">
				<div class="row">
	<!-- <td>안에서 디자인은 얼마든지 div와 row로 나눠서 할 수 있지만 td는 건들이면안됨!!!.. -->
		<section class="section" id="carpoolList"
			style="padding-top: 0px; padding-bottom: 0px; margin-left: 80px;">
			<div class="container">
				<div class="row">
					<table id="carpoolTable" class="tablesorter" style="background-color:#FFFBEB; border-collapse: initial; padding: 30px;
						border-radius: 20px; width: 900px; margin-left: 70px; border: 3px solid #E3F6FF;">
						<thead>
							<tr style="color: #B2A4FF; ">
								<th data-sort-method='thead' style="width:15%; text-indent: 35px;  line-height: 500%; cursor:pointer;"><img alt="mypage" src="/resources/images/carpool/up-arrow.png" style="width: 25px; height: 24px;">출발일</th>
								<th data-sort-method='thead' style="width:15%; cursor:pointer;"><img alt="mypage" src="/resources/images/carpool/up-arrow.png" style="width: 25px; height: 24px;">등록일</th>
								<th data-sort-method='none' style="width:15%;">출발/도착</th>
								<th data-sort-method='none' style="width:15%;">도시</th>
								<th data-sort-method='none' style="width:20%;">상세지역</th>
								<th data-sort-method='none' style="width:10%">인원</th>
								<th data-sort-method='none' style="display:none">마감여부</th>
							</tr>
						</thead>
						
						<tbody  class="carpoolListWrapper">
							<!-- 얘네들이 반복돼야해!! Carpool list all -->
							
						

						</tbody>
						<tfoot>
							<tr>
								<th colspan="6">
									<button class="load-more" id="more-btn">더보기</button>
								</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- end row -->
				<br> <br>
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<!--모달 -->
		<div class="container">

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 5px 5px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body" style="padding: 5px 5px;">
						
						<!-- ajax로 처리하기 때문에 form이 필요 없음.  -->
								<div class="form-group">
									<label for="usrname">출발</label> 
									<select class="form-control" id="departureRegion" name="departureRegion" >
										<option value="전체">전체</option>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="강원">강원</option>
										<option value="부산">부산</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
									</select> 
								</div>
								<div class="check-box-wrap-one" style="margin-bottom: 10px;">
									<label class="lb-class lb-left">
										<div class="check-box left">
											<input type="checkbox" id="am" name="departureTime" value="0" >
											<span class="material-symbols-outlined">check</span>오전
										</div>
									</label>
									<label class="lb-class lb-right">
										<div class="check-box right">
											<input type="checkbox" id="pm" name="departureTime" value="1" >
											<span class="material-symbols-outlined">check</span>오후<br>
										</div>
									</label>
								</div>
								<div class="form-group">
									<label for="usrname">도착</label> 
									<select class="form-control" id="arrivalRegion" name="arrivalRegion" >
										<option value="전체">전체</option>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="강원">강원</option>
										<option value="부산">부산</option>
										<option value="대구">대구</option>
										<option value="광주">광주</option>
									</select><br>
									<div class="row">
										<div class="col-sm-6">
											<div class="input-group">
												<input type="text" class="form-control" id="minPrice" name="carpoolPrice" placeholder="최저가"> 
												<span class="input-group-addon"  style="background-color: none; border: none;">(원)</span>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="input-group">
												<input type="text" class="form-control" id="maxPrice" name="carpoolPrice" placeholder="최고가"> 
												<span class="input-group-addon" style="background-color: none; border: none;">(원)</span>
											</div>
										</div>
									</div>
								</div>
								<div class="check-box-wrap"> 
									<label class="lb-class"><div class="check-box left">
										<input type="checkbox" id="oneway" name="onewayRound" value="1">
										<span class="material-symbols-outlined">check</span>편도
									</div></label>
									<label class="lb-class"><div class="check-box right">
										<input type="checkbox" id="round" name="onewayRound" value="2"> 
										<span class="material-symbols-outlined">check</span>왕복<br>
									</div></label>
									<label class="lb-class"><div class="check-box left">
										<input type="checkbox" id="opened" name="closure" value="2">
										<span class="material-symbols-outlined">check</span>모집중</label>
									</div></label>
									<label class="lb-class"><div class="check-box right">
										<input type="checkbox" id="closed" name="closure" value="1">
										<span class="material-symbols-outlined">check</span>모집완료</label>
									</div></label>
								</div>
								<hr>
								<div class="btn-pack" style="margin-left: 25px;">
									<button type="button" class="btn btn-block" id="reset-btn" style="width: 250px; height: 40px; border-radius: 10px; float: left; margin-right: 25px; background-color: #FDE2F3; color: grey; font-weight: 900;">
										초기화</button>
									<button type="button" class="btn btn-block" id="apply-btn" 	style="width: 250px; height: 40px; border-radius: 10px; 
									background-color: #E5BEEC; color: grey; font-weight: 900;">적용</button>
								</div>
								<br>
							<div class="modal-footer">
								<button type="submit" id="exit-mymodal"
									class="btn btn-danger btn-default pull-left"
									data-dismiss="modal"
									style="font-size: 14px; text-align: center; width: 40px; border-radius: 10px; background-color: #AEE2FF; color:white;display: flex; justify-content: center; align-items: center;">
									<span class="glyphicon glyphicon-remove">나가기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end container -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>

	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/tablesort.min.js"></script>
	<script src="resources/js/tablesort.date.min.js"></script>


	<script>
	//로그인하고 이용해주세요
	
	
	//모달
	$(document).ready(function() {
		$(".filter").click(function() {
			$("#myModal").modal();
		});
	});
	

	//필터링으로 해당 조건 검색해서 carpoolMain.jsp 에서 필터링된 리스트만 보이게한다.  
	// (소) {중} [대]
 	$("#apply-btn").on("click", function(){
 		//검색을 해서 다시 돌아갔다가 다시 검색을 했을때 더보기 버튼 활성화
 			$("#more-btn").prop("disabled", false)
 			$("#more-btn").css("cursor", "")
 		
 		//선택을 0, 1, 2개 등 여러개 할 수 있는 요소들은 배열로 받아와야한다. 아래 checkbox 요소 세개에 해당
		const departureTime = new Array();
		const onewayRound = new Array();
		const closure = new Array();
		
		const departureRegion = $("#departureRegion").val();
		//배열로 받아오는 요소 
		const am = $("#am:checked").val();
		const pm = $("#pm:checked").val();
		if(am){
			departureTime.push(am);
		}
		if(pm){
			departureTime.push(pm);
		}
		const arrivalRegion = $("#arrivalRegion").val();
		const minPrice = $("#minPrice").val()===""?0:$("#minPrice").val(); //삼학연산자로 빈칸이면 0, 빈칸이아니면 적힌 값 들고오기
		const maxPrice = $("#maxPrice").val()===""?0:$("#maxPrice").val(); //삼학연산자로 빈칸이면 0, 빈칸이아니면 적힌 값 들고오기
		
		const oneway = $("#oneway:checked").val();
		const round = $("#round:checked").val();
		if(oneway){
			onewayRound.push(oneway)
		}
		if(round){
			onewayRound.push(round)
		}
		
		const opened = $("#opened:checked").val();
		const closed = $("#closed:checked").val();
		if(opened){
			closure.push(opened);
		}
		if(closed){
			closure.push(closed);
		}
		console.log(closure);
		const data ={
				 departureRegion : departureRegion,
				 departureTime : departureTime,
				 arrivalRegion : arrivalRegion,
				 minPrice : minPrice,
				 maxPrice : maxPrice,
				 onewayRound : onewayRound,
				 closure : closure
			 };
		
		console.log(data);
		//data에 담겨있는 조건 그대로 토탈갯수
		const start	= Number($(".carpool-wrap")) + 1;
		const amount = 5;
		$(".carpoolListWrapper").empty();
		$.ajax({
			url:"/carpoolCount.do",
			type:"post",
			data: data,
			traditional:true, //배열로 받아올 때 추가해야한다. 
			dataType : "json",
			success : function(totalCount){
				console.log(totalCount);
				//push는 배열, append는 태그 사이 추가 
				$("#more-btn").val(1);
				$("#more-btn").attr("totalCount", totalCount);
				$("#more-btn").attr("currentCount", 0);
				$("#more-btn").click();
				
			} 
		});
	/*
		$.ajax({
			 url : "/filterCarpool.do",
			 type : "post",
			 data : data,
			 traditional:true, //배열로 받아올 때 추가해야한다. 
			 dataType : "json",
			 success : function(data){
				 console.log(data);
				 $(".carpoolListWrapper").empty();
				 for(let i=0; i<data.length; i++){
					 
			            const tr = $("<tr>").addClass("carpool-wrap").css("cursor", "pointer").click(function(){
			                location.href = '/carpoolRequest.do?carpoolNo='+data[i].carpoolNo;
			            });
			            const td1 = $("<td>").text(data[i].departureDate);
			            
			            const td2 = $("<td>").append($("<span>").css("display", "none").text(data[i].regDate))
			            .append($("<img>").attr("src", "/resources/images/carpool/destination.png").attr("alt", "img").css("width", "45px").css("height", "50px"));
			            const td3 = $("<td>");
			            if(data[i].onewayRound == 1){
			            	 td3.append($("<div>").addClass("row onewayRound").text("편도"))
					            .append($("<div>").addClass("row region").text(data[i].departureRegion))
					            .append($("<div>").addClass("row region").text(data[i].arrivalRegion));
			            }else if(data[i].onewayRound == 2){
			            	 td3.append($("<div>").addClass("row onewayRound").text("왕복"))
					            .append($("<div>").addClass("row region").text(data[i].departureRegion))
					            .append($("<div>").addClass("row region").text(data[i].arrivalRegion));
			            }
			           
		
			            const td4 = $("<td>").append($("<div>").addClass("row onewayRound").css("background-color", "transparent").text(""))
			            .append($("<div>").addClass("row district").text(data[i].departureDistrict))
			             .append($("<div>").addClass("row district").text(data[i].arrivalDistrict));
	
			            const td5 = $("<td>").append($("<div>").addClass("row onewayRound").css("background-color", "transparent").text(""))
			            .append($("<div>").addClass("row").text(data[i].reserved+"/"+data[i].capacity));
			           
			            tr.append(td1).append(td2).append(td3).append(td4).append(td5);
			            $(".carpoolListWrapper").append(tr);
			    }
				//모달닫기
				$("#exit-mymodal").click();
			 },
			 error : function(){
				 console.log("서버호출 실패");
			 }
		});
	*/
	});
	
	//더보기 버튼 누를때 
	//하지만 확인하고 갈 문제 : tableSort 라이브러리로 출발일, 등록일 기준으로 정렬되는 기능을 썼다.
	//그 기능을 유지하면서 ajax로 사용 가능할까. --> 가능했다.
	//1)원래 빈 화면에서 기본적으로 첫번째는 더보기 버튼이 한번 눌려진채로 나오게 한다(빈화면이 되지않도록) -> web-workspace에 7.mvc2 photoList 참조.
	

	$("#more-btn").on("click", function(){
		const start = $(this).val();
		const amount = 5;
		//선택을 0, 1, 2개 등 여러개 할 수 있는 요소들은 배열로 받아와야한다. 아래 checkbox 요소 세개에 해당
		const departureTime = new Array();
		const onewayRound = new Array();
		const closure = new Array();
		
		const departureRegion = $("#departureRegion").val();
		//배열로 받아오는 요소 
		const am = $("#am:checked").val();
		const pm = $("#pm:checked").val();
		if(am){
			departureTime.push(am);
		}
		if(pm){
			departureTime.push(pm);
		}
		const arrivalRegion = $("#arrivalRegion").val();
		const minPrice = $("#minPrice").val()===""?0:$("#minPrice").val(); //삼학연산자로 빈칸이면 0, 빈칸이아니면 적힌 값 들고오기
		const maxPrice = $("#maxPrice").val()===""?0:$("#maxPrice").val(); //삼학연산자로 빈칸이면 0, 빈칸이아니면 적힌 값 들고오기
		
		const oneway = $("#oneway:checked").val();
		const round = $("#round:checked").val();
		if(oneway){
			onewayRound.push(oneway)
		}
		if(round){
			onewayRound.push(round)
		}
		
		const opened = $("#opened:checked").val();
		const closed = $("#closed:checked").val();
		if(opened){
			closure.push(opened);
		}
		if(closed){
			closure.push(closed);
		}
		const data ={
				 departureRegion : departureRegion,
				 departureTime : departureTime,
				 arrivalRegion : arrivalRegion,
				 minPrice : minPrice,
				 maxPrice : maxPrice,
				 onewayRound : onewayRound,
				 closure : closure,
				 start: start,
				 amount : amount
				 
			 };
		console.log(data);
		$.ajax({
			 url : "/filterCarpool.do",
			 type : "post",
			 data : data,
			 traditional:true, //배열로 받아올 때 추가해야한다. 
			 dataType : "json",
			 success : function(data){
				 console.log(data);
				 
				 for(let i=0; i<data.length; i++){
					 	const hr = $("<hr>");
					 
			            const tr = $("<tr>").addClass("carpool-wrap").css("cursor","pointer");
			            
			            const td1 = $("<td>").text(data[i].departureDate);
			            
			            const td2 = $("<td>");
			            if(data[i].onewayRound == 1){
			            	 td2.append($("<div>").addClass("row onewayRound").text("편도"))
			            }else if(data[i].onewayRound == 2){
			            	 td2.append($("<div>").addClass("row onewayRound").text("왕복"))
			            }
			            td2.append($("<span>").css("display", "none").text(data[i].regDate)).append($("<img>").attr("src", "/resources/images/carpool/destination.png").attr("alt", "img").css("width", "45px").css("height", "50px"));
			            
			            const td3 = $("<td>");
				            td3.append($("<div>").addClass("row region").text("출발지: "));
				            td3.append($("<div>").addClass("row region").text("도착지: "));
			            
			            const td4 = $("<td>");
			            if(data[i].onewayRound == 1){
					            td4.append($("<div>").addClass("row region").text(data[i].departureRegion));
					            td4.append($("<div>").addClass("row region").text(data[i].arrivalRegion));
			            }else if(data[i].onewayRound == 2){
					            td4.append($("<div>").addClass("row region").text(data[i].departureRegion));
					            td4.append($("<div>").addClass("row region").text(data[i].arrivalRegion));
			            }
			            const td5 = $("<td>");
			            		td5.append($("<div>").addClass("row district").text(data[i].departureDistrict));
			             		td5.append($("<div>").addClass("row district").text(data[i].arrivalDistrict));
	
			            const td6 = $("<td>").append($("<div>").addClass("row onewayRound").css("background-color", "transparent").text(""));
			            		td6.append($("<div>").addClass("row").text(data[i].reserved+"/"+data[i].capacity));		
            		   
	            		const td7 = $("<td>").css("display", "none").text(data[i].closure);
	            		if(data[i].closure == 1){
			           		tr.click(function(){
				              alert("마감되었습니다.");
				            });
			           	}
	            		else if(data[i].reserved === data[i].capacity){
			           		tr.click(function(){
				              alert("정원이 다 찼습니다.");
				            });
			           	}else{
				            tr.click(function(){
				                location.href = '/carpoolRequest.do?carpoolNo='+data[i].carpoolNo;
				            });
			           	}
			           	
			           	
			           	tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7);
			            $(".carpoolListWrapper").append(tr);
			    }
				 //화면에 추가 완료 시점
				 //->다음 더보기를 위한 값 수정
				 const currentVal = Number($("#more-btn").val()); 
				 $("#more-btn").val(currentVal+amount);
				 //currentCount값도 변경
				 const currentCount = Number($("#more-btn").attr("currentCount"));
				 const changeCount = currentCount+data.length;
				 $("#more-btn").attr("currentCount",changeCount);
				 const totalCount = Number($("#more-btn").attr("totalCount"));
				 
				 //더 나올 사진이 없을 때 더보기 버튼 비활성화
				 if(changeCount == totalCount){
			 			$("#more-btn").prop("disabled", true)
			 			$("#more-btn").css("cursor", "not-allowed");
				 }
				//모달닫기
				$("#exit-mymodal").click();
			 },
			 error : function(){
				 console.log("서버호출 실패");
			 }
		});
	});
	$("#apply-btn").click();
	
	
	
	// 초기화 버튼 클릭 시
	/*document.getElementById("reset-btn").addEventListener(
			"click",
			function() {
				// input 값 초기화
				document.querySelectorAll("input").forEach(function(input) {
					input.value = "";
				});
				// select 값 초기화
				document.querySelectorAll("select").forEach(
						function(select) {
							select.selectedIndex = 0;
							// 체크박스 초기화
							document.querySelectorAll("input[type=checkbox]")
									.forEach(function(checkbox) {
										checkbox.checked = false;
									});
						});
			});*/
	
	document.getElementById("reset-btn").addEventListener( "click",
		    function() {
		        // input 값 초기화
		        document.querySelectorAll("input").forEach(function(input) {
		            input.value = "";
		        });
		        // select 값 초기화
		        document.querySelectorAll("select").forEach(function(select) {
		            select.selectedIndex = 0;
		        });
		        // 체크박스 초기화
		        document.querySelectorAll("input[type=checkbox]").forEach(function(checkbox) {
		            checkbox.checked = false;
		            $(checkbox).parent().removeClass("active-checkbox");
		            $(checkbox).next().hide();
		        });
		    }
		);
	
	//필터검색 
	//input checkbox 다음에오는 span check img 처음에 안보이게하고
	$("input[type=checkbox]").next().hide();
	
	$("input[type=checkbox]").on("change", function(){
		console.log($(this).is(":checked"))
		//input의 체크박스가 체크되면
		if($(this).is(":checked")){
			//check img 보이게하고
			$(this).next().show();
			//input checkbox를 싸고있는 부모가 보이게한다. 
			$(this).parent().addClass("active-checkbox");
		}else{
			$(this).next().hide()
			$(this).parent().removeClass("active-checkbox");
		}
	});

	
		//출발일, 등록일 기준으로 table sort out기능
		table = document.getElementById('carpoolTable');
		new Tablesort(table);
		var refresh = new Tablesort(tableRefresh);
		var rowCount = tableRefresh.rows.length;
		var row = tableRefresh.insertRow(rowCount);
		var cellName = row.insertCell(0);	
		cellName.innerHTML = 0;
		refresh.refresh();


		
		


		
	</script>

</body>
</html>






