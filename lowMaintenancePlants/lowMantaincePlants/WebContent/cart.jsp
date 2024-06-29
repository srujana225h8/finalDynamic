<%@page import="lowMantaincePlantsPackage.LowMaintainancePlantDbCon"%>
<%@page import="lowMantaincePlantsPackage.LowMaintainancePlantProductsDAO"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDAO pDao = new ProductDAO(LowMaintainancePlantDbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>
</head>
<body>
	<%@include file="/includes/header.jsp"%>

	<div class="container">
		<div class="total-price">
			<h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3>
			<div class="checkout-button">
				<a class="btn-checkout" href="cart-check-out">Check Out</a>
			</div> 
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="quantity-control">
								<a class="btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>">+</a> 
								<input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
								<a class="btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>">-</i></a>
							</div>
							<button type="submit" class="h-btn">
    						<a href="orders.jsp"><i class="fa-solid fa-heart fa-2x"></i></a>
							</button>
						</form>
					</td>
					<td class="btn-remove">
						<div class="r-btn">
							<a href="remove-from-cart?id=<%=c.getId() %>">Remove</a>
						</div>
					</td>
				</tr>

				<%
				}}%>
			</tbody>
		</table>
	</div>
</body>
</html>
