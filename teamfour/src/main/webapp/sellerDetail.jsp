<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/css/default_shop.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/font-awesome/css/font-awesome.min.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/owlcarousel/owl.carousel.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_basic/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_side/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/shop/basic/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/latest/notice/style.css?ver=220620">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/visit/shop_basic/style.css?ver=220620">
<div id="wrapper" class="">
    <!-- #container 시작 { -->
    <div id="container">
        <div class="shop-content">
            <div id="wrapper_title">마이페이지</div>            
            <!-- 글자크기 조정 display:none 되어 있음 시작 { -->
            <div id="text_size">
                <button class="no_text_resize" onclick="font_resize('container', 'decrease');">작게</button>
                <button class="no_text_resize" onclick="font_default('container');">기본</button>
                <button class="no_text_resize" onclick="font_resize('container', 'increase');">크게</button>
            </div>
<style type="text/css">
	img{
		width:100px;
		height:100px;
	}
	td{
		font-size: 15px;
	}
</style>
            <!-- } 글자크기 조정 display:none 되어 있음 끝 -->
            
<jsp:useBean id="sellerInfoService" class="com.sellerinfo.model.SellerInfoService"
scope="session"></jsp:useBean>
<jsp:useBean id="sellerInfoVo" class="com.sellerinfo.model.SellerInfoVO"
scope="session"></jsp:useBean>
<jsp:useBean id="productAllService" class="com.teamfour.productAll.model.ProductAllService"
scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	

	String sellerinfo = (String)session.getAttribute("d_sellerid");
	if(sellerinfo!=null || !sellerinfo.isEmpty()){
		sellerInfoVo=sellerInfoService.selectSeller(sellerinfo);
	}else{%>
		<script type="text/javascript">
			location.href='mainpage.jsp';
		</script>
	<% }
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	ProductAllVO vo = new ProductAllVO();
	List<ProductAllVO> list = productAllService.selectbySellerNo(sellerinfo);
%>
<!-- 마이페이지 시작 { -->
<div id="smb_my">

    <!-- 회원정보 개요 시작 { -->
    <section id="smb_my_ov">
        <h2>회원정보 개요</h2>
        
        <div class="smb_me">
	        <strong class="my_ov_name">
	        <img src="https://demo.sir.kr/gnuboard5/img/no_profile.gif" alt="profile_image">
	        <br><%=sellerInfoVo.getSeller_nick()%></strong><br>
	        <a href="<%=request.getContextPath() %>/EditSeller.jsp?seller_id=<%=sellerinfo %>" 
	        	class="smb_info">정보수정</a>
	        <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
	        <a href="<%=request.getContextPath()%>/deleteSeller.jsp?seller_id=<%=sellerinfo%>">회원탈퇴</a>
        </div>
        
        <h3>내정보</h3>
        <dl class="op_area">
            <dt>연락처</dt>
            <dd><%=sellerInfoVo.getSeller_tel() %></dd>
            <dt>E-Mail</dt>
            <dd><%=sellerInfoVo.getSeller_email()%></dd>
            <dt>회원가입일시</dt>
            <dd><%=sdf.format(sellerInfoVo.getSeller_joindate()) %></dd>
            <dt id="smb_my_ovaddt">주소</dt>
            <dd id="smb_my_ovaddd"><%=sellerInfoVo.getSeller_address() %></dd>
            <dt>상품등록</dt>
            <dd><input type="button" value="상품등록하러 가기" onclick="location.href='productRegister.jsp'">  </dd>
        </dl>
    </section>
    <!-- } 회원정보 개요 끝 -->

	<div id="smb_my_list">
	    <!-- 최근 주문내역 시작 { -->
	    <section id="smb_my_od">
	        <h2>상품등록 조회</h2>
	        
<!-- 주문 내역 목록 시작 { -->

<div class="tbl_head03 tbl_wrap">
    <table>
    <thead>
    <tr>
        <th scope="col">상품번호</th>
        <th scope="col">이미지</th>
        <th scope="col">상품명</th>
        <th scope="col">가격</th>
        <th scope="col">재고</th>
        <th scope="col">상세설명</th>
        <th scope="col">등록일자</th>
    </tr>
    </thead>
    <tbody>
    <%for(int i = 0;i<list.size();i++){
    	vo = list.get(i);%>
    <tr>
        <td>
    <a href="<%=request.getContextPath()%>/shop-details.jsp?pdcode=<%=vo.getPdcode() %>">
            <%=vo.getPdcode() %></a>
        </td>
        <td><img src="<%=request.getContextPath()%>/img/<%=vo.getImage()%> "></td>
        <td class="td_numbig"><%=vo.getPdname() %></td>
        <td class="td_numbig text_right"><%=vo.getPrice() %>원</td>
        <td class="td_numbig text_right"><%=vo.getQty() %></td>
        <%if(vo.getDetail().length()>5){%>
        <td class="td_numbig text_right"><%=vo.getDetail().substring(0, 5) %>...</td>	
        	<% }else{%>
        <td class="td_numbig text_right"><%=vo.getDetail() %></td>
       	<% }%>
        <td><span class="status_01"><%=sdf.format(vo.getRegdate()) %> </span></td>
    </tr>
    	<%}%>

        </tbody>
    </table>
</div>
<!-- } 주문 내역 목록 끝 -->	
	    </section>
	    <!-- } 최근 주문내역 끝 -->
	</div>
</div>
<!-- } 마이페이지 끝 -->

        </div>  <!-- } .shop-content 끝 -->
	</div>      <!-- } #container 끝 -->
</div>
<!-- } 전체 콘텐츠 끝 -->

<%@ include file="../include/bottom.jsp"%>