<%@page import="java.text.DecimalFormat"%>
<%@page import="model.*"%>
<%@page import="lowMantaincePlantsPackage.LowMaintainancePlantDbCon"%>
<%@page import="lowMantaincePlantsPackage.LowMaintainancePlantProductsDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(LowMaintainancePlantDbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
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
		<div class="card-header my-3">
    		<h2 style="font-family: 'Playfair Display', cursive; font-weight: bold; color: #333; text-align: center;">
        <span style="color:  #048011">Your Wishlist</span>
    		</h2>
		</div>
		
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Back to Cart</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td class="text-center"><a class="btn btn-sm btn-primary" href="add-to-cart?id=<%=o.getId()%>">Add to
								Cart</a></td>
						<td class="text-center"><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Remove</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
</body>
</html>