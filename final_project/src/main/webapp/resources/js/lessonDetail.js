
	// 후기 등록 submit 버튼 눌렀을 때
	function getCurrentUrl(){
		const ltrim = /^\S{0,}lessonView/;
		const currentUrl = window.location.href;
		const returnUrl = currentUrl.replace(ltrim, "");
		$("[name=previousUrl]").val("lessonView"+returnUrl);
		return true;
	}
	
	// 후기 수정하는 modal에서 submit 버튼 눌렀을 때
	function updateReviewBtn(){
		const ltrim = /^\S{0,}lessonView/;
		const currentUrl = window.location.href;
		const returnUrl = currentUrl.replace(ltrim, "");
		$("[name=previousUrl]").val("lessonView"+returnUrl);
		
		if($("#updateStar1").prop("checked")){
			$("#updateRating").val(1)
		}else if($("#updateStar2").prop("checked")){
			$("#updateRating").val(2)
		}else if($("#updateStar3").prop("checked")){
			$("#updateRating").val(3)
		}else if($("#updateStar4").prop("checked")){
			$("#updateRating").val(4)
		}else if($("#updateStar5").prop("checked")){
			$("#updateRating").val(5)
		}else {
			return false;
		}
		return true;
	}
	
	// review 더보기 버튼 실행
	
	const showMoreBtn = document.querySelector('.show-more');
	const container1 = document.querySelector('.container1');
	
	showMoreBtn.addEventListener('click', function() {
	  container1.classList.toggle('show-more-open');
	  if (container1.classList.contains('show-more-open')) {
	    showMoreBtn.style.display = 'none';
	  }
	});
	
	// review 글쓰기 버튼이벤트
	$(".review-wrap").hide();
		$(".reviewBtn").on("click",function(){
			$(".review-wrap").slideDown();
			$(this).hide();
		});
		
		$(".reviewEndBtn").on("click",function(){
			$(".review-wrap").slideUp();
			$(".reviewBtn").show();
		});

	// review 모달 수정	
	$(".reviewModalBtn").on("click",function(){
		var reviewNo = $(this).next().val();
		var reviewTitle = $(this).parent().parent().children().eq(0).text();
		var reviewWriter = $(this).parent().parent().children().eq(1).text();
		var reviewContent = $(this).parent().parent().children().eq(2).text();
		/* var rating = $(this).parent().parent().children().eq(3).children().text(); */
		var rating = $(this).parent().parent().children().eq(3).attr("value");
		var productCategory = $(this).next().next().val();
		var rfileList =$(this).parent().parent().children().eq(6).children().clone();
		$(".fileList-wrap").empty();
		rfileList.each(function(i, f){
			const fileNo = $(f).children().eq(2).val();
			const div = $("<div>").addClass("delfile-box");
			const button = $("<button>").attr("type", "button").attr("onclick", "deleteFile(this, "+fileNo+",)").append("삭제")
			div.append(f).append(button);
			$(".fileList-wrap").append(div);
		})
		$(".updateReviewNo").val(reviewNo);
		$(".modal-footer").children().attr("href", "");
		$(".reviewTitle").val(reviewTitle);
		$(".reviewWriter").val(reviewWriter);
		$(".reviewContent").val(reviewContent);
		$(".rating").val(rating);
		$(".productCategory").val(productCategory);
		$(".showProductCategory").val("숙박");
		if(rating == 1){
			$("#updateStar1").prop("checked", true);
		}else if(rating == 2){
			$("#updateStar2").prop("checked", true);
		}else if(rating == 3){
			$("#updateStar3").prop("checked", true);
		}else if(rating == 4){
			$("#updateStar4").prop("checked", true);
		}else if(rating == 5){
			$("#updateStar5").prop("checked", true);
		}
	});
	
	// review 파일 삭제
	function deleteFile(obj,fileNo){
	   const filepath = $(obj).parent().find("input").val()
	   const input = $("<input>").attr("name", "delFileList").attr("type", "hidden").val(filepath);
	   const input2 = $("<input>").attr("name", "fileNo").attr("type", "hidden").val(fileNo);
	   $(obj).parent().after(input);
	   $(obj).parent().after(input2);
	   $(obj).parent().remove();
	}
	
	//url로부터 lessonNo값 알아내기
		const ltrim = /^\S{0,}lessonNo=/;
		const currentUrl = window.location.href;
		const needRtrim = currentUrl.replace(ltrim, "");
		const rtrim = /[&]\S{0,}$/;
		const lessonNoFromUrl = needRtrim.replace(rtrim, "");
	//url로부터 lessonNo 도출 끝

		const lessonPeopleMax = $("[name=lessonMaxNo]").val();

	// 예약하기 modal 띄우면 실행되는 함수 시작
		$("#goBooking").on("click", function(){
			$("[name=lessonPeople]").on("change", function(){
				const lessonCapa = lessonPeopleMax - $("[name=lessonPeople]").val();
	console.log($("[name=lessonPeople]").val() +"명을 예약하려고 함");
	console.log("강습정원 - 지금 예약할 인원 수 = " + lessonCapa +"(필요한 남은 자리 수)");
			// 이미 결제완료 인원 된 날짜들을 invalidDateRanges 변수에 넣어주는 ajax
				if($("[name=lessonPeople]").val()>=1){
					$.ajax({
						url : "/bookOneLesson.do",
						data: {lessonNo : lessonNoFromUrl},
						dataType : "json",
						success : function(List){
							let invalidDateRanges = [];
							for(let i=0; i<List.length; i++){
	console.log(List[i].lessonBookDate +"에는 결제완료 상태의 인원이 이미 "+ List[i].lessonPeople +"명 있음");
								if(List[i].lessonPeople > lessonCapa){
	console.log("남은 자리가 "+ $("[name=lessonPeople]").val() +"이 안 되므로 "+ List[i].lessonBookDate +"는 막음");
								invalidDateRanges[i] = { 'start': moment(List[i].lessonBookDate), 'end': moment(List[i].lessonBookDate) };}
							}
	
						// 선택된 인원 수 바뀔 때마다 날짜 관련 데이터들 모두 초기화
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);
							$("#bookStart").prop("disabled", false);
	
						// 예약일을 선택하는 date range picker 생성
							$('#bookStart').daterangepicker({
							    parentEl: "#bookingArea .modal-body",
								locale: {
								format: "YYYY-MM-DD",
								fromLabel: "시작",
								toLabel: "종료"
					    		},
						    	alwaysShowCalendars: true,
								autoApply: true,
								singleDatePicker: true,
								showDropdowns: true,
								minDate: moment().add(1, 'days'),	// 오늘까지는 예약 불가. 내일부터 예약 가능
								maxDate: moment().add(3, 'months'),	// 시작일은 3개월 이내에서 지정 가능
								isInvalidDate: function(date) {
									return invalidDateRanges.reduce(function(bool, range) {
										return bool || (date >= range.start && date <= range.end);
									}, false);
								}
							});
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);	// value 없는 상태로 생성 필요
						},
						error : function(){
							console.log("인원 수를 먼저 선택해주세요에 focus됨");
							$(".daterangepicker").remove();
							$("#bookStart").val("");
							$("#bookStart").attr("value", null);
							$("#bookStart").prop("disabled", true);
						}
					});
				}else{
					$("#bookStart").val("");
					$("#bookStart").attr("value", null);
					$("#bookStart").prop("disabled", true);
				}
			});
		});
	// 예약하기 modal 띄우면 실행되는 함수 끝


	// input에 값이 없으면 form 제출을 막는 함수
		function checkOrder(){
			if ( $("[name=lessonBookDate]").val() == "" ) {
				alert('강습일을 선택해주십시오.');
				return false;
			}
			fullPrice();
			return true;
		}


	// lessonBookPrice를 계산하는 함수
		const onePersonPrice = $("[name=lessonPrice]").val();
		function fullPrice(){
			return Number(onePersonPrice) * Number($("[name=lessonPeople]").val());
		}


	// 관심상품 버튼을 눌렀을 때
		function goWishList(){
			const lessonNo = $("[name=lessonNo]").val();
			const lessonStatus = $("[name=lessonStatus]").val();
			if($("#showWishStatus").prop("checked")){
				$.ajax({
					url : "/delistWishList.do",
					data: {house_no : 0, lesson_no : lessonNo},
					dataType : "text",
					success : function(message){
						if(message=="관심상품에서 제외했습니다."){
							$("#showWishStatus").prop("checked", false);
						}else{
							$("#showWishStatus").prop("checked", true);
							alert(message);
						}
					},
					error : function(){
						alert("알 수 없는 오류가 발생했습니다.");
					}
				});
			}else{
				if(lessonStatus==1){
					$.ajax({
						url : "/insertWishList.do",
						data: {house_no : 0, lesson_no : lessonNo},
						dataType : "text",
						success : function(message){
							if(message=="관심상품에 등록했습니다."){
								$("#showWishStatus").prop("checked", true);
							}else if(message=="이미 회원님의 관심목록에 추가되어 있는 상품입니다."){
								$("#showWishStatus").prop("checked", true);
								alert(message);
							}else{
								$("#showWishStatus").prop("checked", false);
								alert(message);
							}
						},
						error : function(){
							alert("알 수 없는 오류가 발생했습니다.");
						}
					});
				}else{
					alert("판매중인 상품이 아닙니다.");
				}
			}
		}


	// 나의 관심상품에 있는 상품인지 확인 후 관심상품 추가하기에 불 들어오게
		function refrechWishList(){
			const lessonNo = $("[name=lessonNo]").val();
			const lessonStatus = $("[name=lessonStatus]").val();
				$.ajax({
					url : "/checkWishStatus.do",
					data: {house_no : 0, lesson_no : lessonNo},
					dataType : "text",
					success : function(message){
						if(message=="이미 회원님의 관심목록에 추가되어 있는 상품입니다."){
							$("#showWishStatus").prop("checked", true);
						}
					}
				});
		}


	// 문의글 목록을 <tr>단위로 불러오는 ajax
		function getInquiries(reqPage, range){
			$.ajax({
					url : "/getInquiries.do",
					data: {reqPage : reqPage, productCategory : 1, productNo : $("[name=lessonNo]").val(), range : range},
					dataType : "json",
					success : function(InquiryPagination){
						$("#forInquiries").empty();
						$("#forPageNavi").empty();
						$("#numberOfCount").text(InquiryPagination.totalCount);
						if(InquiryPagination.totalCount == 0){
							$("#forInquiries").append( $("<tr>").addClass("hasNoInquiry").append($("<td>").attr("colspan", "6").css("text-align", "center").text("조회된 문의 내역이 없습니다.") ) );
						}else{
							for(let i=0; i<InquiryPagination.list.length; i++){
								const td1 = $("<td>").text((InquiryPagination.start)+i);
								
								const td2 = $("<td>").css("display", "none").text(InquiryPagination.list[i].inquiryNo);
								
								const td3 = $("<td>");
								if( InquiryPagination.list[i].answered > 0 ){
									td3.text("답변완료");
								}else{ td3.text("미답변"); }
								
								const td4 = $("<td>");
								if( InquiryPagination.list[i].privately > 0 ){
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text((InquiryPagination.list[i].inquiryTitle) + " 🔒 "));
								}else{
									td4.append($("<a>").addClass("inquiryTitleText").attr("onclick","expandIt(this)").text(InquiryPagination.list[i].inquiryTitle));
								}
								
								const idLength = InquiryPagination.list[i].inquirer.length;
								const td5 = $("<td>").text(InquiryPagination.list[i].inquirer);
								
								const td6 = $("<td>").text(InquiryPagination.list[i].regDate.substring(0,10));
		
								const tr = $("<tr>").addClass("inquiryTr").append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
								$("#forInquiries").append(tr);
			    			}
						$("#forPageNavi").append(InquiryPagination.pageNavi);
					}
				}
			});
		}

	// 이 .jsp 페이지를 방문할 때 문의글 첫 페이지 조회로 시작
		$(document).ready(function() {
			getInquiries(1, 0);
			refrechWishList();
		});


	// 문의글의 제목을 누르면 아래에 tr로 문의글 내용이 삽입되면서 펼쳐지는 효과로 출력
		function expandIt(obj){
			const targetInquiryNo = $(obj).parent().prev().prev().text();
			if( $(obj).parent().parent().next().children().eq(3).attr("colspan") == 3 ){
				 $(obj).parent().parent().nextUntil(".inquiryTr").remove();
			}else{
				$.ajax({
					url : "/inquiryView.do",
					data: {inquiryNo : targetInquiryNo, productCategory : 1, productNo : $("[name=lessonNo]").val()},
					dataType : "json",
					async : false,
					success : function(Inquiry){
						if(Inquiry.inquiryNo <= 0){
							alert(Inquiry.inquiryContent);
						}else{
							$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-ansI displayForSeller").append( $("<td>") ).append( $("<td>").addClass("inquiryTd").text("답변하기") ).append( $("<td>").addClass("inquiryExpanded").attr("colspan", "4").html("<textarea class='form-control'></textarea>").append( $("<button>").attr("onclick", "insertAnswer(this)").text("답변 등록") ) ) );
							if(Inquiry.answerList.length>0){
								for(let j=0; j<Inquiry.answerList.length; j++){
									$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-ans").append( $("<td>").html("<button type='button' class='displayForSeller' onclick='editAnswerContent(this)'>수정</button><br><button type='button' class='displayForSeller' onclick='deleteAnswerConfirm(this)'>삭제</button>") ).append( $("<td>").css("display", "none").text(Inquiry.answerList[j].answerNo) ).append( $("<td>").addClass("inquiryTd").html("답변: ") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "3").html("<span>"+Inquiry.answerList[j].answerContent.replaceAll("\n","<br>")+"</span>") ) );
								}
							}
							$(obj).parent().parent().after( $("<tr>").addClass("expandedTr-inq").append( $("<td>").html("<button type='button' class='displayForGeneralMember' onclick='editInquiryContent(this)'>수정</button><br><button type='button' class='displayForGeneralMember' onclick='deleteInquiryConfirm(this)'>삭제</button>") ).append( $("<td>").css("display", "none") ).append( $("<td>").addClass("inquiryTd").text("문의 내용") ).append($("<td>").addClass("inquiryExpanded").attr("colspan", "3").html("<span>"+Inquiry.inquiryContent.replaceAll("\n","<br>")+"</span>") ) );
						}
					}
				});
			}
		}


	// 문의글 등록 폼 제출
		function insertInquiryAjax(obj){
			const trimedTitle = $("[name=inquiryTitle]").val().trim().replace(/\s+/g," ");
			$("[name=inquiryTitle]").val(trimedTitle);
			
			let privately = 0;
			if($(obj).find("[name=privately]").prop("checked")){
				privately = 1;
			}
			$.ajax({
				url : "/insertInquiry.do",
				data: {privately : privately , inquiryTitle : $(obj).find("[name=inquiryTitle]").val() , inquiryContent : $(obj).find("[name=inquiryContent]").val(), productCategory : 1, productNo : $("[name=lessonNo]").val()},
				dataType : "text",
				success : function(result){
					alert(result);
					$("#writeFormReset").click();
					$("#writeModalClose").click();
					getInquiries(1, 0);
				}
			});
		}


	// 문의글 수정 버튼을 눌렀을 때
		function editInquiryContent(obj){
			const getContent = $(obj).parent().next().next().next().children().eq(0).html().replaceAll("<br>","\n");
			$(obj).parent().next().next().next().children().css("display", "none");
			$(obj).parent().next().next().next().append( $("<textarea>").addClass("form-control").attr("rows", 4).css("width", "100%").val(getContent) );
			$(obj).parent().next().next().next().append( $("<button>").attr("onclick", "updateInquiry(this)").text("내용 수정") );
			$(obj).attr("onclick", "cancleEditInquiry(this)");
			$(obj).text("취소");
		}


	// 문의글 내용수정 버튼을 누르면 동작하는 ajax
		function updateInquiry(obj){
			$.ajax({
				url : "/updateInquiry.do",
				data: {inquiryNo : $(obj).parent().parent().prev().children().eq(1).text(), inquiryContent : $(obj).prev().val()},
				dataType : "text",
				success : function(result){
					alert(result);
					const target = $(obj).parent().parent().prev().children().eq(3).children().eq(0);
					target.click();
					target.click();
				}
			});
		}


	// 문의글 수정 취소 버튼을 눌렀을 때
		function cancleEditInquiry(obj){
			$(obj).parent().next().next().next().children().eq(2).remove();
			$(obj).parent().next().next().next().children().eq(1).remove();
			$(obj).parent().next().next().next().children().eq(0).css("display", "inline");
			$(obj).attr("onclick", "editInquiryContent(this)");
			$(obj).text("수정");
		}


	// 문의글 삭제 버튼을 눌렀을 때
		function deleteInquiryConfirm(obj){		
			const inquiryNo = $(obj).parent().parent().prev().children().eq(1).text();
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				deleteInquiry(inquiryNo);
			}
		}


	// 문의글 삭제 버튼을 누르면 동작하는 ajax
		function deleteInquiry(inquiryNo){
			$.ajax({
				url : "/deleteInquiry.do",
				data: {inquiryNo : inquiryNo},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "문의글을 삭제했습니다."){
						getInquiries(1, 0);
					}
				}
			});
		}


	// 답변 등록 버튼을 누르면 동작하는 ajax
		function insertAnswer(obj){
			$.ajax({
				url : "/insertAnswer.do",
				data: {inquiryNo : $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(1).text(), answerContent : $(obj).prev().val(), productCategory : 1, productNo : $("[name=lessonNo]").val()},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "답변을 등록했습니다."){
						const target = $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(3).children().eq(0);
						target.click();
						target.click();
					}
				}
			});
		}


	// 답변 수정 버튼을 눌렀을 때
		function editAnswerContent(obj){
			const getContent = $(obj).parent().next().next().next().children().eq(0).html().replaceAll("<br>","\n");
			$(obj).parent().next().next().next().children().css("display", "none");
			$(obj).parent().next().next().next().append( $("<textarea>").addClass("form-control").attr("rows", 4).css("width", "100%").val(getContent) );
			$(obj).parent().next().next().next().append( $("<button>").attr("onclick", "updateAnswer(this)").text("내용 수정") );
			$(obj).attr("onclick", "cancleEditAnswer(this)");
			$(obj).text("취소");
		}


	// 답변 내용수정 버튼을 누르면 동작하는 ajax
		function updateAnswer(obj){
			$.ajax({
				url : "/updateAnswer.do",
				data: {answerNo : $(obj).parent().prev().prev().text(), answerContent : $(obj).prev().val()},
				dataType : "text",
				success : function(result){
					alert(result);
					const target = $(obj).parent().parent().prevUntil(".inquiryTr", "tr:last").prev().children().eq(3).children().eq(0);
					target.click();
					target.click();
				}
			});
		}


	// 답변 수정 취소 버튼을 눌렀을 때
		function cancleEditAnswer(obj){
			$(obj).parent().next().next().next().children().eq(2).remove();
			$(obj).parent().next().next().next().children().eq(1).remove();
			$(obj).parent().next().next().next().children().eq(0).css("display", "inline");
			$(obj).attr("onclick", "editAnswerContent(this)");
			$(obj).text("수정");
		}


	// 답변 삭제 버튼을 눌렀을 때
		function deleteAnswerConfirm(obj){		
			const answerNo = $(obj).parent().next().text();
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				deleteAnswer(answerNo);
			}
		}


	// 답변 삭제 버튼을 누르면 동작하는 ajax
		function deleteAnswer(answerNo){
			$.ajax({
				url : "/deleteAnswer.do",
				data: {answerNo : answerNo},
				dataType : "text",
				success : function(result){
					alert(result);
					if(result == "답변을 삭제했습니다."){
						getInquiries(1, 0);
					}
				}
			});
		}


	// 로그인된 회원의 등급에 따라 특정 요소들을 display:none 처리
		$(document).ready(function(){
			const stylesheet = document.styleSheets[0];		// 링크된 .css 파일들 중 첫 번째 파일
			let elementRules;
		
			// 관리자(Grade 1) 또는 판매자(Grade 2)가 아닌 경우에만 변경할 css
			for(let i = 0; i < stylesheet.cssRules.length; i++) {
				if(stylesheet.cssRules[i].selectorText === '.displayForSeller') {
				elementRules = stylesheet.cssRules[i];
				}
			}
			if( $(".hiddenMemberGrade").val()==1 || $(".hiddenMemberGrade").val()==2 ){
			}else{
				elementRules.style.setProperty('display', 'none');
			}
			
			// 관리자(Grade 1) 또는 일반회원(Grade 3)가 아닌 경우에만 변경할 css
			for(let i = 0; i < stylesheet.cssRules.length; i++) {
				if(stylesheet.cssRules[i].selectorText === '.displayForGeneralMember') {
					elementRules = stylesheet.cssRules[i];
				}
			}
			if( $(".hiddenMemberGrade").val()==1 || $(".hiddenMemberGrade").val()==3 ){
			}else{
				elementRules.style.setProperty('display', 'none');
			}
		});



	// 평점 select
		$(document).ready(function() {
			const score = $("[name=lessonScore]").val();
			if(score <0.5){
			}else if(score >= 0.5 && score < 1){
				$("#rating2-0").prop("checked", false);
				$("#rating2-05").prop("checked", true);
			}else if(score >= 1 && score < 1.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-10").prop("checked", true);
			}else if(score >= 1.5 && score < 2){
				$("#rating2-0").prop("checked", false);
				$("#rating2-15").prop("checked", true);
			}else if(score >= 2 && score < 2.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-20").prop("checked", true);
			}else if(score >= 2.5 && score < 3){
				$("#rating2-0").prop("checked", false);
				$("#rating2-25").prop("checked", true);
			}else if(score >= 3 && score < 3.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-30").prop("checked", true);
			}else if(score >= 3.5 && score < 4){
				$("#rating2-0").prop("checked", false);
				$("#rating2-35").prop("checked", true);
			}else if(score >= 4 && score < 4.5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-40").prop("checked", true);
			}else if(score >= 4.5 && score < 5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-45").prop("checked", true);
			}else if(score >= 5){
				$("#rating2-0").prop("checked", false);
				$("#rating2-50").prop("checked", true);
			}
		});