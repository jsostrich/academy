<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");	

	String t_userid = (String)session.getAttribute("userid");
	String t_sellerid = (String)session.getAttribute("sellerid");
    boolean t_userlogin = false; 
    boolean t_sellorlogin = false;
    if(t_userid!=null && !t_userid.isEmpty()){ //세션이 있다면 로그인 된 상태
    	t_userlogin = true;
    	session.setAttribute("d_userid", t_userid);
    }
    if(t_sellerid!=null && !t_sellerid.isEmpty()){ //세션이 있다면 로그인 된 상태
    	t_sellorlogin = true;
    	session.setAttribute("d_sellerid", t_sellerid);
    }
    
    
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
	<link rel="stylesheet" href="css/searchProducts.css" type="text/css">
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/herbmalllogo.png" alt=""></a>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                    </div>
                    <div class="col-lg-6 col-md-6">
                    <%if(t_userlogin){%>
                    	<div class="header__top__right">
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/userDetail.jsp">
                                <i class="fa fa-user"></i> 회원 상세정보</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath() %>/logout.jsp">
                                <i class="fa fa-user"></i> 로그아웃</a>
                            </div>
                        </div>
                    <%}else if(t_sellorlogin){ %>
                    	<div class="header__top__right">
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/sellerDetail.jsp">
                                <i class="fa fa-user"></i> 판매회원 상세정보</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath() %>/logout.jsp">
                                <i class="fa fa-user"></i> 로그아웃</a>
                            </div>
                        </div>
                    <%}else{ %>
                        <div class="header__top__right">
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath()%>/agreement.jsp">
                                <i class="fa fa-user"></i> 회원가입</a>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="<%=request.getContextPath() %>/loginClass.jsp">
                                <i class="fa fa-user"></i> 로그인</a>
                            </div>
                        </div>
                    <%} %>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./mainpage.jsp"><img src="img/herbmalllogo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./mainpage.jsp">Home</a></li>
                            <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                            <li><a href="<%=request.getContextPath()%>/BoardWirteForm.jsp">notice</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>전체 카테고리</span>
                        </div>
                        <ul>
                            <li><a href="searchProducts.jsp?maincode=10000">의류</a></li>
                            <li><a href="searchProducts.jsp?maincode=20000">식품</a></li>
                            <li><a href="searchProducts.jsp?maincode=30000">가구</a></li>
                            <li><a href="searchProducts.jsp?maincode=40000">전자제품</a></li>
                            <li><a href="searchProducts.jsp?maincode=50000">펫</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="searchProducts.jsp">
                              
                                <input type="text" name="name" placeholder="이름으로 검색...">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
   