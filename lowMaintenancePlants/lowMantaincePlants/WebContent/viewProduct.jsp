		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="lowMantaincePlantsPackage.LowMaintainancePlantProductsDAO"%>
<%@ page import="lowMantaincePlantsPackage.LowMaintainancePlantDbCon"%>
<%@ page import="lowMantaincePlantsPackage.*"%>
<%@ page import="model.*"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
	// Retrieve the product ID from the request
	LowMaintainancePlantProductsDAO pd = new LowMaintainancePlantProductsDAO(LowMaintainancePlantDbCon.getConnection());
	String productIdStr = request.getParameter("id");

	int productId = -1; // Default value if ID is not provided

	if (productIdStr != null) {
		try {
			productId = Integer.parseInt(productIdStr);
		} catch (NumberFormatException e) {
			// Handle invalid number format
			out.println("Invalid product ID.");
		}
	}
	

	// Initialize variables
	LowMaintainancePlantProducts product = null;
	Description description = null;

	// Fetch product details
	if (productId != -1) {
		product = pd.getHangingPlantProductsById(productId);
		description = pd.getHangingPlantsDescriptionById(productId);
	}
%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/includes/head.jsp"%>
<title><%=(product != null) ? product.getPname() : "Product Not Found"%></title>
<style>
button.btn a {
    color: inherit; /* Use the button's text color */
    text-decoration: none; /* Remove underline */
}

button.btn a:hover {
    color: inherit; /* Prevent color change on hover */
    text-decoration: none; /* Ensure no underline on hover */
}

.buttons-descr .h-btn a i {
    font-size: 2.5rem; /* Increase the size of the icon */
}



</style>
</head>


<body>
	<%@ include file="/includes/header.jsp"%>
	<ul class="breadcrumb">
		<li><a href="index.jsp">Home > </a></li>
		<li><a href="hangingPlantsProductList.jsp"><%=product.getPname()%> >
		</a></li>
		<li><%=(product != null) ? product.getPname() : "Product Not Found"%></li>
	</ul>

	<div class="container-descr">
		<div class="row">
			
			<%
				if (product != null && description != null) {
			%>
			<div class="product-detail-descr">
				<div class="product-image-descr">
					<img src="lowMaintenancePlantImages/<%=product.getImage()%>"
						alt="<%=product.getPname()%>">
				</div>
				<div class="product-info-descr">
					<h1><%=product.getPname()%></h1>
					<div class="rating-descr">
						<i class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star-half"
							aria-hidden="true"></i> <i class="fa fa-star-o"
							aria-hidden="true"></i> <span>(4.5/5)</span>
					</div>
					<div class="prices-div-descr">
						<p class="prices-descr">
							<span><del>
									&#8377;<%=product.getOriginalprice()%></del></span> <span
								class="discount-price">&#8377;<%=product.getDiscountprice()%></span>
						</p>
					</div>
					<div class="product-description-descr">
						<p><%=description.getDescription()%></p>
					</div>
					
					<div class="buttons-descr">
						<form action="cart.jsp" method="post">
							<input type="hidden" name="id" value="<%=product.getId()%>">
							<button type="submit" class="btn btn-primary"><a href="add-to-cart?id=<%=product.getId()%>">Add to
								Cart</a></button>
						</form>
						<button type="submit" class="h-btn">
    						<a href="orders.jsp"><i class="fa-solid fa-heart fa-2x"></i></a>
							</button>
					</div>
				</div>
			</div>
			<%
					} else {
			%>
			<div class="no-product-descr">
				<h2>Product Not Found</h2>
				<p>Sorry, the product you are looking for is not available.</p>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>