<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Product</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src='<c:url value="/resources/img/fashion/abstrakt-banners.jpg" />' alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>${tendanhmuc }</h2>
					<ol class="breadcrumb">
						<li><a href='<c:url value="/" />'>Home</a></li>
						<li class="active">${tendanhmuc }</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!-- product category -->
	<section id="aa-product-category">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
					<div class="aa-product-catg-content">
						<div class="aa-product-catg-head">
							<div class="aa-product-catg-head-left">
								<form action="" class="aa-sort-form">
									<label for="">Sort by</label> <select name="">
										<option value="1" selected="selected">Default</option>
										<option value="2">Name</option>
										<option value="3">Price</option>
									</select>
								</form>
							</div>
						</div>
						<div class="aa-product-catg-body">
							<ul class="aa-product-catg">
								<c:forEach var="sp" items="${dsSanPham }">
									<li>
										<figure>
											<a class="aa-product-img" href='<c:url value="/product-detail/${sp.getIdSanPham() }" />'>
												<img src='<c:url value="/resources/img/product/${sp.getHinhAnh() }" />' style="width: 250px; height: 300px;">
											</a>
											<a class="aa-add-card-btn" href='<c:url value="/product-detail/${sp.getIdSanPham() }" />'><span
												class="fa fa-shopping-cart"></span>Add To Cart</a>
											<figcaption>
												<h4 class="aa-product-title">
													<a href="#">${sp.getTenSanPham() }</a>
												</h4>
												<span class="aa-product-price">$ ${sp.getGiaTien() }</span>
												<p class="aa-product-descrip">${sp.getMoTa() }</p>
											</figcaption>
										</figure>
										<div class="aa-product-hvr-content">
											<a href='' data-toggle="tooltip" data-placement="top" title="Add to Wishlist">
												<span class="fa fa-heart-o"></span>
											</a>
											<a href='' data-toggle="tooltip" data-placement="top" title="Compare">
												<span class="fa fa-exchange"></span>
											</a>
											<a href='' data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal">
												<span class="fa fa-search"></span>
											</a>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="aa-product-catg-pagination">
							<nav>
								<ul class="pagination">
									<li><a href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
					<aside class="aa-sidebar">
						<!-- single sidebar -->
						<div class="aa-sidebar-widget">
							<h3>Category</h3>
							<ul class="aa-catg-nav">
								<c:forEach var="dm" items="${dsDanhMuc }">
									<li><a href='<c:url value="/product/${dm.getIdDanhMuc() }" />'>${dm.getTenDanhMuc() }</a></li>
								</c:forEach>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
