<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Daily Shop</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- Start slider -->
	<div class="container">
		<section id="aa-slider">
			<div class="aa-slider-area">
				<div id="sequence" class="seq">
					<div class="seq-screen">
						<img data-seq src='<c:url value="/resources/img/slider/amazon.jpg" />' alt="Men slide img" />
					</div>
					<!-- slider navigation btn -->
					<fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
						<a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
						<a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
					</fieldset>
				</div>
			</div>
		</section>
	</div>
	<!-- / slider -->
	<!-- Products section -->
	<section id="aa-product">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="aa-product-area">
							<div class="aa-product-inner">
								<!-- start prduct navigation -->
								<ul class="nav nav-tabs aa-products-tab">
									<li class="active"><a href="#men" data-toggle="tab">Sản phẩm hot nhất</a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<!-- Start men product category -->
									<div class="tab-pane fade in active" id="men">
										<ul class="aa-product-catg">
											<c:forEach var="sp" items="${dsSanPham }">
												<!-- start single product item -->
												<li>
													<figure>
														<a class="aa-product-img" href='<c:url value="/product-detail/${sp.getIdSanPham() }" />'>
															<img src='<c:url value="/resources/img/product/${sp.getHinhAnh() }" />' style="width250px; height: 300px;">
														</a>
														<a class="aa-add-card-btn" href='<c:url value="/product-detail/${sp.getIdSanPham() }" />'><span class="fa fa-shopping-cart"></span>Add To Cart</a>
														<figcaption>
															<h4 class="aa-product-title"><a href="#">${sp.getTenSanPham() }</a></h4>
															<span class="aa-product-price">$ ${sp.getGiaTien() }</span>
														</figcaption>
													</figure>
													<div class="aa-product-hvr-content">
														<a href='' data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
														<a href='' data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
														<a href='' data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal">
														<span class="fa fa-search"></span></a>
													</div>
												</li>
											</c:forEach>
										</ul>
										<a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
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
