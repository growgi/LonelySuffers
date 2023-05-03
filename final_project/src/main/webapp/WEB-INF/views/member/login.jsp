<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,400,0,0" />

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
			<div class="main">
			<div class="content-top">
							<p class="waveEffectWord-back" >Lonely Surfers</p>
							<p class="waveEffectWord-front">Lonely Surfers</p>
			</div>
			<div class="content-main">
				<div class="main-top">
					<form action="/login.do" method="post" class="customInput" onsubmit="return frm_check();">
					<div>
					<input type="text" name="memberId" id="memberId" class="inputVaild " required autocomplete="off">
					<label>아이디</label>
					</div>
					<div>
					<input type="password" name="memberPw" id="memberPw" class="inputVaild" required>
					<label>비밀번호</label>
					</div>
					  <fieldset>
					  <label class="toggleSwitch">
					   <input role="switch" type ="checkbox" name="saveId" id="saveId"/>
					   <span>아이디 저장</span>
					  </label>
					   <label class="toggleSwitch">
					   <input role="switch" type ="checkbox"  name="savePw" id="savePw"/>
					   <span>비밀번호 저장</span>
					  </label>
					  </fieldset>
					<input class=" btn-success " type="submit" value ="로그인">
					</form>
				</div>
			</div>
		<div class="main-bottom">
				<a id="findIdBtn" class="btn-success">아이디 찾기</a>
				<a id="findPwBtn" data-target="#findPw" class="btn-success">비밀번호 찾기</a>
				<a href="/joinMemberFrm.do" id="joinMember" class="btn-success">회원가입</a>
			</div>
		</div>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->
	<div class="modal fade" id="findId" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Surfers</h4><br>
          <span>아이디 찾기</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<div class="findMemberId">
	        	<div class="form-group">
	            <form action="/findMemberId.do" method="post" class="customInputLong">
	            <div>
	              <input type="text" name="findMemberName" id="findMemberName" class="inputVaild " required>
	              <label for="findMemberName">이름</label>
	            </div>
	            <div>
	              <input type="text" name="findMemberEmail" id="findMemberEmail" class="inputVaild " required>
	              <label for="findMemberEmail">이메일</label>
	            </div>
	              <span class="dataNull"></span><br>
	              <button type="button" class="btn-successs btn-block selectIdBtn"><span class="glyphicon glyphicon-search"></span> 찾기</button>
	              </form>
	            </div>
            </div>
            <div class="selectId">
            <div class="form-group">
              <h3>조회된 아이디는</h3>
              <h3>[ <span class="findIdInput"></span> ]입니다.</h3>
            </div>
              <button type="button" class="btn-successs btn-block idOkBtn"><span class="glyphicon glyphicon-ok"></span> 확인</button>
        	</div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-successs btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div>
      <!-- id찾기 모달 끝 -->
<div class="modal fade" id="findPw" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Lonely Surfers</h4><br>
          <span>비밀번호 찾기</span>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        	<div class="findMemberPw">
        	<div class="form-group">
            <form action="/findMemberPw.do" class="customInputLong" method="post" >
              <div>
              <input type="text" name="memberId" class="findMemberPwId inputVaild" required>
              <label>아이디</label>
              </div>
              <div>
              <input type="text" name="memberEmail" class="findMemberPwEmail inputVaild" required>
              <label>이메일</label>
              </div>
              <button type="submit" class="btn-successs btn-block selectPwBtn"><span class="glyphicon glyphicon-search"></span> 찾기</button>
              </form>
            </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right btn-successs" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
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
	<script src="resources/js/loginFrm.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>
