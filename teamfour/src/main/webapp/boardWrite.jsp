<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의 글 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<style type="text/css">
	fieldset{
		border: none;
	}
	
	h3{
		margin-top: 10px;
	}
	
	p#guide{
		text-align: center;
		font-size: 16px;
	}
	
	div:not(.divForm){
		height: 60px;
	}
	
	div.firstDiv{
		border-top: 1px solid #dee2e6;
	}
	
	div.border-bottom{
		border-bottom: 1px solid #dee2e6;
	}
	
	div#divTextarea{
		width: 90%;
		height: 50%;
		overflow: hidden;
	}
	
	div#divAttention{
		float: right;
		margin-right: 20%;
		width: 60%;
	}
	
	label{
		background-color: #f8f9fa;
		text-align: center;
		width: 15%;
		padding-top: 17px;
		padding-bottom: 17px;
	}
	
	label[for=content]{
		width: 16.66%;
		padding: 270px 0 270px 0;
		display: inline-block;
	}
	
	input[type=text], input[type=password]{
		margin: 10px 10px 10px 36px;
		width: 50%;
	}
	
	textarea{
		margin: 10px;
		width: 100%;
		display: inline;
		vertical-align: top;	/* 수평조절 */
	}
	
	p#attention{
		font-weight: 700;
		font-style: italic;
	}
	
	div.center{
		text-align: center;
	}
	
	ul{
		margin: 0px;
	}
	
	input[type=submit], input[type=button]{
		margin: 10px 5px 10px 0px;
	}

</style>
</head>
<body>
<div class="container">
<form name="frmWrite" method="post" 
	enctype="multipart/form-data" action="boardWrite_ok.jsp" >
<fieldset>
	<h3>건의 글 작성</h3>
	<hr />
	<p id="guide">건의할 내용을 작성 해 주세요.</p>
        <div class="firstDiv border-bottom">
            <label for="title"><span>제목</span></label>
            <input type="text" id="title" name="title" class="infobox" />
        </div>
        <div class="border-bottom">
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" class="infobox"/>
        </div>
        <div class="border-bottom">
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" class="infobox"/>
        </div>
        <div class="border-bottom">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" />
        </div>
        <div id="divTextarea" class="border-bottom">  
        	<label for="content">내용</label>        
 			<div id="divAttention">
 			<textarea id="content" name="content" rows="15"></textarea>
 			<p id="attention">건의 시 유의사항</p>
 			<ul>
				<li>회원간 직거래로 발생하는 피해에 대해 마켓은 책임지지 않습니다.</li>
				<li>주민등록번호, 연락처 등의 정보는 타인에게 노출될 경우 개인정보 도용의 위험이 있으니 주의해 주시기 바랍니다.</li>
				<li>비방, 광고, 불건전한 내용의 글은 관리자에 의해 사전 동의 없이 삭제될 수 있습니다.</li>
			 </ul>
			 </div>
        </div>
        <div class="border-bottom">
            <label for="upfile">첨부파일</label>
            <input type="file" id="upfile" name="upfile" />
        </div>
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" 
            onclick="location.href='boardList.jsp'" />    
        </div>
    </fieldset>
</form>
</div>   
</body>
</html>