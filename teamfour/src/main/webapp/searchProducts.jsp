<%@page import="com.teamfour.productAll.model.ProductUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.teamfour.productAll.model.ProductAllVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/subtop2.jsp" %>

<jsp:useBean id="productAllService" class = "com.teamfour.productAll.model.ProductAllService"
 scope = "session"></jsp:useBean>


<%
	// 1. 대분류 선택을 통해 접속
	// 2. 검색어 입력을 통해 접속
	// 어느 쪽도 List<>를 통해 관리
	// 최초에 어느 쪽으로 입력되는지에 따라서 List에 집어넣을 메서드를 달리한다
	
	// 이후 사이트가 제공하는 필터옵션을 통한 재검색을 실시할 경우 List에서 List2로 조건에 맞는 vo를 붙여넣기
	// db작업까진 필요 없이 dao 자체에서 작업 가능할듯?
	
			
	request.setCharacterEncoding("utf-8");

	String maincode = request.getParameter("maincode");
	String name = request.getParameter("name");
	
	int searchBy = 0;
	
	if(maincode != null && !maincode.isEmpty()){
		searchBy = 1;
	} else if(name != null && !name.isEmpty()){
		searchBy = 2;
	} else {
		maincode = "";
		name = "";
		searchBy = 2;
	}
	
	List<ProductAllVO> pdSearchList = null;
	
	try{
		if(searchBy == 1){
			pdSearchList = productAllService.selectByMaincode(Integer.parseInt(maincode));
		} else if(searchBy == 2){
			pdSearchList = productAllService.selectByName(name);
		}
	} catch (SQLException e){
		e.printStackTrace();
	}

	List<ProductAllVO> filteredPdSearchList = pdSearchList;
	String priceRange = request.getParameter("priceRange");
	
	if(priceRange != null && !priceRange.isEmpty()){
		ProductUtil pdUtil = new ProductUtil();
		int minPrice = pdUtil.minPrice(priceRange);
		int maxPrice = pdUtil.maxPrice(priceRange);
		
		filteredPdSearchList = productAllService.filterByPrice(pdSearchList, minPrice, maxPrice);
	}
	
%>

<section class = "product spad">
	<div class = "container">
		<div>
			<h3>가격</h3>
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>&priceRange=1">
					~1,000원
				</a> | 
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>&priceRange=2">
					1,000원 ~ 5,000원
				</a> | 
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>&priceRange=3">
					5,000원 ~ 10,000원
				</a> | 
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>&priceRange=4">
					10,000원 ~ 50,000원
				</a> | 
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>&priceRange=5">
					50,000원 ~
				</a> | 
				<a href = "searchProducts.jsp?maincode=<%=maincode %>&name=<%=name %>">
					가격필터 제거
				</a>
		</div>
		
		<div class = "col-lg-9 col-md-7">
			<%if(filteredPdSearchList == null || filteredPdSearchList.isEmpty()) {%>
				<div class = "pdList">
					조건에 맞는 상품이 없습니다
				</div>
			<%} else {
				for(ProductAllVO forVo : filteredPdSearchList){%>
					<div class = "pdList">
						
						<div class = "searchImage">
							<img src = "<%=request.getContextPath() %>/img/<%=forVo.getImage() %>"
							 target = "<%=request.getContextPath() %>/shop-details.jsp?pdcode=<%=forVo.getPdcode() %>">
						</div>
						<div class = "searchDescription">
							<span>
								<a href = "<%=request.getContextPath() %>/shop-details.jsp?pdcode=<%=forVo.getPdcode() %>">
								<%=forVo.getPdname() %> | ₩<%=forVo.getPrice() %>
								</a>
							</span>
							<br>
							<span>카테고리 : <%=forVo.getMainname() + "-" + forVo.getSubproduct_name() %></span>
						</div>
						
					</div>
				<%}
			}%>
		</div>
	</div>
</section>


<%@ include file="../include/bottom.jsp"%>