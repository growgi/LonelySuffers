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
<link rel="stylesheet" href="/src/main/webapp/css/carpool/carpoolReg.css">
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
			<div class="container"style="width: 800px; margin-top: 20px">
				<div class="row" style="background-color: #DAF5FF; border-radius: 20px;">
				 <form action="/registerCarpool.do" method="post">
				    <table style="border: 1px solid #fff; width: 500px;"> 
        <tbody> 
            <tr> 
                <th rowspan="2">출발</th> 
                <td>
                    <select class="form-control" name="departureRegion" id="city">
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
		    <input type="text" id="details" name="departureDistrict" placeholder="0/20" style="text-align: right;">
                </td>
            </tr>
        </tbody> 
        <tbody> 
            <tr> 
                <th rowspan="2">도착</th> 
                <td>
                    <select class="form-control" name="arrivalRegion" id="city">
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
		    <input type="text" id="details" name="arrivalDistrict" placeholder="0/20" style="text-align: right;">
                </td>
            </tr>
        </tbody> 
    </table>
    <br>
    <div class="onewayRound">
        <div class="trip oneway">편도</div>
        <div class="trip round">왕복</div>
    </div>
    <table>
        <tbody> 
            <tr> 
                <th>출발</th> 
                <td>
                    <!--달력 api-->
                    <input type="date" id="start" name="trip-start"
                       value="2023-05-03"
                       min="2023-05-03" max="2023-12-31">
                </td>
                <td>
                    <!--오전 오후 중에 체크하는 radio-->
                    <input type="radio" id="am" name="departureTime" value="0" value="am">
                    <label for="am">오전</label>
                    <input type="radio" id="pm" name="departureTime" value="0" value="pm">
                    <label for="pm">오후</label>		
                </td>
            </tr> 
            <tr>
                <th>인원</th>
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
                    <input type="checkbox" id="surfboardRoom" name="surfboardRoom" style="display:none" value="1"> 
                </td>
            </tr>
            <tr>
                <th>금액</th>
                <td>
                    <input type="text" id="carpoolPrice" name="carpoolPrice" placeholder="원" style="text-align: right;">
                </td>
            </tr>
            <tr>
                <th>상세</th>
                <td rowspan="4"><input type="text" id="driverMsg" name="driverMsg" placeholder="0/60" style="text-align: right;"></td>
            </tr>
        </table>
        <button type="button" class="btn cancel"><a href="carpoolMain.do">취소하기</a></button>
        <button type="submit" class="btn btn-primary">등록</button>
				 </form>
				</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
	   <a href="/carpoolMain.do">카풀 메인으로</a>




		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/parallax.js"></script>
	<script src="js/animate.js"></script>
	<script src="js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	<script>
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


