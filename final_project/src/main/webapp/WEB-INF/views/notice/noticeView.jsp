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
	<h1 style="text-align: center;">공지사항</h1>
	<hr>
	<table>
		<tr>
			<td>${n.noticeTitle }</td>
			<td>${n.noticeDate }</td>
		</tr>
		<tr>
			<td>${n.noticeContent }</td>
		</tr>
		<tr>
			<th colspan="6">
				<a href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }">수정하기</a>
				<!--<a href="/deleteNotice.do?noticeNo=${n.noticeNo }">삭제</a>-->
			</th>
		</tr>
	</table>		
</body>
</html>