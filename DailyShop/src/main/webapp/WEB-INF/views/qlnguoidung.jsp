<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Quản lý sản phẩm</title>

	<link href='<c:url value="/resources/bootstrap4/vendor/fontawesome-free/css/all.min.css" />' rel="stylesheet" type="text/css">
	<link href='<c:url value="/resources/bootstrap4/vendor/datatables/dataTables.bootstrap4.css" />' rel="stylesheet">
	<link href='<c:url value="/resources/bootstrap4/css/sb-admin.css" />' rel="stylesheet">
</head>
<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand mr-1" href="">Start Bootstrap</a>
		<button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1">
				<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-bell fa-fw"></i>
					<span class="badge badge-danger">9+</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1">
				<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-envelope fa-fw"></i>
				<span class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a>
					<a class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-user-circle fa-fw"></i>
				</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a>
					<a class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
				</div>
			</li>
		</ul>
	</nav>

	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href='<c:url value="/admin" />'>
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href='<c:url value="/admin/qlsanpham" />'>
					<i class="fas fa-fw fa-folder"></i> <span>Sản phẩm</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href='<c:url value="/admin/qlhoadon" />'>
					<i class="fas fa-fw fa-chart-area"></i> <span>Hóa đơn</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href='<c:url value="/admin/user" />'>
					<i class="fas fa-fw fa-table"></i> <span>Người dùng</span>
				</a>
			</li>
		</ul>

		<div id="content-wrapper">
			<div class="container-fluid">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>User Name</th>
							<th>Role</th>
							<th>Email</th>
							<th>Password</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${dsUser }">
							<tr>
								<td>${user.getHoTen() }</td>
								<td>${user.getChucvu().getTenChucVu() }</td>
								<td>${user.getEmail() }</td>
								<td>${user.getPassword() }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src='<c:url value="/resources/js/custom.js" />'></script>

	<script src='<c:url value="/resources/bootstrap4/vendor/jquery/jquery.min.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/vendor/bootstrap/js/bootstrap.bundle.min.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/vendor/jquery-easing/jquery.easing.min.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/vendor/chart.js/Chart.min.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/vendor/datatables/jquery.dataTables.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/vendor/datatables/dataTables.bootstrap4.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/js/sb-admin.min.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/js/demo/datatables-demo.js" />'></script>
	<script src='<c:url value="/resources/bootstrap4/js/demo/chart-area-demo.js" />'></script>

</body>
</html>
