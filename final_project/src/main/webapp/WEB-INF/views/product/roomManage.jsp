<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>객실 관리 - Lonely Surfers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

<style>
.product-detail>div{
	margin-top:20px;
	margin-bottom:20px;
}
.nav-item {
	width: 50%;
	background-color: #3ac5c8;
	text-align: center;
}
.nav-link { color: #ffffff; }
table {
	margin-top: 20px;
}
th {
	height: 60px;
	text-indent: 15px;
}
input[type="number"], input[type="time"] {
	text-align: right;
}
#here > div > * {
	display: inline-block;
}
#here > div > input {
	width: 80%;
}
.has-error .form-control {
	border-width: 3px;
}
</style>
</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>객실 관리</h2>
						<p class="lead"></p>
					</div>
				</div>
			</div>
		</section>

		<section class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-5 product-detail">
							<h2>${house.roomTitle } <span class="label label-primary">${house.roomCapa }인실</span></h2>
							<h4><span style="font-size: 30px; font-weight: bold;"><fmt:formatNumber value="${house.housePrice }" pattern="#,###" /></span>원/1박</h4>
						<c:choose>
						<c:when test="${house.housePhoto1 == null }">
						<div class="row" style="height: 450px;">
							<div class="col-md-2"></div>
							<div class="col-md-8">
								<div class="waveEffect" style="margin: 0 auto;">
									<p class="waveEffectWord-back" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
									<p class="waveEffectWord-front" style="text-align: center; line-height: 1100%;">사진이 없습니다</p>
								</div>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div style="height: 450px; overflow: clip"><img class="bigThumbnailImage" src="resources/upload/house/${house.housePhoto1 }" style="width: 100%;"></div>
						</c:otherwise>
						</c:choose>
					</div>
					<!-- end col -->

					<div class="col-md-1"></div>

					<div class="col-md-6">
						<div class="row">
						<div class="card mt-2 tab-card">
							<div class="row tab-card-header">
								<ul class="nav nav-tabs card-header-tabs">
									<li class="nav-item active">
										<a class="nav-link" id="one-tab" data-toggle="tab" href="#one" role="tab" aria-controls="One" aria-selected="false">기존 객실 관리</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" id="two-tab" data-toggle="tab" href="#two" role="tab" aria-controls="Two" aria-selected="false">신규 객실 추가</a>
									</li>
								</ul>
							</div>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade p-2 active in" id="one" role="tabpanel" aria-labelledby="one-tab">
									<c:choose>
										<c:when test="${fn:length(rooms) == 0 }">
										<div class="panel panel-danger" style="margin-top: 30px;">
											<div class="panel-heading">이 숙박상품에 대해 등록된 객실이 없습니다.</div>
											<div class="panel-body">먼저 객실을 등록해주십시오.</div>
										</div>
										</c:when>
										<c:otherwise>
										<table width=100%; class="table-striped" id="houseInsertForm">
											<thead>
												<tr>
													<th style="display: none;">객실 번호</th>
													<th width=16%;>객실 이름</th>
													<th width=16%;></th>
													<th width=18%;>활성 상태</th>
													<th width=50%;>비고</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${rooms }" var="r">
			                                	<tr>
			                                		<td style="display: none;">${r.roomNo }</td>
			                                		<td style="text-indent: 10px;">${r.roomName }</td>
			                                		<td><button type="button" onclick="renameRoom(this)" data-toggle="modal" data-target="#renamer">이름 변경</button></td>
													<td>
														<select class="form-control roomEnable" style="text-align: center;">
														<c:choose>
															<c:when test="${r.roomEnable == 1}">
																<option value="1" selected>사용</option>
																<option value="0">사용중지</option>
															</c:when>
															<c:when test="${r.roomEnable == 0}">
																<option value="1">사용</option>
																<option value="0" selected>사용중지</option>
															</c:when>
														</c:choose>
														</select>
													</td>
			                                		<td style="text-indent: 10px;">${r.roomDescription }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<div>
											<button class="btn btn-default" id="saveEnables" onclick="saveAllRoomsStstus()" style="display: none;">각 객실들의 활성 상태를 현재 선택한 값들로 저장하기</button>
										</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="tab-pane fade p-2" id="two" role="tabpanel" aria-labelledby="two-tab">
									<input type="hidden" name="checkFail" value="-1">
									<form action="/insertRooms.do" method="post">
										<fieldset>
											<table width=100%; class="table-striped" id="roomInsertForm">
												<input type="hidden" name="houseNo" value="${house.houseNo }">
												<tr style="display: none;">
													<th style="display: none;">숙박소 이름</th>
													<td style="display: none;"><input type="hidden" name="roomTitle" value="${house.roomTitle }"></td>
												</tr>
												<tr style="display: none;">
													<th style="display: none;">객실 인원 (명)</th>
													<td style="display: none;"><input type="hidden" name="roomCapa" value="${house.roomCapa }"></td>
												</tr>
												<tr>
													<th style="vertical-align: top; padding-top: 12px; width: 50%;">객실 이름 <button type="button" onclick="insertNextRoom(this)">객실 추가</button></th>
													<td width=50%; id="here"><div id="defaultRoom"><input type="text" class="form-control" name="roomNames" maxlength="30" placeholder="한글 최대 10자" required></div></td>
												</tr>
												<tr>
													<th>비고(메모)</th>
													<td><textarea name="roomDescription" class="form-control" rows="4" maxlength="3000" placeholder="여기에 적은 내용은 고객들에게는 노출되지 않습니다. (한글 최대 1000자)"></textarea></td>
												</tr>
												<tr>
													<td colspan="2" style="text-align: center;"><button type="button" class="btn btn-default" onclick="checkDuplicate()">객실 이름 중복 확인</button>
													<button id="hiddenSubmit" type="submit" style="display: none;">객실 등록</button></td>
												</tr>
											</table>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div><!-- end col -->
						</div>
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->

  <!-- 객실 이름 변경하기 제출form용 Modal -->
  <div class="modal fade" id="renamer" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <form action="/renameRoom.do?houseNo=${house.houseNo }" method="post">
        	<fieldset>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">객실 이름 변경하기</h4>
        </div>
        <div class="modal-body">
				<input type="hidden" name="roomNo">
				<input type="hidden" name="originRoomName">
				객실 이름: <input type="text" class="form-control" style="width: 50%; display: inline-block;" name="roomNewName" id="focusing" maxlength="30" placeholder="한글 최대 10자" required>
				<br><br>비고<br>
				<textarea name="roomNewDescription" class="form-control" rows="4" maxlength="3000" placeholder="여기에 적은 내용은 고객들에게는 노출되지 않습니다. (한글 최대 1000자)"></textarea>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="checkRoomNewName()">변경하기</button>
		  <button id="goRenamer" type="submit" style="display: none;">submit</button>
        </div>
        	</fieldset>
        </form>
      </div>
      
    </div>
  </div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	<script type="text/javascript">
// modal 내 input에 focus를 
	$(document).ready(function() {
		$(".modal").on("shown.bs.modal", function () {		
			$("[name=newRoomName").focus();
		});	
	});

//url로부터 lessonNo값 알아내기
	const ltrim = /^\S{0,}houseNo=/;
	const currentUrl = window.location.href;
	const needRtrim = currentUrl.replace(ltrim, "");
	const rtrim = /[&]\S{0,}$/;
	const houseNoFromUrl = needRtrim.replace(rtrim, "");
//url로부터 lessonNo 도출 끝


// 활성 상태의 값 변경을 감지하여 저장 버튼 표시
	$(".roomEnable").on("change", function(){
		$("#saveEnables").css("display", "block");
	});


// 모든 객실들의 활성 상태값 저장
	function saveAllRoomsStstus(obj){
		const roomNo = new Array();
		const roomEnable = new Array();

		const rows = $("#houseInsertForm > tbody > tr");
	    rows.each(function(index, item) {
			const roomNoTd = $(item).children().eq(0).text();
			roomNo.push(roomNoTd);

			const roomEnableTd = $(item).children().eq(3).find("select").val();
			roomEnable.push(roomEnableTd);

			location.href = "/updateRoomEnable.do?houseNo=" + houseNoFromUrl + "&roomNo=" + roomNo.join("/") + "&roomEnable=" + roomEnable.join("/");
		});
	}


// 객실 이름 변경을 누르면 modal 내 input의 value를 변경하는 함수 
	function renameRoom(obj){
		const roomNo = $(obj).parent().parent().children().eq(0).text();
		const roomName = $(obj).parent().parent().children().eq(1).text();
		const roomDescription = $(obj).parent().parent().children().eq(4).text();
		$("[name=roomNo]").val(roomNo);
		$("[name=originRoomName]").val(roomName);
		$("[name=roomNewName]").val(roomName);
		$("[name=roomNewDescription]").val(roomDescription);
	}



// 기존 객실의 이름과 비고란을 변경하기 전에 객실이름 중복 검사
	function checkRoomNewName(){
		const trimedNewName = $("[name=roomNewName]").val().trim().replace(/\s+/g," ");
		$("[name=roomNewName]").val(trimedNewName);
		if( $("[name=originRoomName]").val() != $("[name=roomNewName]").val() ){
			$.ajax({
					url : "/checkRoomNewName.do",
					data: {roomTitle : $("[name=roomTitle]").val(), roomName : $("[name=roomNewName]").val()},
					success : function(data){
						if(data==0){
							$("#goRenamer").click();
						}else{
							alert('이 숙박소에 속한 객실들 중에 이미 동일한 이름이 있습니다. 다른 이름을 사용해주십시오.');
						}
					}
			});
		}else{
			$("#goRenamer").click();
		}
	}


// 객실 이름 입력란 추가 함수
	function insertNextRoom(obj){
		const maximum = 20;	// 한 번에 등록할 수 있는 최대 객실 수
		const removeButton = $("<button>");
		removeButton.attr("type", "button");
		removeButton.attr("onclick", "removePrevRoom(this)");
		removeButton.text("제거");

		const textInput = $("<input>");
		textInput.attr("type", "text");
		textInput.attr("class", "form-control");
		textInput.attr("name", "roomNames");
		textInput.attr("placeholder", "한글 최대 10자");
		textInput.attr("required", true);

		const wrapper = $("<div>");

	// 2개 이상을 더 추가할 여유가 남았으면, 추가 버튼과 제거 버튼을 달아줌
		if($("[name=roomNames]").length < maximum){
			wrapper.append(textInput).append(removeButton);
			$("#here").append(wrapper);
	// 더 이상 추가할 여유가 없는 경우
		}else{
			alert("한 번에 등록할 수 있는 객실은 최대 "+maximum+"개입니다.");
		}
	}


// 객실 이름 입력란 제거 함수
	function removePrevRoom(obj){
		$(obj).parent().remove();
	}


// 객실이름 중복 확인
	function checkDuplicate(){
	// 객실 이름 input(name=roomNames)에 중복이 있으면 form 제출을 막음
		$("[name=roomNames]").parent().removeClass("has-error");
		$("[name=checkFail]").val("0");
		const roomName = $("[name=roomNames]");
		for(let i=0; i<roomName.length; i++){
			const trimedName = $("[name=roomNames]").eq(i).val().trim().replace(/\s+/g," ");
			$("[name=roomNames]").eq(i).val(trimedName);
		}
		let duplicate = 0;
		for(let i=0; i<roomName.length; i++){
			for(let j=i+1; j<roomName.length; j++){
				if( roomName[i].value == roomName[j].value ){
					duplicate++;
					roomName.eq(j).parent().addClass("has-error");
				}
			}
		}
		if(duplicate > 0){
			$("[name=checkFail]").val("1");
			alert('중복된 객실 이름이 있습니다');
		}else{
			checkRoomNameInSameRoomTitle();
		}
	}


// 같은 숙소 이름 안에서 객실 이름 중복 여부 검사
	function checkRoomNameInSameRoomTitle(){
		const allRoomName = $("[name=roomNames]");
		let roomNameVal = [];
		for(let i=0; i<allRoomName.length; i++){
			roomNameVal[i] = allRoomName[i].value;
		}
		$.ajax({
				url : "/checkRoomName.do",
				type: "POST",
				data: {roomNames : roomNameVal, roomTitle : $("[name=roomTitle]").val()},
				dataType : "json",
				async: false,
				success : function(List){
					for(let i=0; i<List.length; i++){
						const roomName = $("[name=roomNames]");
						for(let j=0; j<roomName.length; j++){
							if(roomName.eq(j).val()==List[i]){
								roomName.eq(j).parent().addClass("has-error");
							}
						}
	    			}
					if(List.length>0){
						alert('이 숙박소에 속한 객실들 중에 이미 동일한 이름이 있습니다');
					}else{
						$("#hiddenSubmit").click();
					}
				}
		});
	}

	</script>
</body>
</html>