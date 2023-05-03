<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/joinMember.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />

<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>회원 가입 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">


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
					<div class="content">
						<div class="content-title">회원가입</div>
						<input type="hidden" class="idChkVal" value='0'>
						<form action="/joinMember.do" autocomplete="off" method="post" class="customInput">
							<div>
							<input type="text" name="memberId" id="memberId" class="longinput inputVaild" required><button type="button" name="idChk">중복체크</button>
							<label for="memberId">아이디</label>
							</div>
							<div>
							<input type="password" name="memberPw" id="memberPw" class="longinput inputVaild" required>
							<label for="memberPw">비밀번호</label>
							</div>
							<div>
							<input type="password" name="memberPwRe" id="memberPwRe" class="longinput inputVaild" required>
							<label for="memberPwRe">비밀번호 확인</label>
							</div>
							<span id="pwChkSpan"></span>
							<div>
							<input type="text" name="memberName" id="memberName" maxlength="6" class="longinput inputVaild" required>
							<label for="memberName">이름</label>
							</div>
							<div>
							<input type="text" name="memberPhone" id="memberPhone" class="longinput inputVaild" required>
							<label for="memberPhone">전화번호</label>
							</div>
							<div class="customShort">
							<input type="text" name="email1" class="email1 customShortInput inputVaild" id="email1" required>
							<label for="email1">이메일</label>
							<p>@</p>
							<input type="text" class="email2 inputVaild" name="email2" id="email2" required>
							<select class="emailSelect" >
								<option value="" selected>직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
							
							<button type="button" name="emailChk" id="myBtn">이메일인증</button>
							</div>
							<input type="hidden" class="emailChk" value="0">
							<input type="hidden" name="memberEmail">
							<label>성별</label><br>
							<label for="m" class="memberGender"><span class="material-symbols-outlined">man</span></label>
							<label for="f" class="memberGender"><span class="material-symbols-outlined">woman</span></label>
							<input type="radio" name="memberGender" id="m" value = 1>
							<input type="radio" name="memberGender" id="f" value = 2><br><br>
							<div class="joinBtn">
							<button type="button" onclick="cancel();">취소</button>
							<button type="submit" onclick="return notsubmit();">가입</button> 
							</div>
							
	
						</form>
					</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Surfers</h4><br>
          <span>이메일인증</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group" style="text-align: center">
              <label for="emailCode">인증코드</label>
              <input type="text" maxlength='8'class="customEmailCode"id="emailCode" required>
              <input type="hidden" class="form-control" name="emailCode">
            </div>
              <button type="button" class="btn btn-success btn-block" name="emailCodeChk"><span class="glyphicon glyphicon-share"></span> 인증</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
       </div>
        </div>
        
       <!-- Modal -->
  <div class="modal fade" id="idChkModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Surfers</h4><br>
          <span>아이디 중복체크</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<div class="notUseId">
        	<div class="form-group customInput">
        		<div>
              <input type="text" class="form-control" id="notUseIdInput" required>
              <label for="notUseIdInput">아이디</label>
			  <span></span>        		
        	 </div>
              <span>사용 가능한 아이디 입니다</span>
              <button type="button" class="btn btn-success btn-block successId"><span class="glyphicon glyphicon-ok"></span>사용하기</button>
            </div>
            </div>
            <div class="useId">
	          <form role="form">
	            <div class="form-group">
	              <label for="userIdInput">아이디</label>
	              <input type="text" class="form-control" name="userIdInput" id="userIdInput" placeholder="아이디">
	              <span>이미 사용중인 아이디 입니다</span>
	            </div>
	              <button type="button" class="btn btn-success btn-block idChkBtn"><span class="glyphicon glyphicon-share"></span>중복체크</button>
	          </form>
        	</div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
      




		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<script src="resources/js/joinMember.js" ></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>