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
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>객실 등록 - Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">

</head>



<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />


		<section class="section nopad lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>객실 등록</h2>
						<p class="lead"></p>
					</div>
				</div>
			</div>
		</section>

		<section class="section">
			<div class="container">
				<div class="row">
					<input type="hidden" name="checkFail" value="-1">
					<form action="/insertRooms.do" onsubmit="return checkDuplicate();" method="post">
						<fieldset>
							<table>
								<input type="hidden" name="houseNo" value="${house.houseNo }">
								<tr>
									<th>숙박소 이름</th>
									<td><input type="text" name="roomTitle" value="${house.roomTitle }" readonly></td>
								</tr>
								<tr>
									<th>객실 인원</th>
									<td><input type="number" name="roomCapa" value="${house.roomCapa }" readonly>명</td>
								</tr>
								<tr>
									<th>객실 이름 <button type="button" onclick="insertNextRoom(this)">추가</button></th>
									<td id="here"><div id="defaultRoom"><input type="text" name="roomNames" placeholder="한글 최대 10자" required></div></td>
								</tr>
								<tr>
									<th>비고(메모)</th>
									<td><textarea name="roomDescription" placeholder="여기에 적은 내용이 고객들에게는 노출되지 않습니다. (한글 최대 1000자)"></textarea></td>
								</tr>
								<tr>
									<td colspan="2"><button type="button" onclick="checkDuplicate()">객실 이름 중복 확인</button>
									<button type="submit">객실 등록</button></td>
								</tr>
							</table>
						</fieldset>
					</form>
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- end wrapper -->




	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->

	<script type="text/javascript">
// 객실 이름 입력란 추가 함수
	function insertNextRoom(obj){
		const maximum = 20;	// 한 번에 등록할 수 있는 최대 객실 수
		const removeButton = $("<button>");
		removeButton.attr("type", "button");
		removeButton.attr("onclick", "removePrevRoom(this)");
		removeButton.text("제거");

		const textInput = $("<input>");
		textInput.attr("type", "text");
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
		$("[name=roomNames]").css("backgroundColor", "transparent");
		$("[name=checkFail]").val("0");
		const roomName = $("[name=roomNames]");
		let duplicate = 0;
		for(let i=0; i<roomName.length; i++){
			for(let j=i+1; j<roomName.length; j++){
				if( roomName[i].value == roomName[j].value ){
					duplicate++;
					roomName.eq(j).css("backgroundColor", "#ffff66");
				}
			}
		}
		if(duplicate > 0){
			$("[name=checkFail]").val("1");
			alert('중복된 객실 이름이 있습니다');
		}else{
			$.when(checkRoomNameInSameRoomTitle()).done(function(){
				if($("[name=checkFail]").val() != 0){
					return false;
				}else{
					return true;
				}
			});
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
								roomName.eq(j).css("backgroundColor", "#ffcc99");
							}
						}
	    			}
					if(List.length>0){
						alert('이 숙박소에 속한 객실들 중에 이미 동일한 이름이 있습니다');
						return false;
					}else{
						return true;
					}
				}
		});
	}

	</script>
</body>
</html>