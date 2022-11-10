<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
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
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService"
scope = "session"></jsp:useBean>
<jsp:useBean id="sellerInfoVo" class="com.sellerinfo.model.SellerInfoVO"
scope ="session"></jsp:useBean>
<script type="text/javascript" src="js/jquery-3.6.1.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$('#btn_submit').click(function(){
			if($('#pdname').val().length<1){
				alert('상품명을 입력하세요');
				$('#pdname').focuds();
				return false;
			}
			
			if($('#price').val().length<1){
				alert('가격을 입력하세요');
				$('#price').focuds();
				return false;
			}
			
			if($('#qty').val().length<1){
				alert('재고수량을 입력하세요');
				$('#qty').focuds();
				return false;
			}
			if($('#productImage').val().length<1){
				alert('제품이미지를 넣어주세요');
				$('#productImage').focuds();
				return false;
			}
			if($('#detail').val().length<1){
				alert('상세설명을 써주세요');
				$('#detail').focuds();
				return false;
			}
			
			if($('#cloth').val()!='empty' && $('#food').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#cloth').val()!='empty' && $('#furniture').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#cloth').val()!='empty' && $('#electronics').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#cloth').val()!='empty' && $('#pet').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#food').val()!='empty' && $('#furniture').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#food').val()!='empty' && $('#electronics').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#food').val()!='empty' && $('#pet').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#furniture').val()!='empty' && $('#electronics').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#furniture').val()!='empty' && $('#pet').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
			if($('#electronics').val()!='empty' && $('#pet').val()!='empty'){
				alert('여러개를 하실순 없어용');
				return false;
			}
		});
	});
</script>
<%	
	String sellerid = (String)session.getAttribute("d_sellerid");
	sellerInfoVo = sellerInfoService.selectSeller(sellerid);
	

%>
		<!-- 회원정보 입력/수정 시작 { -->
	<script src="http://moden939.gabia.io/js/jquery.register_form.js"></script>
	<script src="http://moden939.gabia.io/js/certify.js?v=171253"></script>
		<form id="fregisterform" name="fregisterform"
		action="<%=request.getContextPath()%>/productRegister_ok.jsp"
		onsubmit="return fregisterform_submit(this);" method="post"
		enctype="multipart/form-data" >
		<input type="hidden" name="w" value=""> <input type="hidden"
			name="url" value="%2Fbbs%2Fregister_form2.php"> <input
			type="hidden" name="agree" value="1"> <input type="hidden"
			name="agree2" value="1"> <input type="hidden"
			name="cert_type" value=""> <input type="hidden"
			name="cert_no" value=""> <input type="hidden" name="mb_sex"
			value="">
		<div id="register_form" class="form_01">
			<h3>
				상품등록 <span class="req">필수입력사항</span>
			</h3>
			<div class="regi_table">
				<table>
					<caption>상품정보입력</caption>
					<colgroup>
						<col width="130">
						<col width="*">
					</colgroup>
					<tbody>
						<input type="hidden" name="seller_no" value="<%=sellerInfoVo.getSeller_no() %>">
						<tr>
						<th scope="row"><label for="pdname" class="req">상품명</label></th>
						<td><input type="text" name="pdname" id="pdname" required
									class="reg_input" > 
							<span id="msg_mb_id" class="reg_msg"> </span>
						</tr>
						<tr>
							<th scope="row"><label for="price" class="req">가격</label></th>
							<td><input type="text" name="price"
								id="price" required class="reg_input" ></td>
						</tr>
						<tr>
							<th scope="row"><label for="qty" class="req">재고수량</label></th>
							<td><input type="text" id="qty" name="qty"
								value="" required class="reg_input"></td>
						</tr>
						<tr>
							<th scope="row"><label for="productImage" class="req">제품이미지</label></th>
							<td><input type="file" name="productImage"  id="productImage"
								required class="reg_input nospace" > 
								<span id="msg_mb_nick" class="reg_msg"></span>
						</tr>
						<tr>
							<th scope="row"><label for="reg_mb_email" class="req">상세설명</label></th>
							<td><input type="hidden" name="old_email" value="">
									<textarea name="detail" id="detail" rows="100" cols="50"
										class="detail" required></textarea>
								</td>
						</tr>
						<tr>
							<th scope="row"><label for="reg_mb_hp" class="req">소분류코드</label></th>
							<td>
								<div class="telselect_wrap">
									<select name="cloth" id="cloth" class="reg_input" required>
										<option value="empty">의류는 여기</option>
										<option value="10010">상의</option>
										<option value="10020">하의</option>
										<option value="10030">아우터</option>
										<option value="10040">수트/셋업</option>
										<option value="10050">운동복</option>
										<option value="10060">수영복</option>
										</select>
										
									<select name="food" id="food" class="reg_input" required>
										<option value="empty">식품은 여기</option>
										<option value="20010">건강식품</option>
										<option value="20020">과일</option>
										<option value="20030">채소</option>
										<option value="20040">축산물</option>
										<option value="20050">수산물/건어물</option>
										<option value="20060">쌀/잡곡</option>
										<option value="20070">견과류/건과류</option>
										<option value="20080">생수/음료</option>
										<option value="20090">면/통조림</option>
										</select>	
										
									<select name="furniture" id="furniture" class="reg_input" required>
										<option value="empty">가구는 여기</option>
										<option value="30010">의자</option>
										<option value="30020">침대/매트리스</option>
										<option value="30030">드레스룸/헹거</option>
										<option value="30040">책상/책장</option>
										<option value="30050">식탁/주방가구</option>
										<option value="30060">조명/스탠드</option>
										</select>
										
									<select name="electronics" id="electronics" class="reg_input" required>
										<option value="empty">전자제품은 여기</option>
										<option value="40010">겨울가전</option>
										<option value="40020">TV</option>
										<option value="40030">청소기</option>
										<option value="40040">냉장고</option>
										<option value="40050">세탁기/건조기</option>
										<option value="40060">욕실가전</option>
										<option value="40070">생활가전</option>
										</select>
									<select name="pet" id="pet" class="reg_input" required>
										<option value="empty">펫상품은 여기</option>
										<option value="50010">영양제</option>
										<option value="50020">수제간식</option>
										<option value="50030">강아지용품</option>
										<option value="50040">고양이물품</option>
										<option value="50050">기타반려용품</option>
										<option value="50060">조류/햄스터/토끼/고슴도치용품</option>
										</select>
									</div> <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">
									<input type="hidden" name="old_mb_hp" value="">
							</td>
						</tr>
					</tbody>
					</table>
				</div>
				<div class="btn_confirm">
					<input type="hidden" name="chkId" id="chkId"> <input
						type="hidden" name="chkNick" id="chkNick"> <a
						href="mainpage.jsp" class="btn_cancel">메인으로 가기</a> <input
						type="submit" value="등록하기" id="btn_submit" class="btn_submit"
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
      	open('checkSellerId.jsp?mb_id='+id,'chk',
      		'width=500,height=300,left=0,top=0,location=yes,resizable=yes');	
      });

      $('#win_hp_cert2').click(function(){
      	var nick=$('#unick').val();
      	open('checkSellerNick.jsp?mb_nick='+nick,'chk',
      		'width=500,height=300,left=0,top=0,location=yes,resizable=yes');	
      });
	
      $('#btn_submit').click(function(){
    	 if($('#pdname').val().length<1{
    		alert('상품명을 입력해주세요');
    		$('#pdname').focue();
    		return false;
    	 });
    	 
    	 if($('#price').val().length<1{
     		alert('금액을 입력해주세요');
     		$('#price').focue();
     		return false;
     	 });
    	 
    	 if($('#qty').val().length<1{
      		alert('재고수량을 입력해주세요');
      		$('#qty').focue();
      		return false;
      	 });
    	 
      });
      
      
      
      
      
      
      
	</script>
			<script type="text/javascript">
    $(function() {
        $("#reg_zip_find").css("display", "inline-block");
        
      });
    // submit 최종 폼체크
			
			
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
<%@ include file="../include/bottom.jsp"%>