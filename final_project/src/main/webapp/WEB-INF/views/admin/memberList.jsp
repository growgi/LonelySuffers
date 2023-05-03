<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lonely Surfers Admin</title>
</head>
<link rel="stylesheet" href="resources/css/adminTable.css"></link>
<style>
    .list-bottom>div{
        display: flex;
    }
    .btn-m:first-child{
    	margin-right: 5px;
    }
</style>
<body>
    <!-- Modal -->
    <div id="changeGradeMember-modal" class="modal-bg" style="z-index:1; display:none;">
        <div class="modal-wrap">
            <div class="modal-head">
            <h2>선택 회원 등급 변경</h2>
            <span class="material-icons close-icon modal-close">close</span>
            </div>
            <div class="modal-content">
                <div class="waveEffect" style="border:none;">
                    <p class="waveEffectWord-back page-name">Lonely Surfers</p>
                </div>
                    <p>선택한 회원(들)의 등급을 변경하시겠습니까?</p>
            </div>
            <div class="modal-foot">
            <button class="checkedChangeGrade btn-m bc4 btn-pill">확인</button>
            <button class="btn-m bc5 modal-close btn-pill">취소</button>
            </div>
        </div>
    </div>
	<!-- Modal -->
    <div id="deleteMember-modal" class="modal-bg" style="z-index:1; display:none;">
      <div class="modal-wrap">
        <div class="modal-head">
          <h2>회원 탈퇴</h2>
          <span class="material-icons close-icon modal-close">close</span>
        </div>
        <div class="modal-content">
	        <div class="waveEffect" style="border:none;">
	            <p class="waveEffectWord-back page-name">Lonely Surfers</p>
	        </div>
	   		<p>선택한 회원을 정말로 탈퇴시키겠습니까?</p>
        </div>
        <div class="modal-foot">
          <button class="deleteMember btn-m bc4 btn-pill">확인</button>
          <button class="btn-m bc5 modal-close btn-pill">취소</button>
        </div>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
        <div>
        	<input type="hidden" value="${hiddenVal }" class="hidden-input">
            <form action="/adminSearchMember.do" method="get" class="search-bar" name="searchMember">
                <input type="text" placeholder="아이디로 사용자 검색" name="searchMemberId" onkeyup="enterkey();">
                <div class="material-symbols-outlined search-icon"><input type="submit" value="검색" class="search-icon" style="display:none;">search</div>
            </form>
            <div class="list-wrapper">
                <div class="memberList-top list-top">
                    <div class="count">전체 사용자 <span>${memberCount }</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck" class="all-check"></th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th style="width:80px;">성별</th>
                            <th>전화번호</th>
                            <th style="width:20%;">이메일</th>
                            <th>가입일</th>
                            <th>회원 등급</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${memberList }" var="m">
                        <c:if test="${m.memberGrade != 4 }"> <!-- 탈퇴회원(4) 조회 X -->
                        <tr>
                            <td><input type="checkbox" name="memberCheck" class="check"></td>
                            <td>${m.memberName }</td>
                            <td>${m.memberId }</td>
                            <td>
                            <c:choose>
                            <c:when test="${m.memberGender == 1}">
                            	남
                            </c:when>
                            <c:when test="${m.memberGender == 2}">
                            	여
                            </c:when>
                            </c:choose>
                            </td>
                            <td>${m.memberPhone }</td>
                            <td>${m.memberEmail }</td>
                            <td>${m.enrollDate }</td>
                            <td>
                            <div class="memberGradeVal" style="display:none;">${m.memberGrade}</div>
                            <c:choose>
                            <c:when test="${m.memberGrade == 1}">
                                <select class="grade-change">
                                    <option value="1" selected>관리자</option>
                                    <option value="2">판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:when test="${m.memberGrade == 2}">
                                <select class="grade-change">
                                    <option value="1">관리자</option>
                                    <option value="2" selected>판매자</option>
                                    <option value="3">사용자</option>
                                </select>
                            </c:when>
                            <c:otherwise>
                                <select class="grade-change">
                                    <option value="1">관리자</option>
                                    <option value="2">판매자</option>
                                    <option value="3" selected>사용자</option>
                                </select>
                            </c:otherwise>
                            </c:choose>
                            </td>
                            <td>
                                <button class="changeGrade-btn btn-s bc1">등급 변경</button>
                                <button class="changeGrade" style="display:none;"></button>
                            </td>
                        </tr>
                        </c:if>
                        </c:forEach>
                    </table>
                    <div id="pageNavi">
                        ${pageNavi }
                    </div>
                </div>
                <div class="list-bottom">
                    <div>
                        <button class="checkedChangeGrade-modal-open-btn btn-m bc1" target="#changeGradeMember-modal">선택회원 등급변경</button>
                        <button class="deleteMember-modal-open-btn btn-m bc2" target="#deleteMember-modal">회원탈퇴</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/js/admin.js"></script>
</body>
<script>
    /*메뉴 제목*/
    $(function(){
        $(".top-menu-title").text("회원 목록");
        $(".menu-detail>li>a").eq(0).addClass("active-menu-click");
    });


    $(".search-bar>input").on("click",function(){
        $(this).toggleClass("active-search-bar");
    });
    
    $(function(){
        $(".menu-detail>li>a").eq(0).addClass("active-menu-click");
    });
    
    $(".changeGrade-btn").on("click",function(){
        const result = confirm("해당 회원의 등급을 변경하시겠습니까?");
    
        if(result == true) {
            $(this).next().click();
            alert("성공적으로 등급이 변경되었습니다.");
        } else {
            alert("등급 변경이 취소되었습니다.");
        }
    });
    
    /*등급 변경*/
    //1명
    $(".changeGrade").on("click",function(){
        //클릭한 버튼 기준으로 해당 회원 아이디
        const memberId = $(this).parent().parent().children().eq(2).text();

        //클릭한 버튼 기준으로 선택한 등급
        const memberGrade = $(this).parent().parent().find("select").val();

        location.href="/changeGrade.do?memberId="+memberId+"&memberGrade="+memberGrade;
    });

        /*모달*/
     $(function () {
      $(document).on("click", ".checkedChangeGrade-modal-open-btn", function () {
        //전달할 값
		const check = $(".check:checked");
		
		if(check.length == 0) {
		    alert("선택된 회원이 없습니다.");
		    return;
		}
		
		
        $($(this).attr("target")).css("display", "flex"); //모달 보이기
		
		//체크된 회원아이디 저장 배열
        const id = new Array();

        //체크된 회원등급 저장 배열
        const grade = new Array();

        //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
        check.each(function(index,item){
            const memberId = $(item).parent().parent().children().eq(2).text();
            id.push(memberId);
            const memberGrade = $(item).parent().parent().find("select").val();
            grade.push(memberGrade);
        });

        
        $(".checkedChangeGrade").on("click",function(){
            //console.log(id);
            location.href="/checkedChangeGrade.do?id="+id.join("/")+"&grade="+grade.join("/");
    	  });
      });
      
      $(document).on("click", ".modal-close", function () {
        $(this).parents(".modal-wrap").parent().css("display", "none");
      });  
      
    });

    //체크박스 선택회원
    /*$(".checkedChangeGrade").on("click",function(){
        const check = $(".check:checked");

        if(check.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        //체크된 회원아이디 저장 배열
        const id = new Array();

        //체크된 회원등급 저장 배열
        const grade = new Array();

        //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
        check.each(function(index,item){
            const memberId = $(item).parent().parent().children().eq(2).text();
            id.push(memberId);
            const memberGrade = $(item).parent().parent().find("select").val();
            grade.push(memberGrade);
        });

        location.href="/checkedChangeGrade.do?id="+id.join("/")+"&grade="+grade.join("/");
    });*/

    
    /*모달*/
    $(function () {
    	const deleteMemberFunc = $(document).on("click", ".deleteMember-modal-open-btn", function (e) {
		 //전달할 값
		const check = $(".check:checked");
		
		if(check.length == 0) {
		    alert("선택된 회원이 없습니다.");
		    return;
		}
		
		//체크된 회원아이디 저장 배열
		const id = new Array();
		let adminCheck = true;		
		//체크된 체크박스 기준으로 회원아이디를 배열에 넣는 작업
		check.each(function(index,item){
		    const memberGrade = $(item).parent().parent().find(".memberGradeVal").text();
		    console.log(memberGrade);
		    
		    if(memberGrade == 1) {
		    	alert("관리자는 탈퇴시킬 수 없습니다.");
		    	adminCheck=false;
		    	
		    } else {
			    const memberId = $(item).parent().parent().children().eq(2).text();
			    //console.log(memberId);
			    id.push(memberId);
		    	
		    }
		    
		});
		if(adminCheck){
			
		$($(this).attr("target")).css("display", "flex"); //모달 보이기
		}
		
		
		
		      
		//console.log(productType);
		//console.log(productNo);
  	        
		$(".deleteMember").on("click",function(){
			//console.log(id);
			location.href="/deleteMember.do?id="+id.join("/");
		});
		
      });
      
      $(document).on("click", ".modal-close", function () {
        $(this).parents(".modal-wrap").parent().css("display", "none");
      });  
      
    });
    
    /*체크박스 체크 회원 탈퇴
    $(".deleteMember").on("click",function(){
        const check = $(".check:checked");

        if(check.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        //체크된 회원아이디 저장 배열
        const id = new Array();

        //체크된 체크박스 기준으로 회원아이디를 배열에 넣는 작업
        check.each(function(index,item){
            const memberId = $(item).parent().parent().children().eq(2).text();
            console.log(memberId);
            id.push(memberId);
        });

        location.href="/deleteMember.do?id="+id.join("/");
        
    });*/

    /*검색 결과에 count 출력 삭제*/
    $(function(){
        if($('.hidden-input').val()==1) {
            $(".count").hide();
        } else {
            $(".count").show();
        }
    });
</script>
</html>