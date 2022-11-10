<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/subtop2.jsp"%>
<jsp:useBean id="orderinfoService" class="com.teamfour.orderinfo.model.OrderinfoService"
	scope="session"></jsp:useBean>
 <jsp:useBean id="productAllVO" class="com.teamfour.productAll.model.ProductAllVO"
	scope="page"></jsp:useBean>

								
<%
	request.setCharacterEncoding("utf-8");
	
	
	List<ProductAllVO> list= null;
	
	try{
		list=orderinfoService.selectAllPd();
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>허브몰에 어서오세요</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>인기상품</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                             <!-- 시발점 -->
                      		<%
                      		for(int i=0;i<list.size();i++){ 
                      			productAllVO=list.get(i);
                      		%>
                            <div class="col-lg-4">
                                    <div class="product__discount__item" >
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="<%=request.getContextPath() %>/img/<%=productAllVO.getImage()%>" onclick="location.href='shop-details.jsp?pdcode=<%=productAllVO.getPdcode()%>'">
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="shop-details.jsp?pdcode=<%=productAllVO.getPdcode()%>">
                                                <i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                        <input type="hidden" name= "pdcode">
                                            <h5><a href="#"></a><%=productAllVO.getPdname() %></h5>
                                            <div class="product__item__price"><%=productAllVO.getPrice() %>원</div>
                                        </div>
                                    </div>
                                </div>
                            <%} %>
                                
                                
                                <!-- 끝 -->
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

<%@ include file="../include/bottom.jsp"%>