<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록 보기</title>
<style>
	div#wrap {
		width: 600px;
		padding: 20px;
		border: 3px solid #aaa;
		border-radius: 6px;
		margin: 10px auto;
	}
	
	hr {
		margin: 10px;
	}
	
	table {
		width: 580px;
		border: 1px solid #aaa;
		margin: 10px;
	}
	
	table#memberTbl td {
		padding: 2px 10px;
		border: 1px solid #aaa;
	}
	
	table#memberTbl td:first-child {
		width: 30px;
		font-size: 17px;
		text-align: right:
	}
	
	a {
		font-size: 18px;
		padding: 4px 10px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="wrap">
		<h1>상세 내용 보기 화면</h1>
		<hr>
		<table id="memberTbl">
			<thead>
				<tr>
					<th>번호</th>
					<th>ID</th>
					<th>이름</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${data}"> <!-- core태그 -->
					<tr>
						<td>${row.no}</td>
						<td><a href="/detail?no=${row.no}"> ${row.uId} </a></td>
						<td>${row.uName}</td>
						<td>${row.uEmail}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a href="/create">회원가입</a>
		</div>
	</div>
	<!-- div#wrap -->
</body>
</html>