<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
<title>Daily Shop | 404</title>
</head>
<body>

	<jsp:include page="header.jsp" />

	<section id="aa-error" style="margin-bottom: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-error-area">
						<h2>404</h2>
						<span>Sorry! Page Not Found</span>
						<p>No Message.</p>
						<a href='<c:url value="/" />'> Go to Homepage</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />

</body>
</html>
