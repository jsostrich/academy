<%@page import="com.userinfo.model.UserInfoVO"%>
<%@page import="javax.swing.plaf.synth.SynthOptionPaneUI"%>
<%@page import="org.apache.catalina.ant.jmx.JMXAccessorQueryTask"%>
<%@page import="com.teamfour.cart.model.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
<%@ include file="include/checkLogin.jsp"%>
<script src="http://moden939.gabia.io/js/jquery.register_form.js"></script>
			<script src="http://moden939.gabia.io/js/certify.js?v=171253"></script>
<link rel="stylesheet"
		href="http://moden939.gabia.io/css/default.css?ver=171253">
	<link rel="stylesheet"
		href="http://moden939.gabia.io/skin/member/basic/style.css?ver=171253">
	<link rel="stylesheet"
		href="http://moden939.gabia.io/skin/member/basic/style2.css?ver=171253">
	<!--[if lte IE 8]>
<script src="http://moden939.gabia.io/js/html5.js"></script>
<![endif]-->
	<script src="http://moden939.gabia.io/js/jquery-1.8.3.min.js"></script>
	<script src="http://moden939.gabia.io/js/jquery.menu.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/common.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/wrest.js?ver=171253"></script>
	<script src="http://moden939.gabia.io/js/placeholders.min.js"></script>

	<link rel="stylesheet"
		href="http://moden939.gabia.io/js/font-awesome/css/font-awesome.min.css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 얘가 주소 만들어주는 api임 -->			
<link
		href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
		rel="stylesheet">			
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>			
			
<jsp:useBean id="cartVO" class="com.teamfour.cart.model.CartVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="cartService" class="com.teamfour.cart.model.CartService"
	scope="session"></jsp:useBean>
<jsp:useBean id="userInfoService" class="com.userinfo.model.UserInfoService"
scope="session"></jsp:useBean>
	<style type="text/css">
		#img{
			width : 100px;
		}
		.primary-btn{
			width : 500px;
			border : 0px;
		}
		#orderin{
			width : 100%;
		}
		#orderin th{
			width : 20%;
		}
		#ordertext{
			width : 300px;
		}
		#orderch{
			font-size: 1.5em;
		}
	</style>
	
<%
	request.setCharacterEncoding("utf-8");
	String d_sellerid = (String)session.getAttribute("d_sellerid");
	String userno="";
	int pdcode = 0;
	int qty = 0;
	
	
	List<CartVO> list = new ArrayList<>();
	List<CartVO> list2 = new ArrayList<>();
	CartVO vo = new CartVO();
	UserInfoVO uvo = new UserInfoVO();
	if( request.getParameter("pdcode") != null ) {
		pdcode = Integer.parseInt(request.getParameter("pdcode"));
		qty = Integer.parseInt(request.getParameter("qty"));
		int result = 0;
		userno = request.getParameter("userno");
		session.setAttribute("userno", userno);
		try{
			list= cartService.selectCartItem(Integer.parseInt(userno));	
			uvo = userInfoService.selectUserNo(Integer.parseInt(userno));
			session.setAttribute("size", list.size());
			int total = 0;
			for(int i=0;i<list.size();i++){ 
				total += list.get(i).getTotalprice();
				request.setAttribute("total", total);
			}
			System.out.println("list");
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else if(d_userid!=null || !d_userid.isEmpty()){
		list2 = cartService.selectMainCartItem(d_userid);
		int result = 0;
		
		try{
			list2=cartService.selectMainCartItem(d_userid);
			uvo = userInfoService.selectUser(d_userid);
			userno = Integer.toString(uvo.getUser_no());
			session.setAttribute("userno", userno);
			session.setAttribute("size", list2.size());
			int total = 0;
			for(int i=0;i<list2.size();i++){ 
				total += list2.get(i).getTotalprice();
				request.setAttribute("total", total);
			}
			System.out.println("list2 = "+list2.size());
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	String hp=uvo.getUser_tel();
	String[] hpArr=hp.split("-");
	String hp1=hpArr[0] , hp2=hpArr[1],hp3=hpArr[2];
	
	String email = uvo.getUser_email();
	int gol = email.indexOf("@");
	String em1=email.substring(0,gol) , em2=email.substring(gol+1);
	String add = uvo.getUser_address();
	int ad = add.indexOf("(");
	String ad1 = add.substring(0,ad), ad2=add.substring(ad);
	
%>
<script type="text/javascript">
$(function(){
	$('#orderch').change(function(){
		$('#name').val('<%=uvo.getUser_name()%>');
		$('#hp1').val('<%=hp1%>');
		$('#hp2').val('<%=hp2%>');
		$('#hp3').val('<%=hp3%>');
		$('#zip').val('<%=uvo.getUser_zipcode()%>');
		$('#reg_mb_addr1').val('<%=ad1%>');
		$('#reg_mb_addr3').val('<%=ad2%>');
		$('#email1').val('<%=em1%>');
		$('#email2').val('<%=em2%>');
	});
});
</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>장바구니</h2>
					<div class="breadcrumb__option">
						<a href="./mainpage.jsp">Home</a> <span>장바구니</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
	<form name="frmcart" action="<%=request.getContextPath() %>/order.jsp" method="post">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th class="shoping__product">제품</th>
								<th>가격</th>
								<th>수량</th>
								<th>합계</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
							<%
							if(d_userid!=null&&!d_userid.isEmpty()){
								if(list.size()<1 && list2.size()<1){%>
									<tr>
									<td colspan="5" > 장바구니 등록한게 없네용</td>
									</tr>
								<%}
	                      		for(int i=0;i<list2.size();i++){ 
	                      			vo = list2.get(i);
	                      		%>
	                      		<input type="hidden" name="cartno<%=i%>" value="<%=vo.getCartNo()%>">
	                      		<input type="hidden" name="pdcode<%=i%>" value="<%=vo.getPdcode()%>"> 
								<tr>
									<%-- <input type="hidden" name="cartno" value="<%=list.get(i).getCartNo() %>"> --%>
									<td class="shoping__cart__item" >
									<img class="session_data"src="<%=request.getContextPath() %>/img/<%=vo.getImage()%>"
										 alt="" id="img">
										<h5 class="session_data" name="pdname<%=i %>"><%=vo.getPdName()%></h5></td>
									<td class="shoping__cart__price session_data" name="price<%=i%>"><%=vo.getPrice()%>
									</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" name="qty<%=i%>" value="<%=vo.getQty()%>" 
												class="session_data">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total" ><%=(vo.getQty()*vo.getPrice())%>
									</td>
									<td class="shoping__cart__item__close"><span
										class="icon_close" onClick="location.href='shopCartDelete.jsp?cartno=<%=vo.getCartNo() %>'"></span></td>
								</tr>
								<%}
                      		}%>
							<%
							if(request.getParameter("pdcode") != null){
								if(list.size()<1 && list2.size()<1){%>
								<tr>
								<td colspan="5" > 장바구니 등록한게 없네용</td>
								</tr>
							<%}
	                      		for(int i=0;i<list.size();i++){ 
	                      			vo = list.get(i);
	                      		%>
	                      		<input type="hidden" name="cartno<%=i%>" value="<%=vo.getCartNo()%>">
	                      		<input type="hidden" name="pdcode<%=i%>" value="<%=vo.getPdcode()%>"> 
								<tr>
									<%-- <input type="hidden" name="cartno" value="<%=list.get(i).getCartNo() %>"> --%>
									<td class="shoping__cart__item"><img class="session_data"
										src="<%=request.getContextPath() %>/img/<%=vo.getImage()%>" alt="" id="img">
										<h5 class="session_data" name="pdname<%=i %>"><%=vo.getPdName()%></h5></td>
									<td class="shoping__cart__price session_data"name="price<%=i%>"><%=vo.getPrice()%>
									</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" name="qty<%=i%>" value="<%=vo.getQty()%>"
													class="session_data">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total"><%=(vo.getQty()*vo.getPrice())%>
									</td>
									<td class="shoping__cart__item__close"><span
										class="icon_close" onClick="location.href='shopCartDelete.jsp?cartno=<%=vo.getCartNo() %>'"></span></td>
								</tr>
								<%} 
							}%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="<%=request.getContextPath() %>/mainpage.jsp" class="primary-btn cart-btn">쇼핑 계속하기</a>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>할인 쿠폰</h5>
							<input type="text" placeholder="이곳에 쿠폰번호 입력">
							<button type="submit" class="site-btn">쿠폰 적용하기</button>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>장바구니 종합</h5>
					<ul>
						<li>소계 <span><%=request.getAttribute("total")%></span></li>
						<li>합계 <span><%=request.getAttribute("total")%></span></li>
					</ul>
				</div>
			</div>
			<div id="register_form" class="form_01">
				<input type="checkbox" id="orderch"> 주문자 내용과 일치합니다
			<table id="orderin">
			<tr>
					<th scope="row"><label for="reg_mb_name" class="req">수령자 이름</label></th>
					<td><input type="text" id="name" name="mb_name"
						value="" required class="reg_input"></td>
				</tr>
				<tr>
				<th scope="row"><label for="reg_mb_hp" class="req">수령자 연락처</label></th>
				<td>
					<div class="telselect_wrap">
						<select name="hp1" id="hp1" name ="hp1" class="reg_input" >
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
				<th scope="row"><label for="reg_mb_zip" class="req">수령자 주소</label></th>
				<td><input type="text" name="mb_zip" value=""
					id="zip" required class="reg_input" maxlength="6"
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
					class="reg_input"  placeholder="나머지주소">
					<label for="reg_mb_addr3" class="sound_only">나머지 주소</label> <input
					type="hidden" name="mb_addr_jibeon" value=""></td>
			</tr>
			<tr>
			<th scope="row"><label for="reg_mb_email" class="req">수령자 이메일</label></th>
			<td><input type="hidden" name="old_email" value="">

				<div class="emailselect_wrap">
					<input type="text" name="email1" value="" id="email1"
						class="reg_input" maxlength="20" required> <b>@</b>
					<input type="text" name="email2" value="" id="email2"
						class="reg_input" maxlength="20" required readonly>
					<select name='email3' id='email3' class="reg_input" >
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
			</table>
			</div>
		</div>
			<input type = "submit" class="primary-btn" value="결제 및 주문하기"
			id="gogo">
	</div>
	</form>
</section>
<!-- Shoping Cart Section End -->

<!-- Js Plugins -->

<%@ include file="../include/bottom.jsp"%>