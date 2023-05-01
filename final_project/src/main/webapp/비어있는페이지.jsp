<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>이 페이지의 제목을 적어주세요 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<table
			style='width: 720px; margin: 0 auto; border-top: 6px solid #0eb6e6; border-left: 1px solid #dfdfdf; border-right: 1px solid #dfdfdf; border-bottom: 1px solid #dfdfdf; box-sizing: border-box; border-collapse: collapse; border-spacing: 0; background: #ffffff; font-family: dotum,'돋움', sans-serif'>
			<tbody>
				<tr>
					<td height='25' colspan='3'></td>
				</tr>
				<tr>
					<td width='30'
						style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
					<td width='630' height='100px'
						style='margin: 0; padding: 0; font-size: 50px; line-height: 0'><div>
							<p style='font-size: 50px;'>Lonely Surfers</p>
						</div></td>
					<td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
				</tr>
				<tr>
					<td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
					<td style='margin: 0; padding: 0; font-size: 0; line-height: 0'><table
							cellspacing='0' cellpadding='0' border='0' style='width: 100%'>
							<tbody>
								<tr>
									<td height='40'
										style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
								</tr>
								<tr>
									<td
										style='margin: 0; padding: 0; font-size: 14px; line-height: 21px; color: #444; font-weight: 700'>안녕하세요!<span
										style='color: #0eb6e6'>mom***</span>님
									</td>
								</tr>
								<tr>
									<td height='20'
										style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
								</tr>
								<tr>
									<td
										style='font-size: 12px; color: #444444; line-height: 21px; margin: 0; padding: 0'>이메일은
										Lonely Suffers에 등록하신 귀하의 이메일을 인증하기 위해 전송되었습니다.<br>아래
										인증번호를 입력해서 이메일 인증을 완료해주세요.
									</td>
								</tr>
								<tr>
									<td height='35'
										style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
								</tr>
								<tr>
									<td style='line-height: 12px; font-size: 20px'><span
										style='font-size: 30px; font-weight: 600;'>[</span><span
										style='font-size: 30px; color: red; font-weight: 600;'>"+sb.toString()+"</span><span
										style='font-size: 30px; font-weight: 600;'>]</span></td>
								</tr>
								<tr>
									<td height='37'
										style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
								</tr>
								<tr>
									<td
										style='font-size: 12px; color: #444444; line-height: 21px; marin: 0; padding: 0'>인증메일
										유효시간은 <strong>메일 수신일 기준 24시간</strong> 이내입니다.<br> 이메일 인증
										완료 후에는 아이디/비밀번호 찾기 시 이메일 정보로 확인이 가능합니다.<br> <br>감사합니다.
									</td>
								</tr>
								<tr>
									<td height='80'
										style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
								</tr>
							</tbody>
						</table></td>
					<td style='margin: 0; padding: 0; font-size: 0; line-height: 0'></td>
				</tr>
				<tr>
					<td style='vertical-align: middle; font-family: dotum' colspan='3'><table
							width='718'
							style='margin: 0; background: #f9f9f9; overflow: hidden; text-align: left'>
							<tbody>
								<tr>
									<td width='400px'
										style='padding: 19px 0 17px 0; text-align: center'></td>
									<td width='550'
										style='margin: 0; padding: 36px 0 32px 0; font-family: dotum, sans-serif; font-size: 11px; line-height: 18px; color: #999'>㈜지니뮤직<span
										style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>서울
										영등포구 선유동2로 57 이레빌딩(구관) 19F,20F<br>사업자등록번호:123-45-7890<span
										style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>통신판매업신고:2023-서울영등-01234<br>개인정보보호책임자
										플랫폼사업본부 홍길동 본부장<span
										style='margin: 0; padding: 0 8px; color: #d7d7d7'>|</span>문의전화:010-5669-8920<br>COPYRIGHT©Lonely
										Suffers CORP ALL RIGHTS RESERVED.
									</td>
								</tr>
							</tbody>
						</table></td>
				</tr>
			</tbody>
		</table>
		




		<!-- section은 container의 바탕(배경색)을 담당합니다. -->
		<!-- section은 위아래로 margin이 크게 잡혀 있습니다. -->
		<!-- class를 section 이 아니라 section nopad 로 하시면, 좌우 여백 없이 화면 너비 크기 전체에다가 section의 background-color를 부여할 수 있습니다. -->
		<section class="section">
			<!--  container는 구현 내용물들을 담는 div입니다. -->
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					class가 row인 div 바로 아래에 적힌 글입니다.<br> 부모 div의 class가
					container이므로<br> container의 너비인 1300px을 사용합니다. container의 너비인
					1300px을 사용합니다. container의 너비인 1300px을 사용합니다. container의 너비인 1300px을
					사용합니다. container의 너비인 1300px을 사용합니다.
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<section class="section">
			<!-- 클래스를 container가 아니라 container-fluid로 주시면, 좌우 여백 공간까지 전부 사용합니다. -->
			<div class="container-fluid">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					class가 row인 div이며 바로 아래에 적힌 글입니다.<br> 부모 div의 class가
					container-fluid이므로<br> container가 아니라 container-fluid이므로 좌우 여백
					없이 화면 너비 크기 전체를 사용합니다. container가 아니라 container-fluid이므로 좌우 여백 없이
					화면 너비 크기 전체를 사용합니다. container가 아니라 container-fluid이므로 좌우 여백 없이 화면
					너비 크기 전체를 사용합니다.
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->





		<section class="section">
			<div class="container">
				<div class="row">
					<!-- class가 row인 div 안에 구현하시면 됩니다. -->
					<div class="col-md-8">
						class가 row인 div 안에,<br> class가 "col-md-숫자"인 div를 만드시면,
						세로(column)로 분할할 수 있습니다. 지금 이 글이 적혀 있는 div는 Grid크기가 8입니다.<br>
						Grid 12가 최대입니다. 여기서 8을 썼으므로, 아직 왼쪽에 4만큼의 공간이 있습니다.<br> 자세한
						설명은 Bootstrap의 Grid system 설명문 <a
							href="https://getbootstrap.com/docs/3.4/css/#grid-options"
							target="_blank">https://getbootstrap.com/docs/3.4/css/</a>을 참조하시면
						됩니다.
					</div>
					<div class="col-md-2">여기는 class가 col-md-2이므로, Grid크기가 2입니다.
						Grid 8짜리보다 너비가 1/4입니다.</div>
					<div class="col-md-2">여기는 class가 col-md-2이므로, Grid크기가 2입니다.</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->






		<section class="section">
			<div class="container">


				<!-- section ＞  container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">


				<div class="row">
					<!-- 이 안에 구현하시면 됩니다. -->
					이 div의 위 아래로,<br> class가 row인 hr태그가 있어서 <b>위아래로 공백이 더 넓게</b>
					생긴 것입니다.
				</div>
				<!-- end row -->

				<!-- section ＞ container 안에 class가 invis1인 hr 태그를 넣으시면, 가로로 큰 공백이 생깁니다. 이 태그를 여러 개를 넣으면 그만큼 공백 높이가 더 높아집니다. -->
				<hr class="invis1">

			</div>
			<!-- end container -->
		</section>
		<!-- end section -->








		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->

	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

</body>
</html>