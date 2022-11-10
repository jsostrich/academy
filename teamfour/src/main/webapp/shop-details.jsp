<%@page import="com.userinfo.model.UserInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
<jsp:useBean id="orderinfoService" class="com.teamfour.orderinfo.model.OrderinfoService"
	scope="session"></jsp:useBean>
<jsp:useBean id="productAllVO" class="com.teamfour.productAll.model.ProductAllVO"
	scope="page"></jsp:useBean>
<jsp:useBean id="productAllService" class="com.teamfour.productAll.model.ProductAllService"
scope="session"></jsp:useBean>
<jsp:useBean id="userInfoService" class="com.userinfo.model.UserInfoService"
scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String d_userid = (String)session.getAttribute("d_userid");
	String d_sellerid = (String)session.getAttribute("d_sellerid");
	String pdcode=request.getParameter("pdcode");
	
	UserInfoVO uvo = new UserInfoVO();
	try{
		productAllVO=orderinfoService.detailViewPdCode(Integer.parseInt(pdcode));
		uvo = userInfoService.selectUser(d_userid);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	ProductAllVO voo = new ProductAllVO();
	
	try{
		voo = productAllService.detailProduct(Integer.parseInt(pdcode));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String userno = (Integer.toString(uvo.getUser_no()));
	session.setAttribute("userno", userno);
	
%>


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품 상세보기</h2>
                        <div class="breadcrumb__option">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%=request.getContextPath() %>/img/<%=voo.getImage()%>" alt="">
                        </div>
                       
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=voo.getPdname() %></h3>
                        
                        <div class="product__details__price"><%=voo.getPrice() %>원</div>
                        <p><%=voo.getDetail() %></p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1" id="qty" name="qty">
                                </div>
                            </div>
                        </div>
                        <%-- onclick="location.href='shoping-cart.jsp?pdcode=<%=productAllVO.getPdcode()%>'" --%>
                        <%if(d_sellerid==null || d_sellerid.isEmpty()) {%>
                        <a href="#" onclick="primaryBtn();" class="primary-btn">장바구니 담기</a>
                        									
                        <% }%>
                        <input type="hidden" id="idcheck" value="<%=d_userid%>">
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                        <ul>
                            <li><b>재고</b> <span><%=voo.getQty() %>개 남음</span></li>
                            <li><b>Share on</b>
                                <div class="share">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false">Reviews <span>(1)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p><%=productAllVO.getDetail() %></p>
                                    <!-- <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
                                        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
                                        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
                                        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
                                        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
                                        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
                                        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
                                        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
                                        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
                                        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
                                        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
                                        sed sit amet dui. Proin eget tortor risus.</p> -->
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
                                        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
                                        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
                                        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
                                        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>Products Infomation</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    
                </div>
            </div>
            
        </div>
    </section>
    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
   <%@ include file="../include/bottom.jsp"%>
   
   <script type="text/javascript">
   	function primaryBtn() {
   		const qty = $("#qty").val();
   		const pdcode = <%=productAllVO.getPdcode()%>;
   		location.href="<%=request.getContextPath()%>/insertCart.jsp?pdcode=" + pdcode + "&qty=" + qty +"";
   		<%
	   		if(d_userid==null||d_userid.isEmpty()){%>
	   		alert('로그인을 하세요!');
	   		event.preventDefault();
   			location.href="loginClass.jsp";
	   		<%}
   		%>
   	}
   </script>
   
   
   