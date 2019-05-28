<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detail</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src='<c:url value="/resources/img/fashion/abstrakt-banners.jpg" />' alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>${currSanPham.getDanhmucsanpham().getTenDanhMuc() }</h2>
				</div>
			</div>
		</div>
	</section>

	<section id="aa-product-details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-product-details-area">
						<div class="aa-product-details-content">
							<div class="row">
								<!-- Modal view slider -->
								<div class="col-md-5 col-sm-5 col-xs-12">
									<div class="aa-product-view-slider">
										<div id="demo-1" class="simpleLens-gallery-container">
											<div class="simpleLens-container">
												<div class="simpleLens-big-image-container">
													<a data-lens-image='<c:url value="/resources/img/product/${currSanPham.getHinhAnh() }" />' class="simpleLens-lens-image">
													<img src='<c:url value="/resources/img/product/${currSanPham.getHinhAnh() }" />' class="simpleLens-big-image"></a>
												</div>
											</div>
										</div>
									</div>
									<a href='<c:url value="/product/1" />' class="aa-add-to-cart-btn btn-warning" style="padding: 20px; padding-bottom: 20px; margin-top: 40px; margin-bottom: 40px">
										<b style="color: white;">
											<span class="fa fa-long-arrow-left"></span>
											Tiếp tục mua sắm
										</b>
										
									</a>
								</div>
								<!-- Modal view content -->
								<div class="col-md-7 col-sm-7 col-xs-12">
									<div class="aa-product-view-content">
										<h3><b>${currSanPham.getTenSanPham() }</b></h3>
										<div class="aa-price-block">
											<span class="aa-product-view-price" style="color: red;"><b>$ ${currSanPham.getGiaTien() }</b></span>
											<p class="aa-product-avilability">Avilability:
												<c:if test="${soluong < 1 }">
													<span>Out stock(hết hàng)</span>
												</c:if>
												<c:if test="${soluong > 0 }">
													<span>In stock</span>
												</c:if>
											</p>
										</div>
										<p>${currSanPham.getMoTa() }</p>

<!-- 										<h4>Size</h4> -->
<!-- 										<div class="aa-prod-view-size"> -->
<!-- 											<a href="#">S</a> <a href="#">M</a> <a href="#">L</a> -->
<!-- 											<a href="#">XL</a> -->
<!-- 										</div> -->
<!-- 										<h4>Color</h4> -->
<!-- 										<div class="aa-color-tag"> -->
<!-- 											<a href="#" class="aa-color-green"></a> -->
<!-- 											<a href="#" class="aa-color-yellow"></a> -->
<!-- 											<a href="#" class="aa-color-pink"></a> -->
<!-- 											<a href="#" class="aa-color-black"></a> -->
<!-- 											<a href="#" class="aa-color-white"></a> -->
<!-- 										</div> -->
<!-- 										<div class="aa-prod-quantity"> -->
<!-- 											<form action=""> -->
<!-- 												<select id="" name=""> -->
<!-- 													<option selected="1" value="0">1</option> -->
<!-- 													<option value="1">2</option> -->
<!-- 													<option value="2">3</option> -->
<!-- 													<option value="3">4</option> -->
<!-- 													<option value="4">5</option> -->
<!-- 													<option value="5">6</option> -->
<!-- 												</select> -->
<!-- 											</form> -->
<!-- 											<p class="aa-prod-category"> -->
<!-- 												Category: <a href="#">Polo T-Shirt</a> -->
<!-- 											</p> -->
<!-- 										</div> -->

										<!-- danh sách chi tiết sản phẩm -->
										<div class="cart-view-table">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>Size</th>
														<th>Color</th>
														<th style="text-align: center;">Quantity</th>
														<th style="text-align: center;">Select</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="chitiet" items="${dsChiTiet }">
														<tr>
															<td>${chitiet.getSizesanpham().getSize() }</td>
															<td>${chitiet.getMausanpham().getMau() }</td>
															<td style="text-align: center;">${chitiet.getSoLuong() }</td>
															<td style="text-align: center;">
																<c:if test="${chitiet.getSoLuong() > 0 }">
																	<button data-machitiet="${chitiet.getIdChiTietSanPham() }" class="btnAddToCart aa-primary-btn" style="height: 30px; padding-bottom: 25px; padding-top: 5px;">ADD TO CART</button>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
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
