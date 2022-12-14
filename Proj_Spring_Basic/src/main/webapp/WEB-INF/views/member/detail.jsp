<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 내용 보기</title>
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
	
	table#memberTbl td {
		padding: 10px;
	}
	
	table#memberTbl td:first-child {
		width: 120px;
		font-size: 17px;
		text-align: right:
	}
	
	table#memberTbl td:last-child {
		width: 400px;
	}
	
	a {
		font-size: 18px;
		padding: 4px 10px;
		cursor: pointer;
	}
</style>
<script src="/resources/script/script.js"></script>
</head>
<body>
	<div id="wrap">
		<h1>상세 내용 보기 화면</h1>
		<hr>
		<!-- GNB 메뉴 시작 -->
		<nav>
			<ul>
				<li><a href="/">메인페이지</a></li>
				<li><a href="/list">목록</a></li>
				<li><a href="/create">회원가입</a></li>
			</ul>
		</nav>
		<!-- GNB 메뉴 끝 -->
		<table id="memberTbl">
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${data.uId}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${data.uPw}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${data.uName}</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>${data.uEmail}</td>
				</tr>
			</tbody>
		</table>
		<a href="/list">목록으로</a>
	</div>
	<!-- div#wrap -->
</body>
</html>