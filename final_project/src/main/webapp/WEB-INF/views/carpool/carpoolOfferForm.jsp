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
<title>Lonely Surfers-Carpool Offer Form</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css"	href="resources/css/daterangepicker.css">
<style>
/*오전, 오후 radio 효과주기*/
[type=radio] {
	display: none;
}

[for="am"], [for="pm"], [for="return-am"], [for="return-pm"] {
	display: inline-block;
	width: 124px;
	height: 38px;
	padding: 5px 10px;
	line-height: 28px;
	border: 1px solid pink;
	background-color: pink;
	color: white;
	border-radius: 4px;
	cursor: pointer;
	text-align: center;
	width: 100px;
	height: 40px;
	border-radius: 20px;
}

[type="radio"]:checked+label {
	color: #fff;
	background-color: #FFDEB4;
	color: black;
	transition-duration: 0.3s;
	border: none;
}

.comment, .comment2{
	font-size: 8px;
	color: red;
}

</style>

</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="container">
			<div class="row" style="display: flex; align-items: center;">
				<a href="carpoolMain.do"><img
					src="/resources/images/carpool/left-arrow.png" alt="img"
					style="width: 45px; height: 50px;"></a>
			</div>
		</div>
		<section class="section"
			style="padding-top: 50px; padding-bottom: 10px;">
			<div class="container">
				<div class="row"
					style="border-bottom: 1px solid rgba(101, 112, 123, 0.833);">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="head">
						<p class="title"
							style="font-size: 30px; font-weight: bold; color: #303030; margin: 0px 0px 20px 0px; padding: 0px 0px 0px 0px; text-align: center;">함께가요</p>
					</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container" style="width: 850px; margin-top: 20px; padding: 20px;">
				<div class="row" style="border: 1px solid #FFB4B4; border-radius: 20px; padding: 20px; background-color: #FFF3E2;">
					<form action="/registerCarpool.do"	onsubmit="return checkValue();" method="post" style="margin-top: 20px;">
						<table style="border: 1px solid #fff; width:600px;">
							<tbody>
								<tr>
									<th rowspan="2" style="width: 30%; text-align: center; border: 1px solid #FFF3E2; height: 80px;">출발</th>
									<td style="border: 1px solid #FFF3E2">
										<select class="form-control" name="departureRegion" id="city" style="width: 70%; border-radius: 10px; border: 1px solid pink;">
											<option value="" selected disabled>시/도</option>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
											<option value="강원">강원</option>
											<option value="부산">부산</option>
											<option value="대구">대구</option>
											<option value="광주">광주</option>
										</select><span class="comment"></span>
									</td>
								</tr>
								<tr>
									<td><input type="hidden" id="driverNo" name="driverNo" value="${sessionScope.m.memberNo }"> 
										<input type="hidden" name="onewayRound" value="1"> <input type="text" id="details" name="departureDistrict"
										placeholder="0/20" style="text-align: right; width: 100%; height: 35px; border-radius: 10px; border: 1px solid pink;"><span class="comment"></span></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<th rowspan="2"
										style="width: 30%; text-align: center; border: 1px solid #FFF3E2; height: 80px;">도착</th>
									<td style="border: 1px solid #FFF3E2">
										<select class="form-control" name="arrivalRegion" id="city" style="width: 70%; border-radius: 10px; border: 1px solid pink;">
											<option value="" selected disabled>시/도</option>
											<option value="서울">서울</option>
											<option value="경기">경기</option>
											<option value="인천">인천</option>
											<option value="강원">강원</option>
											<option value="부산">부산</option>
											<option value="대구">대구</option>
											<option value="광주">광주</option>
										</select><span class="comment"></span>
									</td>
								</tr>
								<tr>
									<td><input type="text" id="details" name="arrivalDistrict" placeholder="0/20" style="text-align: right; width: 100%; 
										height: 35px; border-radius: 10px; border: 1px solid pink;"><span class="comment"></span>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="tab-wrap" style="width: 800px; margin: 10px auto;">
							<ul class="tabs" style="margin: 0; padding: 0; list-style-type: none; overflow: hidden; cursor: pointer;">
								<li class="trip oneway" style="float: left; width: 50%; height: 50px; text-align: center; line-height: 50px; background-color: #F9E2AF;">편도</li>
								<li class="trip round" 	style="float: left; width: 50%; height: 50px; text-align: center; line-height: 50px; background-color: #ad8b73; color: #fffbe9;">왕복</li>
							</ul>
							<br>
							<br>
						</div>
						<div class="content-wrap">
							<div class="tabcontent" style="margin-bottom: 30px;">
								<table>
									<tbody>
										<tr class="depart">
											<th style="width: 35%; height: 50px; text-align: center;">출발</th>
											<td>
												<div>
													<!--daterangepicker-->
													<input type="text" id="departureDate" name="departureDate"
														style="border: 1px solid pink; height: 40px; width: 164px;border-radius: 10px;">
													<div id="calendar-area" required></div>
												</div>
											</td>
											<td>
												<!--오전 오후 중에 체크하는 radio--> 
												<input type="radio" id="am" name="departureTime" value="0"> <label for="am">오전</label>
												<input type="radio" id="pm" name="departureTime" value="1">	<label for="pm">오후</label>
												<span class="comment" ></span>
											</td>
										</tr>
										<!-- 
					      				 	왕복일 경우에만 들어오는 '복귀'선택란은 원래 여기인데. 그것만 뺐다꼈다 하도록  javascript로 넣어줌.
					                    -->
										<!-- 왕복 탭을 누를 시 복귀란이 추가된다.
					                     <tr class="arrive"> 
					                        <th style="width:35%; text-align:center;">복귀</th> 
					                        <td>
					                            <input type="text" id="returnDate" name="returnDate" >
					                            <div id="calendar-area2"></div>
					                        </td>
					                        <td>
					                            <input type="radio" id="am" name="arrivalTime" value="0">
					                            <label for="am-time">오전</label>
					                            <input type="radio" id="pm" name="arrivalTime" value="1">
					                           <label for="pm-time">오후</label>		
					                        </td>
					                    </tr>
					                     -->
										<tr>
											<th style="text-align: center; height: 50px; width: 164px;" >인원</th>
											<td>
												<select name="capacity" id="capacity" style="height: 40px; width: 164px; border: 1px solid pink; border-radius: 10px;">
													<option selected value="탑승인원" disabled>탑승인원 선택</option>
													<option value="1">1명</option>
													<option value="2">2명</option>
													<option value="3">3명</option>
													<option value="4">4명</option>
													<option value="5">5명</option>
													<option value="6">6명</option>
												</select>
											</td>
											<td >
												<div style="display: inline-block;border-radius: 20px; background-color: pink; color: white; width: 200px; padding: 8px 0px 8px 0px;" >
												<label for="surfboardRoom" onclick="toggleStorage()" style="cursor: pointer; width: 100%;; text-align: center; height: 23px; line-height: 25px;">
													보드 수납가능 <img src="/resources/images/carpool/checked.png" alt="img" style="width: 30px; height: 30px;">
												</label> <input type="checkbox" id="surfboardRoom" name="surfboardRoom" value="1" style="display: none;">
												</div>
												<span class="comment2"></span>
											</td>
										</tr>
										<tr>
											<th style="text-align: center; height: 50px;">금액</th>
											<td><input type="number" id="carpoolPrice" name="carpoolPrice" placeholder="0"
											style="text-align: right; height: 40px; border: 1px solid pink; border-radius: 10px;">원	</td>
										</tr>
										<tr>
											<th style="text-align: center; height: 50px;">상세</th>
											<td rowspan="4" colspan="8"><input type="text" id="driverMsg" name="driverMsg" placeholder="0/60"
												style="text-align: right;; width: 100%; height: 100px; border-radius: 10px; border: 1px solid pink;">
												<span class="comment2"></span>
											</td>
										</tr>
								</table>

							</div>
							<hr>


						</div>
						<!-- 모달 -->
						<div class="button-wrap"
							style="width: 500px; margin: 0 auto; text-align: center; margin-top: 20px; margin-bottom: 20px;">
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#myModal">
								<img src="/resources/images/carpool/warning.png" alt="img"
									style="width: 30px; height: 30px;"> 꼭 읽어주세요 ! 아름다운 문화 만들기
							</button>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">꼭 읽어주세요!</h4>
									</div>
									<div class="modal-body">
										<p>
											Lonely surfers는 카풀에 관여하지 않습니다.<br> 다만, 사용자 보호를 위하여 불건전한
											내용 또는 사기로 의심되는 행위 적발 시 사기 피해확산을 막기 위해 사기 이용자의 계정을 차단하고 서비스
											이용이 제한할 수 있으며 경찰 등 수사시관에 적극 협조하고 있습니다.<br>
											또한 한 번 카풀 신청을 받거나 마감, 삭제를 하면 되돌릴 수 없습니다. 
										</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">동의합니다.</button>
									</div>
								</div>
							</div>
						</div>
						<div class="button-wrap"
							style="text-align: center; margin-bottom: 20px;">
							<hr>
							<button type="button" class="btn cancel" style="margin-right: 20px; width: 150px; height: 50px;">
								<a href="carpoolMain.do">취소하기</a>
							</button>
							<button type="submit"  class="btn btn-primary" style="width: 150px; height: 50px; text-align: center;">등록</button>
						</div>
					</form>

				</div>


			</div>
			<!-- end row -->
	</div>
	<!-- end container -->
	</section>
	<!-- end section -->
	<a href="/carpoolMain.do">카풀 메인으로</a>
	</div>




	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
	<script src="resources/js/moment.min.js"></script>
	<script src="resources/js/daterangepicker.js"></script>

	<script>
		/*	편도, 왕복 로직을 바꿨기 때문에 필요없어짐. '복귀'만 뺐다꼈다 하는 로직이 더 좋은거다!
			왜냐하면 그러면 탭을 왔다갔다 해도 선택한게 남아있기 때문이다!
			
		    $(".tabs>li").on("click",function(){
		    $(".tabs>li").removeClass("active-tab");
		    $(this).addClass("active-tab");
		    const contents = $(".tabcontent");
		    contents.hide();
		    //요소배열.index(요소) : 요소배열 중에 요소가 몇번째인지
		    const index = $(".tabs>li").index(this);
		    contents.eq(index).show();
		});
		 */

		//화면 시작하자마자 첫번째 탭을 클릭해놓도록 설정해놓는다.
		$(".tabs>li").eq(0).click();

		//왕복을 누르면 들어가게 하는거
		//jQuery에서 요소를 가지고 오면 무조건 배열이다.
		//그래서 if($(".arrive").length == 0){ 라고 먼저 확인해서 '복귀'가 있는지 확인해주고 없으면 넣어준다.
		//하나라도 있으면 넣어주지 않기때문에 '왕복'버튼을 여러번 눌려도 중첩으로 생기지 않는다. 
		$(".round").on("click", function() {
			$("[name=onewayRound]").val(2);
				if($(".arrive").length == 0){
			$(".depart")
					.after(
					'<tr class="arrive">'
							+ '<th style="width:35%; text-align:center;">복귀</th>'
							+ '<td>'
							+ '<input type="text" id="returnDate" name="returnDate" style="border:1px solid pink; height:40px; border-radius: 10px;">'
							+ '<div id="calendar-area2"></div>'
							+ '</td>'
							+ '<td>'
							+ '<input type="radio" id="return-am" name="returnTime" value="0">'
							+ '<label for="return-am">오전</label>'
							+ '&nbsp;'
							+ '<input type="radio" id="return-pm" name="returnTime" value="1">'
							+ '<label for="return-pm">오후</label>'
							+'<span class="comment"></span>'
							+ '</td>' + '</tr>');
						}
				});
		$(".oneway").on("click", function() {
			$(".arrive").remove();
			$("[name=onewayRound]").val(1);
		});

		$('#departureDate').daterangepicker({
			locale : {
				format : "YYYY-MM-DD",
				fromLabel : "시작",
				toLabel : "종료"
			},
			alwaysShowCalendars : true,
			autoApply : true,
			singleDatePicker : true,
			showDropdowns : true,
			minDate : moment().add(1, 'days'), // 오늘까지는 예약 불가. 내일부터 예약 가능
			maxDate : moment().add(2, 'months'), // 종료일은 2개월 이내에서 지정 가능
		});

		// 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
		$("#departureDate").on(
				"change",
				function() {
					//위치조정

					// 시작일+1을 minDate로 사용
					const departureDate = $("#departureDate").val();
					//maxDate는 시작일+15일로 초기화 
					var maxLimit = moment(departureDate).add(15, 'days')
							.format("YYYY-MM-DD");

					$('#returnDate').daterangepicker({
						locale : {
							format : "YYYY-MM-DD",
							fromLabel : "시작",
							toLabel : "종료"
						},
						alwaysShowCalendars : true,
						autoApply : true,
						singleDatePicker : true,
						showDropdowns : true,
						minDate : departureDate,
						maxDate : maxLimit
					});
				});

		function toggleStorage() {
			var surfboardRoom = document.getElementById("surfboardRoom");
			if (surfboardRoom.checked) {
				surfboardRoom.parentNode.style.backgroundColor = "pink"; // 기본: 배경색 핑크
				surfboardRoom.parentNode.style.color = "white"; // 기본: 글자색 흰색
			} else {
				surfboardRoom.parentNode.style.backgroundColor = "#FFDEB4"; // 선택 시 배경색 오렌지 변경
				surfboardRoom.parentNode.style.color = "black"; // 선택시 글자색 검정

			}
			console.log(surfboardRoom.checked);
			const surfboardRoomchecked = $("[name=surfboardRoom]:checked")
					.val();
			console.log(surfboardRoomchecked);

		};
		/*
			<참고>
		form에서 onsubmit 함수를 줘서, 해당 form이 submit될 때 실행됨
		이 함수는 form이 제출될 때 유효성 검사를 수행하고, 문제가 있을 경우 false를 반환하여 form이 제출되지 않게 막을 수 있다. 
		required 함수는 onsubmit 함수에 포함된다. 왜냐면 제출/등록 등을 누를때 함수가 required가 돌기 때문이다.
		onsubmit과 required를 동시에 쓰면은 이벤트가 중복되기 때문에 실행되지않는다. 그렇기때문에 onsubmit을 적으면 required를 지워준다. 
		*/
		
		function checkValue() {
			//input 일때는 ""가 빈 칸이다. null이 아니다. 
			//select 일때는 null
			//가격선택을 안하면 0원으로 default 
			if ($("[name=carpoolPrice]").val() == "") {
				$("[name=carpoolPrice]").val(0);
				console.log("가격:"+$("[name=carpoolPrice]").val());
			}
			const departureRegion = $("[name=departureRegion]").val();
			const departureDistrict = $("[name=departureDistrict]").val();
			const arrivalRegion = $("[name=arrivalRegion]").val();
			const arrivalDistrict = $("[name=arrivalDistrict]").val();
			const capacity = $("[name=capacity]").val();
			const driverMessage = $("[name=driverMsg]").val();
			
			let num=0;
			if(departureRegion == null){
				$("[name=departureRegion]").css("border", "1px solid red");
				$(".comment").eq(0).text("출발 도시를 선택해주세요.");
				num++;
			}else{
				$("[name=departureRegion]").css("border", "1px solid pink");
				$(".comment").eq(0).empty();
			}
			
			if(departureDistrict == ""){
				$("[name=departureDistrict]").css("border", "1px solid red");
				$(".comment").eq(1).text("출발지 상세내용을 기입해주세요.");
				num++;
			}else{
				$("[name=departureDistrict]").css("border", "1px solid pink");
				$(".comment").eq(1).empty();
			}
			
			if(arrivalRegion==null){
				$("[name=arrivalRegion]").css("border", "1px solid red");
				$(".comment").eq(2).text("도착 도시를 선택해주세요.");
				num++;
			}else{
				$("[name=arrivalRegion]").css("border", "1px solid pink");
				$(".comment").eq(2).empty();
				}
			
			if(arrivalDistrict == ""){
				$("[name=departureDistrict]").css("border", "1px solid red");
				$(".comment").eq(3).text("도착지 상세내용을 기입해주세요.");
				num++;
			}else{
				$("[name=arrivalDistrict]").css("border", "1px solid pink");
				$(".comment").eq(3).empty();
			}
			
			if( $("[name=departureTime]:checked").length==0){
				$("[name=departureTime]").css("border", "1px solid red");
				$(".comment").eq(4).text("오전/오후를 선택해주세요.");
				num++;
			}else{
				$("[name=departureTime]").css("border", "1px solid pink");
				$(".comment").eq(4).empty();
				}
			
			if($("[name=returnTime]").length!=0){
				if($("[name=returnTime]:checked").length==0){
					$("[name=returnTime]").css("border", "1px solid red");
					$(".comment").eq(5).text("오전/오후를 선택해주세요.");
					num++;
				}else{
					$("[name=returnTime]").css("border", "1px solid pink");
					$(".comment").eq(5).empty();
					}
			}
			
			if(capacity==null){
				$("[name=capacity]").css("border", "1px solid red");
				$(".comment2").eq(0).text("탑승인원을 선택해주세요.");
				num++;
			}else{
				$("[name=capacity]").css("border", "1px solid pink");
				$(".comment2").eq(0).empty();
				}
			
			if(driverMessage==""){
				$("[name=driverMsg]").css("border", "1px solid red");
				$(".comment2").eq(1).text("탑승자에게 자세한 안내를 적어주세요.");
				num++;
			}else{
				$("[name=driverMsg]").css("border", "1px solid pink");
				$(".comment2").eq(1).empty();
				}
			console.log("onsubmit결과"+num);
			if(num==0){
				return true;
			}else{
				return false;
			}
		}
			
		//carpool Price 주의점: input이 숫자일때는 ""(String 빈칸)으로 나오기때문에, 안에 값이 비었으면 0으로 값을 받아오도록 설정해줘야한다. 
		//그러니 val(0)을 넣어줬다. required가 아니면서(강제조항이 아님) 에러 나지않게 값은 받아와야하므로 dafault 값으로 0을 주는것이다.
	</script>

</body>
</html>


