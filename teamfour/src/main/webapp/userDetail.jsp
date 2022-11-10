<%@page import="java.util.ArrayList"%>
<%@page import="oracle.net.aso.a"%>
<%@page import="com.teamfour.orderinfo.model.OrderinfoVO"%>
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

                        <!-- .shop-content 시작 { -->
        <div class="shop-content">
            <div id="wrapper_title">마이페이지</div>            
            <!-- 글자크기 조정 display:none 되어 있음 시작 { -->
            <div id="text_size">
                <button class="no_text_resize" onclick="font_resize('container', 'decrease');">작게</button>
                <button class="no_text_resize" onclick="font_default('container');">기본</button>
                <button class="no_text_resize" onclick="font_resize('container', 'increase');">크게</button>
            </div>
            <!-- } 글자크기 조정 display:none 되어 있음 끝 -->
            
<jsp:useBean id="userInfoService" class="com.userinfo.model.UserInfoService"
scope="session"></jsp:useBean>
<jsp:useBean id="userInfoVo" class="com.userinfo.model.UserInfoVO"
scope="session"></jsp:useBean>
<jsp:useBean id="orderInfoService" class="com.teamfour.orderinfo.model.OrderinfoService"
scope="session"></jsp:useBean>
<style type="text/css">
	#nocol{
		text-align: center;
	}
</style>
<%
	request.setCharacterEncoding("utf-8");

	String userinfo = (String)session.getAttribute("d_userid");
	List<OrderinfoVO> list = new ArrayList<>();
	if(userinfo!=null || !userinfo.isEmpty()){
		userInfoVo=userInfoService.selectUser(userinfo);
		list = orderInfoService.userOrder(userinfo);
	}else{%>
	<script type="text/javascript">
		location.href='mainpage.jsp';
	</script>
<% }	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	OrderinfoVO voo = new OrderinfoVO();
	
	

%>
<!-- 마이페이지 시작 { -->
<div id="smb_my">

    <!-- 회원정보 개요 시작 { -->
    <section id="smb_my_ov">
        <h2>회원정보 개요</h2>
        
        <div class="smb_me">
	        <strong class="my_ov_name">
	        <img src="https://demo.sir.kr/gnuboard5/img/no_profile.gif" alt="profile_image">
	        <br><%=userInfoVo.getUser_nick() %></strong><br>
	        <a href="<%=request.getContextPath() %>/editUser.jsp?user_id=<%=userinfo %>" 
	        	class="smb_info">정보수정</a>
	        <a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
        </div>
        
        <h3>내정보</h3>
        <dl class="op_area">
            <dt>연락처</dt>
            <dd><%=userInfoVo.getUser_tel() %></dd>
            <dt>E-Mail</dt>
            <dd><%=userInfoVo.getUser_email() %></dd>
            <dt>회원가입일시</dt>
            <dd><%=sdf.format(userInfoVo.getUser_joindate()) %></dd>
            <dt id="smb_my_ovaddt">주소</dt>
            <dd id="smb_my_ovaddd"><%=userInfoVo.getUser_address() %></dd>
        </dl>
        
        <a href="deleteUser.jsp" class="withdrawal">회원탈퇴</a>
    </section>
    <!-- } 회원정보 개요 끝 -->

	<div id="smb_my_list">
	    <!-- 최근 주문내역 시작 { -->
	    <section id="smb_my_od">
	        <h2>주문내역조회</h2>
	        
<!-- 주문 내역 목록 시작 { -->

<div class="tbl_head03 tbl_wrap">
    <table>
    <thead>
    <tr>
        <th scope="col">주문서번호</th>
        <th scope="col">상품코드</th>
        <th scope="col">상품수</th>
        <th scope="col">금액</th>
        <th scope="col">총 주문금액</th>
        <th scope="col">주문일시</th>
    </tr>
    </thead>
    <tbody>
    <%if(list.size()==0){%>
    	<tr>
        <td colspan="6" id="nocol">
        주문 내역이 없습니다.
        </td>
    </tr>
    <%} %>
    <%for(int i =0;i<list.size();i++){
    	voo = list.get(i);
    %>
    <tr>
        <td>
            <a><%=voo.getOrder_no()%></a>
        </td>
        <td><%=voo.getPdcode() %></td>
        <td class="td_numbig"><%=voo.getQty() %></td>
        <td class="td_numbig text_right"><%=(voo.getTotalprice() /voo.getQty())%>원</td>
        <td class="td_numbig text_right"><%=voo.getTotalprice() %>원</td>
        <td class="td_numbig text_right"><%=sdf.format(voo.getOrderdate()) %></td>
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

<script>
function member_leave()
{
    return confirm('정말 회원에서 탈퇴 하시겠습니까?')
}

function out_cd_check(fld, out_cd)
{
    if (out_cd == 'no'){
        alert("옵션이 있는 상품입니다.\n\n상품을 클릭하여 상품페이지에서 옵션을 선택한 후 주문하십시오.");
        fld.checked = false;
        return;
    }

    if (out_cd == 'tel_inq'){
        alert("이 상품은 전화로 문의해 주십시오.\n\n장바구니에 담아 구입하실 수 없습니다.");
        fld.checked = false;
        return;
    }
}

function fwishlist_check(f, act)
{
    var k = 0;
    var length = f.elements.length;

    for(i=0; i<length; i++) {
        if (f.elements[i].checked) {
            k++;
        }
    }

    if(k == 0)
    {
        alert("상품을 하나 이상 체크 하십시오");
        return false;
    }

    if (act == "direct_buy")
    {
        f.sw_direct.value = 1;
    }
    else
    {
        f.sw_direct.value = 0;
    }

    return true;
}
</script>
<!-- } 마이페이지 끝 -->

        </div>  <!-- } .shop-content 끝 -->
	</div>      <!-- } #container 끝 -->
</div>
<!-- } 전체 콘텐츠 끝 -->

<%@ include file="../include/bottom.jsp"%>