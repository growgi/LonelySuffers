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
<body>
	<!-- Modal -->
    <div id="test-modal" class="modal-bg" style="z-index:1">
      <div class="modal-wrap">
        <div class="modal-head">
          <h2>판매자 전환</h2>
          <span class="material-icons close-icon modal-close">close</span>
        </div>
        <div class="modal-content">
            <div class="waveEffect" style="border:none;">
                <p class="waveEffectWord-back page-name">Lonely Surfers</p>
            </div>
          	<p>해당 회원을 판매자로 전환하시겠습니까?</p>
        </div>
        <div class="modal-foot">
          <button class="checkedChangeGradeSeller btn-m bc4 btn-pill">확인</button>
          <button class="btn-m bc5 modal-close btn-pill">취소</button>
        </div>
      </div>
    </div>
	<jsp:include page="/WEB-INF/views/admin/adminMenu.jsp" />
    <div class="memberList-wrapper admin-content">
    	<div>
    		<input type="hidden" value="${hiddenVal }" class="hidden-input">
            <form action="/searchSellerAppMember.do" method="get" id="frm" class="search-bar" name="searchMember">
                <input type="text" placeholder="아이디로 사용자 검색" name="searchMemberId" onkeyup="enterkey();">
                <span class="material-symbols-outlined search-icon">search</span>
            </form>
	        <div class="list-wrapper">
                <div class="memberList-top list-top">
                    <div class="count">신청한 사용자 <span>${sellerAppCount }</span>명</div>
                    <table>
                        <tr>
                            <th><input type="checkbox" name="memberCheck" class="all-check"></th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th style="width:80px;">성별</th>
                            <th>전화번호</th>
                            <th style="width:20%;">이메일</th>
                            <th>가입일</th>
                            <th>신청일</th>
                            <th>현재 등급</th>
                        </tr>
                        <c:choose>
						<c:when test="${empty sellerAppList }">
						<tr>
							<td colspan="9">
							    <div class="noInfo-wrapper">
							        <div>
							            <span class="material-symbols-outlined noInfo-icon">info</span>
							            <div class="noInfo-text">조회된 정보가 없습니다.</div>
							        </div>
							    </div>
						    </td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${sellerAppList }" var="s">
						<tr>
						    <td><input type="checkbox" name="memberCheck" class="check" value="${s.memberNo }"></td>
						    <td>${s.memberName }</td>
						    <td>${s.memberId }</td>
						    <td>
						    <c:choose>
                            <c:when test="${s.memberGender == 1}">
                            	남
                            </c:when>
                            <c:when test="${s.memberGender == 2}">
                            	여
                            </c:when>
                            </c:choose>
						    </td>
						    <td>${s.memberPhone }</td>
						    <td>${s.memberEmail }</td>
						    <td>${s.enrollDate }</td>
						    <td>${s.applicationDate }</td>
						    <td style="color:#19A7CE">
						    <c:choose>
						    <c:when test="${s.memberGrade == 2}">
						    	판매자
						    </c:when>
						    <c:otherwise>
								사용자
						    </c:otherwise>
						    </c:choose>
						    </td>
						</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
                    </table>
                    <div id="pageNavi">
                    	${pageNavi }
                    </div>
                </div>
                <div class="list-bottom">
                    <div>
                        <button class="modal-open-btn btn-m bc1" target="#test-modal">선택회원 판매자로 전환</button>
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
        $(".top-menu-title").text("판매자 신청 회원 조회");
        $(".product-choice>div").first().click();
        $(".menu-detail>li>a").eq(1).addClass("active-menu-click");
    });
  	
    /*모달*/
    $(function () {
      $(document).on("click", ".modal-open-btn", function () {
        //전달할 값
		const check = $(".check:checked");
		
		if(check.length == 0) {
		    alert("선택된 회원이 없습니다.");
		    return;
		}
		
        $($(this).attr("target")).css("display", "flex"); //모달 보이기
		
		//체크된 회원아이디 저장 배열
		const id = new Array();
		const no = new Array();
		
		//체크된 체크박스 기준으로 회원아이디를 배열에 넣는 작업
		check.each(function(index,item){
		    const memberId = $(item).parent().parent().children().eq(2).text();
		    console.log(memberId);
		    id.push(memberId);
            
            const checkMemberNo = $(item).val();
            no.push(checkMemberNo);
		});
        
        //console.log(productType);
        //console.log(productNo);
        
    	  $(".checkedChangeGradeSeller").on("click",function(){
    		  console.log(id);
    		  console.log(no);
    		  
    		  location.href="/checkedChangeGradeSeller.do?id="+id.join("/")+"&no="+no.join("/");
    	  });
      });
      
      $(document).on("click", ".modal-close", function () {
        $(this).parents(".modal-wrap").parent().css("display", "none");
      });  
      
      $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
    });
    

    /*검색 결과에 count 출력 삭제*/
    $(function(){
        if($('.hidden-input').val()==1) {
            $(".count").hide();
        } else {
            $(".count").show();
        }
    });
    
  	/*체크박스 선택회원
    $(".checkedChangeGradeSeller").on("click",function(){
        const check = $(".check:checked");

        if(check.length == 0) {
            alert("선택된 회원이 없습니다.");
            return;
        }

        //체크된 회원아이디 저장 배열
        const id = new Array();
        const no = new Array();

        //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
        check.each(function(index,item){
            const memberId = $(item).parent().parent().children().eq(2).text();
            id.push(memberId);
            
            const checkMemberNo = $(item).val();
            no.push(checkMemberNo);
        });

        location.href="/checkedChangeGradeSeller.do?id="+id.join("/")+"&no="+no.join("/");
    });*/
</script>
</html>