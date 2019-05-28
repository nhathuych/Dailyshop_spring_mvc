<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Register</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- catg header banner section -->
	<section id="aa-catg-head-banner">
		<img src='<c:url value="/resources/img/fashion/abstrakt-banners.jpg" />' alt="fashion img">
		<div class="aa-catg-head-banner-area">
			<div class="container">
				<div class="aa-catg-head-banner-content">
					<h2>Account Page</h2>
					<ol class="breadcrumb">
						<li><a href='<c:url value="/" />'>Home</a></li>
						<li class="active">Account</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<!-- Cart view section -->
	<section id="aa-myaccount">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-myaccount-area">
						<div class="row">
							<div class="col-md-6">
								<div class="aa-myaccount-login">
									<h4>Login</h4>
									<form action='<c:url value="/register" />' method="post" class="aa-login-form">
										<label for="">Email address<span>*</span></label>
										<input name="email_log" type="text" placeholder="Email">
										
										<label for="">Password<span>*</span></label>
										<input name="pass_log" type="password" placeholder="Password">
										
										<button name="btnLogin" type="submit" class="aa-browse-btn">Login</button>
										<br/><br/><br/><br/>
										<span style="color: red;">${msgLogin }</span>
									</form>
								</div>
							</div>
							<div class="col-md-6">
								<div class="aa-myaccount-register">
									<h4>Register</h4>
									<form action='<c:url value="/register" />' method="post" class="aa-login-form">
										<label for="name_reg">Full name:</label>
										<input id="name_reg" name="name_reg" type="text" placeholder="Full name">
										
										<label for="email_reg">Email<span>*:</span></label>
										<input id="email_reg" name="email_reg" type="text" placeholder="Email">
										
										<label for="pass_reg">Password<span>*:</span></label>
										<input id="pass_reg" name="pass_reg" type="password" placeholder="Password">
										
										<button name="btnRegister" type="submit" class="aa-browse-btn">Register</button>
										<br/><br/><br/><br/>
										<span style="color: red;">${msgRegister }</span>
									</form>
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
