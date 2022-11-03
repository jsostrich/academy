<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>travelForm.jsp</title>
</head>
<body>
<h3>식성?을 고르면 식사메뉴를  추천해드립니다</h3>
<form name="frm1" method="post" 
	action="<%=request.getContextPath() %>/tips/food.do">
	<select name="foodmenu">
		<option value="한식">한식</option>
		<option value="일식">일식</option>
		<option value="양식">양식</option>
	</select>
	<br><br>
	<input type="submit" value="확인">
</form>

</body>
</html>