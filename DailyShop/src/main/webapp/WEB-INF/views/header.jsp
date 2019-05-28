<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href='<c:url value="/resources/css/font-awesome.css" />' rel="stylesheet">
	<link href='<c:url value="/resources/css/bootstrap.css" />' rel="stylesheet">
	<link href='<c:url value="/resources/css/jquery.smartmenus.bootstrap.css" />' rel="stylesheet">
	<link href='<c:url value="/resources/css/jquery.simpleLens.css" />' type="text/css" rel="stylesheet">
	<link href='<c:url value="/resources/css/slick.css" />' type="text/css" rel="stylesheet">
	<link href='<c:url value="/resources/css/nouislider.css" />' type="text/css" rel="stylesheet">
	<link id="switcher" href='<c:url value="/resources/css/theme-color/default-theme.css" />' rel="stylesheet">
	<link href='<c:url value="/resources/css/sequence-theme.modern-slide-in.css" />' rel="stylesheet" media="all">
	<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
</head>
<body>

	<!-- Start header section -->
	<header id="aa-header">
		<!-- start header top  -->
		<div class="aa-header-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-top-area">
							<!-- start header top left -->
							<div class="aa-header-top-left">
								<!-- start language -->
								<div class="aa-language">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
										 aria-expanded="true">
											<img src='<c:url value="/resources/img/flag/english.jpg" />' alt="english flag">ENGLISH
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href=""><img src='<c:url value="/resources/img/flag/french.jpg" />' alt="">FRENCH</a></li>
											<li><a href=""><img src='<c:url value="/resources/img/flag/english.jpg" />' alt="">ENGLISH</a></li>
										</ul>
									</div>
								</div>
	
								<!-- start currency -->
								<div class="aa-currency">
									<div class="dropdown">
										<a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
										 aria-expanded="true">
											<i class="fa fa-usd"></i>USD
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
											<li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
											<li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
										</ul>
									</div>
								</div>
								<!-- start cellphone -->
								<div class="cellphone hidden-xs">
									<p><span class="fa fa-phone"></span>0935-033-682</p>
								</div>
							</div>
							<!-- / header top left -->
							<div class="aa-header-top-right">
								<ul class="aa-head-top-nav-right">
									<li><a href="">My Account</a></li>
									<li class="hidden-xs"><a href='<c:url value="/cart" />'>My Cart</a></li>
									<li class="hidden-xs"><a href='<c:url value="/checkout" />'>Checkout</a></li>
									<c:if test="${user == null }">
										<li><a href='<c:url value="/register" />'>Login</a></li>
									</c:if>
									<c:if test="${user != null }">
										<li><a href="">Chào <b style="color: red;">${user.firstName() }</b></a></li>
										<li><a href='<c:url value="/register/dang-xuat" />'>[Log out]</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- start header bottom  -->
		<div class="aa-header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="aa-header-bottom-area">
							<!-- logo  -->
							<div class="aa-logo">
								<!-- Text based logo -->
								<a href='<c:url value="/" />'>
									<span class="fa fa-shopping-cart"></span>
									<p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p>
								</a>
							</div>
							<!-- cart box -->
							<div class="aa-cartbox">
								<a class="aa-cart-link" href='<c:url value="/cart" />'>
									<span class="fa fa-shopping-basket"></span>
									<span class="aa-cart-title">SHOPPING CART</span>
									<span id="soluong-giohang" class="aa-cart-notify">${giohang != null ? giohang.size() : 0 }</span>
								</a>
							</div>
							<!-- search box -->
							<div class="aa-search-box">
								<form action='<c:url value="/product" />' method="post">
									<input type="text" name="txtSearch" id="" placeholder="Search here ex. 'man' ">
									<button type="submit"><span class="fa fa-search"></span></button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- menu -->
	<section id="menu">
		<div class="container">
			<div class="menu-area">
				<!-- Navbar -->
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div id="danhmucsp" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
