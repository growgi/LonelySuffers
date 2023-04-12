<%@page import="kr.co.carpool.model.vo.Carpool"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers-Carpool Offer Form</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="resources/css/carpool/carpoolOffer.css">
<link rel="stylesheet" href="resources/css/carpool/carpoolReg.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" type="text/css" href="resources/css/daterangepicker.css">

</head>

<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section" style="padding-top: 50px; padding-bottom: 10px;" >
			<div class="container">
				<div class="row" style="border-bottom: 2.5px solid rgba(101, 112, 123, 0.833);">
<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="head">
						<p class="title" style="  font-size: 30px; font-weight: bold; color: #303030;
						margin: 0px 0px 20px 0px; padding: 0px 0px 0px 0px;  text-align: center;
					">함께가요</p>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->


		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container"style="width: 850px; margin-top: 20px; padding: 20px;">
				<div class="row" style="border: 1px solid black; border-radius: 20px;">
					 <form action="/registerCarpool.do" method="post"> 
					    <table style="border: 1px solid #fff; width: 500px;"> 
					        <tbody> 
					  
					            <tr> 
					                <th rowspan="2" style="width:30%; text-align:center;">출발</th> 
					                <td>
					                    <select class="form-control" name="departureRegion" id="city" style="width:70%;">
					                        <option value="" selected disabled>시/도</option>
					                        <option value="서울">서울</option>
					                        <option value="경기">경기</option>
					                        <option value="인천">인천</option>
					                        <option value="강원">강원</option>
					                        <option value="부산">부산</option>
					                        <option value="대구">대구</option>
					                        <option value="광주">광주</option>
					                    </select>	
					                </td>
					            </tr> 
					            <tr> 
					                <td>
								<input type="hidden" id="driverNo" name="driverNo" value="${sessionScope.m.memberNo }">
								<input type="hidden" name="onewayRound" value="1">
							    <input type="text" id="details" name="departureDistrict" placeholder="0/20" style="text-align: right; width:100%;" required>
					                </td>
					            </tr>
					        </tbody> 
					        <tbody> 
					            <tr> 
					                <th rowspan="2"  style="width:30%; text-align:center;">도착</th> 
					                <td>
					                    <select class="form-control" name="arrivalRegion" id="city" style="width:70%;">
					                        <option value="" selected disabled>시/도</option>
					                        <option value="서울">서울</option>
					                        <option value="경기">경기</option>
					                        <option value="인천">인천</option>
					                        <option value="강원">강원</option>
					                        <option value="부산">부산</option>
					                        <option value="대구">대구</option>
					                        <option value="광주">광주</option>
					                    </select>	
					                </td>
					            </tr> 
					            <tr> 
					                <td>
							    <input type="text" id="details" name="arrivalDistrict" placeholder="0/20" style="text-align: right; width: 100%;" required>
					                </td>
					            </tr>
					        </tbody> 
					    </table>
					    <br>
					    <div class="tab-wrap" style="width: 800px; margin: 10px auto;">
					        <ul class="tabs" style=" margin: 0; padding: 0; list-style-type: none;
					        overflow: hidden;  cursor: pointer;">
					            <li class="trip oneway" style=" float: left; width: 50%; height: 50px; text-align: center;
					            line-height: 50px; background-color: #F9E2AF;">편도</li>
					            <li class="trip round" style=" float: left; width: 50%; height: 50px; text-align: center;
					            line-height: 50px; background-color: #ad8b73; color: #fffbe9;">왕복</li>
					        </ul><br><br>
					    </div>
					    <div class="content-wrap">
					        <div class="tabcontent" style="margin-bottom: 30px;">
					            <table> 
					                <tbody> 
					                    <tr class="depart"> 
					                        <th style="width:35%; text-align:center;">출발</th> 
					                        <td>
					                        	<div>
					                            <!--daterangepicker-->
					                            <input type="text" id="departureDate" name="departureDate" required>
					                            <div id="calendar-area"></div>
					                        	</div>
					                        </td>
					                        <td>
					                            <!--오전 오후 중에 체크하는 radio-->
					                            <input type="radio" id="am" name="departureTime" value="0" required>
					                            <label for="am-time">오전</label>
					                            <input type="radio" id="pm" name="departureTime" value="1" required>
					                            <label for="pm-time">오후</label>		
					                        </td>
					                    </tr> 
					                    <!-- daterangepicker
					                     <tr class="arrive"> 
					                        <th style="width:35%; text-align:center;">복귀</th> 
					                        <td>
					                            <input type="text" id="returnDate" name="returnDate" required>
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
					                        <th style="text-align:center;">인원</th>
					                        <td>
					                            <select class="form-control" name="capacity" id="capacity">
					                                <option value="" selected disabled>탑승인원</option>
					                                <option value="1">1명</option>
					                                <option value="2">2명</option>
					                                <option value="3">3명</option>
					                                <option value="4">4명</option>
					                                <option value="5">5명</option>
					                                <option value="6">6명</option>
					                            </select>	
					                        </td>
					                        <td>
					                            <label for="surfboardRoom" onclick="toggleStorage()" style="cursor: pointer;">보드 수납가능</label>
					                            <input type="checkbox" id="surfboardRoom" name="surfboardRoom"  value="1"> 
					                        </td>
					                    </tr>
					                    <tr>
					                        <th style="text-align:center;">금액</th>
					                        <td>
					                            <input type="number" id="carpoolPrice" name="carpoolPrice" placeholder="원" style="text-align: right;">
					                        </td>
					                    </tr>
					                    <tr>
					                        <th style="text-align:center;">상세</th>
					                        <td rowspan="4"><input type="text" id="driverMsg" name="driverMsg" placeholder="0/60" style="text-align: right;" required></td>
					                    </tr>
					                </table>
											
					        </div>
							<!-- 
					       
					                    -->
					        
					    </div>
					    <div class="button-wrap"  style="text-align: center; margin-bottom:20px;">
					        <button type="button" class="btn cancel" style="margin-right:20px; width: 100px; height:45px;"><a href="carpoolMain.do">취소하기</a></button>
					        <button type="submit" class="btn btn-primary" style="width: 100px; height:45px; text-align:center;">등록</button>
					    </div>
					 </form>
				
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
	   <a href="/carpoolMain.do">카풀 메인으로</a>




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
    $(".round").on("click", function(){
    	$("[name=onewayRound]").val(2);
    	$(".depart").after(
    			  '<tr class="arrive">' +
    	            '<th style="width:35%; text-align:center;">복귀</th>' +
    	            '<td>' +
    	                '<input type="text" id="returnDate" name="returnDate" required>' +
    	                '<div id="calendar-area2"></div>'+
    	            '</td>' +
    	            '<td>' +
    	                '<input type="radio" id="am" name="returnTime" value="0" required>' +
    	                '<label for="am-time">오전</label>' +
    	                '<input type="radio" id="pm" name="returnTime" value="1" required>' +
    	                '<label for="pm-time">오후</label>' +
    	            '</td>' +
    	        '</tr>'
            	)	
  	  });
    $(".oneway").on("click", function(){
    	$(".arrive").remove();
    	$("[name=onewayRound]").val(1);
    });
    
    $('#departureDate').daterangepicker({
	    parentEl: "#calendar-area",
		locale: {
			format: "YYYY-MM-DD",
			fromLabel: "시작",
			toLabel: "종료"
	    },
	    alwaysShowCalendars: true,
		autoApply: true,
		singleDatePicker: true,
		showDropdowns: true,
		minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
		maxDate : moment().add(1, 'months'),	// 시작일은 3개월 이내에서 지정 가능
	});
    
 // 시작일 input의 value가 바뀌면, 적절하게 minDate와 maxDate를 구성해서 종료일 date range picker를 생성  
	$("#departureDate").on("change", function(){
		const departureDate = $("#departureDate").val();	// 시작일+1을 minDate로 사용할 예정
	// maxDate는 시작일+3개월로 초기화 
		var maxLimit = moment(departureDate).add(15, 'days').format("YYYY-MM-DD");

		$('#returnDate').daterangepicker({
		    parentEl: "#calendar-area2",
			locale: {
				format: "YYYY-MM-DD",
				fromLabel: "시작",
				toLabel: "종료"
		    },
		    alwaysShowCalendars: true,
			autoApply: true,
			singleDatePicker: true,
			showDropdowns: true,
			minDate: departureDate,
			maxDate: maxLimit
		});
	});
    


	function toggleStorage() {
	    var surfboardRoom = document.getElementById("surfboardRoom");
	    if (surfboardRoom.checked) {
	        surfboardRoom.parentNode.style.backgroundColor = ""; // 선택 해제 시 배경색 투명색으로 변경
	        console.log(surfboardRoom.checked);
	    } else {
	        surfboardRoom.parentNode.style.backgroundColor = "#a3e8af"; // 선택 시 배경색 초록색으로 변경
	        console.log(surfboardRoom.checked);
	    }
	};


		
	</script>

</body>
</html>


