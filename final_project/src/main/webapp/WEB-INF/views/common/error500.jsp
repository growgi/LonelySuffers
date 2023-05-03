<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용에 불편을 드려 죄송합니다.</title>
<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400" rel="stylesheet">
<link rel="stylesheet" href="resources/css/error.css">
</head>
<body class="loading">
	  <h1 style="font-size:55px;font-weight:600;">이용에 불편을 드려 죄송합니다</h1>
	  <h2><span class="timeSpan"></span> 초 후 메인페이지로 이동합니다</h2>
	  <div class="gears">
	    <div class="gear one">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
	    <div class="gear two">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
	    <div class="gear three">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
	  </div>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="js/main.js" type="text/javascript"></script>
  <script src="resources/js/error.js"></script>
  <script type="text/javascript">
  
  
	let intervalId;
	function authTime(){
		$(".timeSpan").text("6");
		intervalId = window.setInterval(function(){
			timeCount();
		},1000);
	}
	
	function timeCount(){
		const sec = $('.timeSpan').text();
		if(sec != 0){
			const timeSec = Number(sec)-1;
			$('.timeSpan').text(timeSec);
		}else{
			location.href="/main.do";
		}
		
	}
	
	$(function(){
		  authTime();
	  })

	</script>
</body>
</html>