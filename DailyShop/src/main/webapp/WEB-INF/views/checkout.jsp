<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Checkout</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<section id="aa-catg-head-banner">
		<img src='<c:url value="/resources/img/fashion/abstrakt-banners.jpg" />' alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>Checkout Page</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li class="active">Checkout</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart view section -->
	<section id="checkout">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="checkout-area">
						<form action='<c:url value="/checkout" />' method="post">
							<div class="row">
								<div class="col-md-6">
									<div class="checkout-left">
										<div class="panel-group" id="accordion">
											<!-- Shippping Address -->
											<div class="panel panel-default aa-checkout-billaddress">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordion" href="">Shippping Address</a>
													</h4>
												</div>
												<div class="panel-collapse">
													<div class="panel-body">
														<div class="row">
															<div class="col-md-12">
																<div class="aa-checkout-single-bill">
																	<label for="fullname">Full Name:</label>
																	<input id="fullname" name="fullname" type="text" value="${user.getHoTen() }" placeholder="Your Name">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="aa-checkout-single-bill">
																	<label for="phone">Phone Number:</label>
																	<input id="phone" name="phone" type="tel" placeholder="Your Phone Number">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="aa-checkout-single-bill">
																	<label for="address">Address:</label>
																	<input id="address" name="address" type="text" placeholder="Your Address">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="aa-checkout-single-bill">
																	<label for="ghichu">Note:</label>
																	<textarea id="ghichu" name="ghichu" rows="3" placeholder="Note...."></textarea>
																</div>
															</div>
														</div>
														<input name="btnOrder" type="submit" value="Place Order" class="aa-browse-btn col-md-12">
														<span style="color: red;">${msgOrder }</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-right">
										<h5 style="color: red;"><b>${msgGioHang }</b></h5>
										<h4>Order Summary</h4>
										<div class="aa-order-summary-area">
											<table class="table table-responsive">
												<thead>
													<tr>
														<th>Image</th>
														<th>Product</th>
														<th>Total</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="sp" items="${giohang }">
														<tr>
															<td>
																<img alt="product" src='<c:url value="/resources/img/product/${sp.getHinhAnh() }" />' style="height: 60px; width: 55px;">
															</td>
															<td>
																<b style="color: red;">${sp.getTenSanPham() }</b>
																<strong> x ${sp.getSoLuong() }</strong>
															</td>
															<td>$ ${sp.getGiaTien() * sp.getSoLuong() }</td>
														</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th></th>
														<th>Total</th>
														<td>$ ${total }</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
