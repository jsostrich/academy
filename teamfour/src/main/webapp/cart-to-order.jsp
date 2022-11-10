<%@page import="com.teamfour.cart.model.CartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "include/subtop2.jsp" %>
<jsp:useBean id="cartService" class="com.teamfour.cart.model.CartService"
	scope="session"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	
	List<CartVO> orderList = (List<CartVO>)request.getAttribute("orderList");
	// 카트 내에서 변경된 수량에 따라 변경된 qty와 totalPrice를 반영한 새로운 리스트를 받아온다
	
	request.setAttribute("list", orderList);
	// 처리 페이지로 넘기기
%>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#Order').click(function(){
			if(confirm("주문하시겠습니까?")){
				location.href="orderProducts.jsp";
			}
		});
	});
</script>

<section>
	<table>
		<thead>
			<tr>
				<th class="shoping__product">Products</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Total</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<%for(CartVO forVo : orderList) {%>
				<tr>
					<td class="shoping__cart__item"><img class="session_data"
						src="img/<%=forVo.getImage()%>" alt="">
						<h5 class="session_data"><%=forVo.getPdName()%></h5>
					</td>
					<td class="shoping__cart__price session_data">
						<%=forVo.getPrice()%>
					</td>
					<td class="shoping__cart__quantity">
						<div class="quantity">
							<div class="pro-qty">
								<%=forVo.getQty()%>
								<input type="hidden" value="<%=forVo.getQty()%>" class="session_data">
							</div>
						</div>
					</td>
					<td class="shoping__cart__total"><%=forVo.getTotalprice()%>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<a href = "#" id = "Order">주문하기</a>
</section>


<%@ include file="../include/bottom.jsp"%>