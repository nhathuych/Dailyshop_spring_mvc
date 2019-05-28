<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Your Cart</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<section id="aa-catg-head-banner">
		<img src='<c:url value="/resources/img/fashion/abstrakt-banners.jpg" />' alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>Cart Page</h2>
					<ol class="breadcrumb">
						<li><a href='<c:url value="/" />'>Home</a></li>
						<li class="active">Cart</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart view section -->
	<section id="cart-view" style="margin-bottom: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="cart-view-area">
						<div class="cart-view-table">
							<form action='<c:url value="/cart" />' method="post">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th>Product</th>
												<th>Price</th>
												<th>Quantity</th>
												<th>Total</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="sp" items="${gioHangs }">
												<tr>
													<td><a href=""><img src='<c:url value="/resources/img/product/${sp.getHinhAnh() }" />' alt="img"></a></td>
													<td><a class="aa-cart-title" href="#">${sp.getTenSanPham() }</a></td>
													<td>$ ${sp.getGiaTien() }</td>
													<td><input name="soluongsp" class="aa-cart-quantity" type="number" min="1" value="${sp.getSoLuong() > 1 ? sp.getSoLuong() : 1 }"></td>
													<td>$ ${sp.getGiaTien() * sp.getSoLuong() }</td>
													<td>
														<a data-idChiTiet-Gio="${sp.getIdChiTietSanPham() }" class="btnXoaSpTrongGio remove"> <fa class="fa fa-close"></fa></a>
													</td>
												</tr>
											</c:forEach>
											<tr>
												<c:if test="${giohang != null }">
													<td colspan="6" class="aa-cart-view-bottom">
														<input id="btnUpdateCart" name="btnUpdateCart" class="aa-cart-view-btn" type="submit" value="Update Cart">
													</td>
												</c:if>
											</tr>
										</tbody>
									</table>
								</div>
							</form>
							<!-- Cart Total view -->
							<div class="cart-view-total">
								<form action='' method="post">
									<h4>Cart Totals</h4>
									<table class="aa-totals-table">
										<tbody>
											<tr>
												<th>Subtotal</th>
												<td>${total }</td>
											</tr>
											<tr>
												<th>Total</th>
												<td>${total }</td>
											</tr>
										</tbody>
									</table>
									<input name="btnCheckout" type="submit" class="aa-cart-view-btn form-control" style="margin-top: 20px; padding-bottom: 40px; padding-top: 20px;" value="Proced to Checkout">
									<span style="color: red;">${msgCheckout }</span>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
