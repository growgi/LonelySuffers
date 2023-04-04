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
<link rel="stylesheet" href="/src/main/webapp/css/carpool/carpoolOffer.css">
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


		<!--출발일, 등록일 내림차순-->
		<section class="section" style="padding-top: 0px; padding-bottom: 30px;">
			<div class="container">
				<div class="row">
				 <form action="/updateNotice.do" method="post">
   <table>
   <div class="form-group">
						<label for="usrname">출발</label>
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
						<input type="text" class="form-control" name="departDistrict" id="city" placeholder="상세주소">
					</div>
      <tr>
         <th>번호</th>
         <td><input type="text" name="noticeNo" value="${n.noticeNo }" readonly></td>
      </tr>
      <tr>
         <th>작성자</th>
         <td><input type="text" value="${n.noticeWriter }" readonly></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" name="noticeTitle" value="${n.noticeTitle }"></td>
      </tr>
      <div class="check-box-wrap"  style="height: 60px;">
						<div class="check-box left">
							<input type="radio" id="am" name="departureTime" value="0" style="display: none;" onclick="timeAm()"><label for="am-time"><span class="material-symbols-outlined">check</span>오전</label>
						</div>
						<div class="check-box right">
							<input type="radio" id="pm" name="departureTime" value="1" style="display: none;" onclick="timePm()"><label for="pm-time"><span class="material-symbols-outlined">check</span>오후</label><br>
						</div>
					</div>
      <tr>
         <th>내용</th>
         <td><textarea name="noticeContent" >${n.noticeContent }</textarea></td>
      </tr>
      <tr>
         <th>작성시간</th>
         <td><intput type="text" value="${notice.noticeDate }" readonly></td>
      </tr>
      <tr>
         <th><input type="button" value="취소하기"></th>
         <th><input type="submit" value="등록하기"></th>
      </tr>
   </table>
   </form>
   <a href="/">메인으로</a>
				</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->




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
	

		
	</script>

</body>
</html>


