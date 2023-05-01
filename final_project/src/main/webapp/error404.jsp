<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400" rel="stylesheet">
<link rel="stylesheet" href="resources/css/error.css">
</head>
<body class="loading">
	  <h1>404</h1>
	  <h2><span class="timeSpan">10</span>초 후 메인으로 이동합니다<b>:(</b></h2>
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
		$(".timeSpan").text("10");
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