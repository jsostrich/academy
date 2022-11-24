<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 폼 화면</title>
<style type="text/css">
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

table#memberTbl td input {
	font-size: 17px;
	padding: 4px 10px;
}

button {
	font-size: 18px;
	padding: 4px 10px;
	cursor: pointer;
}
a {
			font-size: 18px;
			padding: 4px 10px;
			cursor: pointer;
		}
</style>
<!-- <script type="text/javascript">
// Vanilla JS Framework(최초의 자바스크립트), JQuery(라이브러리), Prototype.js
// Vue.js, React.js, Angular.js + ECMA 6 이후
// Java, Android, Midlet, Servlet, ....
// POJO(Plane Old Java Object) 
// Sun Micro System, Java 산 커피
	let btnList = function(){
		location.href="/list";
	};
</script> -->
</head>
<body>
	<div id="wrap">
		<h1>입력 양식 화면</h1>
		<!-- GNB 메뉴 시작 -->
		<nav>
			<ul>
				<li><a href="/">메인페이지</a></li>
				<li><a href="/list">목록</a></li>
				<li><a href="/create">회원가입</a></li>
			</ul>
		</nav>
		<!-- GNB 메뉴 끝 -->
		<hr>
		<form method="post">
			<table id="memberTbl">
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="uId"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="uPw"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="uName"></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="uEmail"></td>
					</tr>
				</tbody>
			</table>
			<button type="submit">전송</button>
			<script>
				let btnList = function(){
					location.href="/list";
				};
			</script>
			<button type="button" id="listBtn" onclick="btnList()">목록</button>
		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>