// 강습시간대 추가 함수
	function insertNextLesson(obj){	
		const period = Number($("[name=lessonTimeLength]").val());
		if(period < 30){
			alert("먼저 강습 소요시간을 정해야 합니다.");
		}else{
			const prevStart = $(obj).prev().prev().val();	// 이전 시간대의 시작시각 값
			const min = $(obj).prev().prev().attr("min");	// 이전 시간대 input의 min
		// 시작 시각 input의 value가 min ~ max 범위 안이면 수행
			if(moment(prevStart, "HH:mm").diff(moment(min, "HH:mm"), 'minutes')>=0 && moment("17:00", "HH:mm").diff(moment(prevStart, "HH:mm"), 'minutes')>=0){
			// 소요시간을 고정시켜야 하므로 readonly 처리
				$("#lessonTimeLength").prop("readonly", true);
			// 이전 시간대의 종료시각을 계산해서 hidden input의 value로 부여
				$(obj).prev().val(moment(prevStart, 'HH:mm').add(period, 'minutes').format('HH:mm'));

			// 추가된 시간대 input의 min = 이전 시간대 종료시각 + 10분  
				const nextMin = moment(prevStart, 'HH:mm').add(period + 10, 'minutes').format('HH:mm');

				const removeButton = $("<button>");
				removeButton.attr("type", "button");
				removeButton.attr("onclick", "removePrevLesson(this)");
				removeButton.text("제거");

				const addButton = $("<button>");
				addButton.attr("type", "button");
				addButton.attr("onclick", "insertNextLesson(this)");
				addButton.text("추가");

				const startInput = $("<input>");
				startInput.attr("type", "time");
				startInput.attr("class", "form-control");
				startInput.attr("name", "lessonStartTimes");
				startInput.attr("min", nextMin);
				startInput.attr("max", "17:00");
				startInput.attr("step", "300");
				startInput.attr("pattern", "[0-9]{2}:[0-9]{2}");
				startInput.attr("required", true);

				const endInput = $("<input>");
				endInput.attr("name", "lessonEndTimes");
				endInput.attr("type", "hidden");

				const wrapper = $("<div>");

			// 시간대 2개 이상을 더 추가할 여유가 남았으면, 추가 버튼과 제거 버튼을 달아줌
				if(moment("17:00", "HH:mm").diff(moment($(obj).prev().val(), "HH:mm"), 'minutes')>=period+10){
					wrapper.append(startInput).append(endInput).append(addButton).append(removeButton);
					$(obj).prev().prev().prop("readonly", true);
					$(obj).next().remove();
					$(obj).remove();
					$("#here").append(wrapper);
				}else{
				// 시간대 1개만 더 추가할 여유가 남았으면, 제거 버튼만 달아줌. 추가 버튼 자리에는 아무 동작도 없는 버튼을 숨겨서 삽입.
					if(moment("17:00", "HH:mm").diff(moment($(obj).prev().val(), "HH:mm"), 'minutes')>=10){
						wrapper.append(startInput).append(endInput).append($("<button>").attr("type", "button").css("display", "none")).append(removeButton);
						$(obj).prev().prev().prop("readonly", true);
						$(obj).next().remove();
						$(obj).remove();
						$("#here").append(wrapper);
				// 시간대를 더 이상 추가할 여유가 없는 경우
					}else{
						alert("시간대를 추가할 여유가 더 이상 남아있지 않습니다. 다음 시작시각이 오후 5시를 넘을 수 없습니다.");
					}
				}
		// 시작 시각 input의 value가 min ~ max 범위 밖일 때
			}else{
				alert("시작 시각을 올바르게 입력한 뒤, 추가 버튼을 눌러주십시오.");
			}
		}
	}


// 시간대 제거 버튼을 누르면 동작하는 함수
	function removePrevLesson(obj){
		const removeButton = $("<button>");
		removeButton.attr("type", "button");
		removeButton.attr("onclick", "removePrevLesson(this)");
		removeButton.text("제거");

		const addButton = $("<button>");
		addButton.attr("type", "button");
		addButton.attr("onclick", "insertNextLesson(this)");
		addButton.text("추가");

	// 이전 시간대의 readonly 속성을 지워줌
		$(obj).parent().prev().children().eq(0).prop("readonly", false);
	// min이 "06:00"이면, 가장 이른 시간대로 간주하고 제거 버튼을 달지 않음. 또한 소요시간의 readonly 속성을 지워줌
		if($(obj).parent().prev().children().eq(0).attr("min")=="06:00"){
			$(obj).parent().prev().append(addButton);
			$("#lessonTimeLength").prop("readonly", false);
	// 가장 이른 시간대가 아니면, 추가 버튼과 제거 버튼을 둘 다 달아줌
		}else{
			$(obj).parent().prev().append(addButton).append(removeButton);
		}
	// 원하는 시간대 제거
		$(obj).parent().remove();
	}



// 신규 강습 등록 submit 시 동작되는 함수
	function checkLessonCity(){
		const trimedTitle = $("[name=lessonTitle]").val().trim().replace(/\s+/g," ");
		$("[name=lessonTitle]").val(trimedTitle);
		const trimedTeacher = $("[name=lessonTeacher]").val().trim().replace(/\s+/g," ");
		$("[name=lessonTeacher]").val(trimedTeacher);
	// 강습 지역 input(name=lessonCity)이 선택되지 않았으면 form 제출을 막음
		if( $("[name=lessonCity]").val() == null ){
			alert('지역을 선택해주십시오.');
			return false;
		}else{
	// 마지막 종료시각을 계산해서 value로 부여하고 submit
			const period = Number($("[name=lessonTimeLength]").val());
			const lastStartTime = $("[name=lessonStartTimes]").last().val();
			const lastEndTime = $("[name=lessonEndTimes]").last();
			lastEndTime.val(moment(lastStartTime, 'HH:mm').add(period, 'minutes').format('HH:mm'));
			return true;
		}
	}



// 신규 숙박 등록 submit 시 동작되는 함수. 제목들을 trim 후 form action
	function triming(){
		const trimedRoomTitle = $("[name=roomTitle]").val().trim().replace(/\s+/g," ");
		$("[name=roomTitle]").val(trimedRoomTitle);
		const trimedHouseTitle = $("[name=houseTitle]").val().trim().replace(/\s+/g," ");
		$("[name=houseTitle]").val(trimedHouseTitle);
		return true;
	}



// 첨부된 이미지 업로드 전 미리보기
	$("[type=file]").on("change",function(){
		const attached = $(this);
		const reader = new FileReader();
		reader.onload = function(){
			attached.prev().empty();
			attached.prev().append($("<img>").attr("src", reader.result).attr("width", "90%").attr("onclick", "getRidOf(this)"));
		}
		reader.readAsDataURL(attached[0].files[0]);
	});



// 미리보기 이미지를 클릭하면, input의 value를 비움
	function getRidOf(obj){
		$(obj).parent().next().val("");
		$(obj).remove();
	}



// 바베큐 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseBarbecue]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=houseBarbecuePrice]").prop("disabled", false);
		}else{
			$("[name=houseBarbecuePrice]").prop("disabled", true);
		}
	});

// 파티 옵션 유무에 따라 가격입력란 활성/비활성화
	$("[name=houseParty]").on("change", function(){
		if($(this).prop("checked")){
			$("[name=housePartyPrice]").prop("disabled", false);
		}else{
			$("[name=housePartyPrice]").prop("disabled", true);
		}
	});


// summernote 불러오기
	$('#summernoteL').summernote({
		  width: 880,
		  height: 800,
		  minHeight: null,
		  maxHeight: null,
		  focus: false,
		  lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
					uploadLessonDescriptionImage(files[0], this);
				}
			},
		  placeholder: '한글 기준 최대 1000자',
		  toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			    ['height', ['height']],
			    ['view', ['help']]
			  ]
	});
	
	$('#summernoteH').summernote({
		  width: 880,
		  height: 800,
		  minHeight: null,
		  maxHeight: null,
		  focus: false,
		  lang: "ko-KR",
			callbacks: {
				onImageUpload: function(files){
					uploadHouseDescriptionImage(files[0], this);
				}
			},
		  placeholder: '한글 기준 최대 1000자',
		  toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['insert', ['link', 'picture']],
			    ['height', ['height']],
			    ['view', ['help']]
			  ]
	});
	
	
// summernote 편집기로 본문에 사진을 첨부시키는 함수
	function uploadLessonDescriptionImage(file, editor){
		
		const form = new FormData();
		form.append("file", file);
		$.ajax({
			url: "/attachLessonDescriptionImage.do",
			type: "post",
			data: form,
			dataType : "json",
			processData: false,	//파일 전송을 위해서 기본값인 String 형태 전송을 제거
			contentType: false,	//파일 전송을 위해서 enctype 속성의 기본값을 제거
			enctype : "multipart/form-data",
			success: function(data){
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
	
// summernote 편집기로 본문에 사진을 첨부시키는 함수
	function uploadHouseDescriptionImage(file, editor){
		
		const form = new FormData();
		form.append("file", file);
		$.ajax({
			url: "/attachHouseDescriptionImage.do",
			type: "post",
			data: form,
			dataType : "json",
			processData: false,	//파일 전송을 위해서 기본값인 String 형태 전송을 제거
			contentType: false,	//파일 전송을 위해서 enctype 속성의 기본값을 제거
			enctype : "multipart/form-data",
			success: function(data){
				$(editor).summernote("insertImage",data);
			}
		});
	}
	
	
	
//다음지도로 주소 찾기
		function searchAddr(){
		   new daum.Postcode({
		       oncomplete: function(data) {
		    	   $("#address").val(data.address);
		           loadMap();
		       }
		   }).open();
		};

//네이버지도 위경도 추출
		function loadMap(){
			const addr = $("#address").val();
			naver.maps.Service.geocode({
				address : addr
			},function(status, response){
				if(status === naver.maps.Service.Status.ERROR){ //type까지 일치하는지 보려고 자바스크립트는 1=="1"하면 true가 나오기 때문에 type까지 보려면 1==="1"로 해야한다
					return alert("조회 에러");
				}
				const lng = response.result.items[1].point.x;//경도
				const lat = response.result.items[1].point.y;//위도
				$("[name=houseLng]").attr("value",lng);
				$("[name=houseLat]").attr("value",lat);
			});
		}