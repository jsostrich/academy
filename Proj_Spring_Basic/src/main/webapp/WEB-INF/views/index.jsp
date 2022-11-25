<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h1>인덱스 페이지</h1>
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
	</div>
	<!-- div#wrap -->
</body>
</html>