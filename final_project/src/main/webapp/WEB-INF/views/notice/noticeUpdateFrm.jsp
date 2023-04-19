<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Meta -->
<title>Lonely Suffers</title>
<meta name="keywords" content="서핑,파도타기">
<meta name="description" content="파도타기를 좋아하는 사람들을 위한 웹사이트">
<meta name="author" content="KH정보교육원">
<link rel="stylesheet" href="/resources/css/notice.css">
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="section">
			<div class="container">
				<div class="row">
					<h1>공지사항 수정</h1>
					<hr>
					<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data" id="updateFrm">
					<table border="1">
						<tr>
							<th>번호</th>
							<td><input type="text" name="noticeNo" value="${n.noticeNo }" readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" name="noticeTitle" value="${n.noticeTitle }" required></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td><input type="text" name="noticeDate" value="${n.noticeDate }" readonly></td>
						</tr>
						<tr>
			            <th>첨부파일</th>
			               <td>
			                  <c:forEach items="${n.fileList }" var="f">
			                     <p>
			                        ${f.filename }
			                        <button type="button" onclick="deleteFile(this,${f.fileNo},'${f.filepath }');">삭제</button>                                                          
			                     </p>
			                  </c:forEach>
			               </td> 
			        	</tr>
						<tr>	
							<th>첨부파일 추가</th>
							<td><input type="file" name="noticeFile" multiple onchange="loadImgs(this);"></td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="img-viewer2"></div>
							</td>
						</tr>
						<tr>	
							<th>내용</th>
							<td><textarea name="noticeContent" required>${n.noticeContent }</textarea></td>
						</tr>
					</table>
					<table>
						<tr>
							<th colspan="2"><input type="submit" value="수정하기"></th>
							<th colspan="2"><input type="submit" value="취소"></th>
						</tr>
					</table>		
					</form>	
				</div>
			</div>
		</section>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- 기본 .js 파일들 -->
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/parallax.js"></script>
	<script src="resources/js/animate.js"></script>
	<script src="resources/js/custom.js"></script>
	<!-- 추가 .js파일들이 필요하면 아래에 넣으세요 -->
<script>
      function deleteFile(obj,fileNo,filepath){
         //<input>
         const fileNoInput = $("<input>");
         //<input name="fileNo">
         fileNoInput.attr("name","fileNo");
         //<input name="fileNo" value="fileNo">
         fileNoInput.val(fileNo);
         //<input name="fileNo" value="10" style="display:none;">
         fileNoInput.hide();
         
         const filepathInput = $("<input>");
         filepathInput.attr("name","filepath");
         filepathInput.val(filepath);
         filepathInput.hide();
         
         $("#updateFrm").append(fileNoInput).append(filepathInput);
         $(obj).parent().remove();
      }
   </script>
</body>
</html>