<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/subtop2.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<body>
	<link rel="stylesheet"
		href="http://moden939.gabia.io/css/default.css?ver=171253">
	<link rel="stylesheet"
		href="http://moden939.gabia.io/skin/member/basic/style.css?ver=171253">
	<link rel="stylesheet"
		href="http://moden939.gabia.io/skin/member/basic/style2.css?ver=171253">
	<!--[if lte IE 8]>
<script src="http://moden939.gabia.io/js/html5.js"></script>
<![endif]-->
	<script>
		// 자바스크립트에서 사용하는 전역변수 선언
		var g5_url = "http://moden939.gabia.io";
		var g5_bbs_url = "http://moden939.gabia.io/bbs";
		var g5_is_member = "";
		var g5_is_admin = "";
		var g5_is_mobile = "";
		var g5_bo_table = "";
		var g5_sca = "";
		var g5_editor = "";
		var g5_cookie_domain = "";
	</script>
	<script src="http://moden939.gabia.io/js/jquery-1.8.3.min.js"></script>
	<script src="http://moden939.gabia.io/js/jquery.menu.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/common.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/wrest.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/placeholders.min.js"></script>

	<link rel="stylesheet"
		href="http://moden939.gabia.io/js/font-awesome/css/font-awesome.min.css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 얘가 주소 만들어주는 api임 -->
</head>
<body>

	<link
		href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
		rel="stylesheet">

	<style type="text/css">
body {
	background: #fff;;
}

h1, h2, h3, h4, h5, h6, input, button, textarea, select {
	font-family: 'Noto Sans KR', sans-serif;
}

#gnb .gnb_wrap {
	width: 100%;
}

#wrapper {
	margin: 20px auto 100px;
	font-family: 'Noto Sans KR', sans-serif
}

.sctt {
	display: block;
	margin: 100px 0 60px;
	font-size: 30px;
	color: #1f284f;
	font-weight: 400;
	line-height: 1;
	text-align: center;
}

.sctt:after {
	content: "";
	display: block;
	width: 27px;
	height: 2px;
	margin: 30px auto;
	background: #43508b;
}
</style>
	<div id="wrapper">
		<div id="container_wr">

			<style>
body {
	background: #f2f2f2;
}
</style>
			<!-- 회원정보 입력/수정 시작 { -->
			<script src="http://moden939.gabia.io/js/jquery.register_form.js"></script>
			<script src="http://moden939.gabia.io/js/certify.js?v=171253"></script>

			<form id="fregisterform" name="fregisterform"
				action="<%=request.getContextPath()%>/createUser_ok.jsp"
				onsubmit="return fregisterform_submit(this);" method="post"
				autocomplete="off">
				<input type="hidden" name="w" value=""> <input type="hidden"
					name="url" value="%2Fbbs%2Fregister_form2.php"> <input
					type="hidden" name="agree" value="1"> <input type="hidden"
					name="agree2" value="1"> <input type="hidden"
					name="cert_type" value=""> <input type="hidden"
					name="cert_no" value=""> <input type="hidden" name="mb_sex"
					value="">
				<div id="register_form" class="form_01">
					<h3>
						구매자 기본정보 <span class="req">필수입력사항</span>
					</h3>
					<div class="regi_table">
						<table>
							<caption>사이트 이용정보 입력</caption>
							<colgroup>
								<col width="130">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="reg_mb_id" class="req">아이디</label></th>
									<td><input type="text" name="mb_id" id="uid" required
										class="reg_input" minlength="4" maxlength="20"
										placeholder="영문소문자/숫자, 3~20자."> <span id="msg_mb_id"
										class="reg_msg"> </span>
										<button type="button" id="win_hp_cert" class="btn_frmline">아이디
											중복확인</button></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_password" class="req">비밀번호</label></th>
									<td><input type="password" name="mb_password"
										id="reg_mb_password" required class="reg_input" minlength="3"
										maxlength="20"></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_password_re"
										class="req">비밀번호 확인</label></th>
									<td><input type="password" name="mb_password_re"
										id="reg_mb_password_re" required class="reg_input"
										minlength="3" maxlength="20"> <span id="msg_mb_pw"
										class="reg_msg"></span></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_name" class="req">이름</label></th>
									<td><input type="text" id="reg_mb_name" name="mb_name"
										value="" required class="reg_input"></td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_nick" class="req">닉네임</label></th>
									<td><input type="text" name="mb_nick" value="" id="unick"
										required class="reg_input nospace" maxlength="20"> <span
										id="msg_mb_nick" class="reg_msg"></span>
										<button type="button" id="win_hp_cert2" class="btn_frmline">닉네임
											중복확인</button></td>
								</tr>

								<tr>
									<th scope="row"><label for="reg_mb_zip" class="req">주소</label></th>
									<td><input type="text" name="mb_zip" value=""
										id="reg_mb_zip" required class="reg_input" maxlength="6"
										placeholder="우편번호">
										<button type="button" class="btn_frmline"
											onclick="win_zip('fregisterform', 'mb_zip', 'mb_addr1', 'mb_addr2', 'mb_addr3', 'mb_addr_jibeon');">주소검색</button>
										<br> <input type="text" name="mb_addr1" value=""
										id="reg_mb_addr1" required class="reg_input"
										placeholder="기본주소"> <label for="reg_mb_addr1"
										class="sound_only">기본주소<strong> 필수</strong></label><br> <input
										type="text" name="mb_addr2" value="" id="reg_mb_addr2"
										class="reg_input" placeholder="상세주소"> <label
										for="reg_mb_addr2" class="sound_only">상세주소</label><br> <input
										type="text" name="mb_addr3" value="" id="reg_mb_addr3"
										class="reg_input" readonly="readonly" placeholder="나머지주소">
										<label for="reg_mb_addr3" class="sound_only">나머지 주소</label> <input
										type="hidden" name="mb_addr_jibeon" value=""></td>
								</tr>


								<tr>
									<th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
									<td>
										<div class="telselect_wrap">
											<select name="hp1" id="hp1" class="reg_input" required>
												<option value="010">010</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
												<option value="070">070</option>
											</select> <b>-</b> <input type="text" name="hp2" value="" id="hp2"
												class="reg_input" maxlength="4" required> <b>-</b> <input
												type="text" name="hp3" value="" id="hp3" class="reg_input"
												maxlength="4" required>
										</div> <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">

										<input type="hidden" name="old_mb_hp" value="">
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
									<td><input type="hidden" name="old_email" value="">

										<div class="emailselect_wrap">
											<input type="text" name="email1" value="" id="email1"
												class="reg_input" maxlength="20" required> <b>@</b>
											<input type="text" name="email2" value="" id="email2"
												class="reg_input" maxlength="20" required readonly>
											<select name='email3' id='email3' class="reg_input" required>
												<option value="">선택하세요</option>
												<option value="직">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="yahoo.com">yahoo.com</option>
											</select>
										</div> <input type="hidden" name="mb_email" value=""
										id="reg_mb_email"> <span id="msg_mb_email"
										class="reg_msg"></span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_confirm">
						<input type="hidden" name="chkId" id="chkId"> <input
							type="hidden" name="chkNick" id="chkNick"> <a
							href="mainpage.jsp" class="btn_cancel">CANCEL</a> <input
							type="submit" value="JOIN" id="btn_submit" class="btn_submit"
							accesskey="s">
					</div>
				</div>


			</form>

			<!-- 유효성검사 -->
			<script
				src="http://moden939.gabia.io/skin/member/basic/register_form.skin2.check.js?v=171253"></script>
			<script type="text/javascript">
	  $('#win_hp_cert').click(function(){
      	var id=$('#uid').val();
      	open('checkUserId.jsp?mb_id='+id,'chk',
      		'width=500,height=300,left=0,top=0,location=yes,resizable=yes');	
      });

      $('#win_hp_cert2').click(function(){
      	var nick=$('#unick').val();
      	open('checkUserNick.jsp?mb_nick='+nick,'chk',
      		'width=500,height=300,left=0,top=0,location=yes,resizable=yes');	
      });
	
      $(function(){
          $('#btn_submit').click(function(){
        	  if($('#uid').val().length<4){
        		  alert('아이디는 4자 이상이어야 합니다.');
        		  $('#uid').focus();
    	          return false;
        	  }
        	  
             if($('#chkId').val()==""){
    			alert('아이디 중복확인 하세요');
    			$('#chkId').focus();
    				return false;
    			}
             
             if($('#reg_mb_password').val() != $('#reg_mb_password_re').val() ){
       		  alert('비밀번호가 일치하지 않아요.');
       			$('#reg_mb_password').focus();
    	          return false;
       	  	 }
        	  
             if($('#reg_mb_name').val().length<1){
            	 alert('이름을 입력하셔야 합니다.');
            	 $('#reg_mb_name').focus();
    	          return false;
             }
             
             if($('#unick').val().length<1){
            	 alert('닉네임을 입력하셔야 합니다.');
            	 $('#unick').focus();
    	          return false;
             }
    		if($('#chkNick').val()==""){
    			alert('닉네임 중복체크하세요');
    			$('#chkNick').focus();
    			return false;
    		}     
        	 if($('#reg_mb_zip').val().length<1 || $('#reg_mb_addr1').val().length<1 ){
        		alert('주소를 입력하셔야합니다');
     			$('#reg_mb_zip').focus();
     			return false;
        	 }
        	
        	 if($('#hp2').val().length<4 || $('#hp3').val().length<4 ||
        			 $('#reg_mb_addr3').val().length<1){
        		alert('연락처를 제대로 적으세요');
     			$('#hp2').focus();
     			return false;
        	 }
        	  
        	 if($('#email1').val().length<1 || $('#email2').val().length<1){
        		alert('이메일을 입력하셔야합니다');
     			$('#email1').focus();
     			return false;
        	 }
         });
        }); 
      
	</script>
			<script type="text/javascript">
    $(function() {
        $("#reg_zip_find").css("display", "inline-block");
        
      });
    </script>

			<!-- } 회원정보 입력/수정 끝 -->
		</div>

	</div>
	<!-- } 콘텐츠 끝 -->



	<style>
#top_btn {
	display: none;
}
</style>
<script>        
$(function() {
	$("#top_btn").on("click", function() {
		$("html, body").animate({scrollTop:0}, '500');
		return false;
	});

	 $( window ).scroll( function() {
        if ( $( document ).scrollTop() > 300 ) {
            $( '#top_btn' ).fadeIn(500);
        } else {
            $( '#top_btn' ).fadeOut(500);
        }
    });
});
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
<%@include file="../include/bottom.jsp"%>