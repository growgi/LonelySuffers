<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<h1 style="text-align: center;">공지사항 작성</h1>
	<hr>
	<form action="/noticeWrite.do" method="post" enctype="multpart/form-data" class="notice-form">
		<div>
			<th>제목</th>
			<td><input type="text" name="noticeTitle"></td>
		</div>
		<div>
			<th>첨부파일</th>
            <td><input type="file" name="noticeFile" multiple></td>
		</div>
		<div>
            <th>내용</th>
            <td><textarea name="noticeContent"></textarea></td>
		</div>
        <tr>
            <th colspan="2"><input type="submit" value="등록하기"></th>
        </tr>
	</form>
	
</body>
</html>