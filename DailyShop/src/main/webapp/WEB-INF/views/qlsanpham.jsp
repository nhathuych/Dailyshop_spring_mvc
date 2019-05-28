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
	<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet">
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
				<div class="dropdown" style="margin-bottom: 20px;">
					<button class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						${danhmuc.getTenDanhMuc() != null ? danhmuc.getTenDanhMuc() : "Chọn danh mục" }
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<c:forEach var="dm" items="${dsDanhMuc }">
							<a class="dropdown-item" href='<c:url value="/admin/qlsanpham/${dm.getIdDanhMuc() }" />'>${dm.getTenDanhMuc() }</a>
						</c:forEach>
					</div>
				</div>

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i>Data Table
					</div>
					<div class="card-body">
						<div class="table-responsive table-hover">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th></th>
										<th>tên sản phẩm</th>
										<th>Giá tiền</th>
										<th>Giới tính</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sp" items="${dsSanPham }">
										<tr>
											<td style="text-align: center;">
												<img style="height: 80px; width: 60px;" src='<c:url value="/resources/img/product/${sp.getHinhAnh() }" />'>
											</td>
											<td><span>${sp.getTenSanPham() }</span></td>
											<td><span>$ ${sp.getGiaTien() }</span></td>
											<td><span>${sp.getGioiTinh() }</span></td>
											<td style="text-align: center;">
												<button class="btnXoa_Row btn" data-idSanPham="${sp.getIdSanPham() }">
													<fa class="fas fa-trash-alt" aria-hidden="true"></fa>
												</button>
												<button class="btnCapNhat_Row btn" data-idSanPham-admin="${sp.getIdSanPham() }">
													<fa class="fas fa-pencil-alt"></fa>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2019</span>
					</div>
				</div>
			</footer>

			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<form action='<c:url value="/admin/qlsanpham" />' method="post">
							<div class="row">
								<div class="col-md-6">
									<h3 id="txtThemVaSua" style="text-align: center; margin-bottom: 50px;">Thêm sản phẩm</h3>
									<label for="masp"><b>Mã sản phẩm: </b></label>
									<input id="masp" name="masp" type="text" readonly class="form-control"> <br />
									
									<label for="tensp"><b>Tên sản phẩm</b></label> <br />
									<input id="tensp" name="tensp" type="text" class="form-control" placeholder="Tên sản phẩm"> <br />
									
									<label for="danhmucsp"><b>Danh mục sản phẩm</b></label> <br />
									<select id="danhmucsp" name="danhmucsp" class="form-control">
										<c:forEach var="dm" items="${dsDanhMuc }">
											<option value="${dm.getIdDanhMuc() }">${dm.getTenDanhMuc() }</option>
										</c:forEach>
									</select> <br>
									
									<label for="giasp"><b>Giá tiền</b></label> <br />
									<input id="giasp" name="giasp" type="number" class="form-control" min="0" value="0"> <br />
									
									<label><b>Giới tính</b></label> <br />
									<div>
										<input id="rdbMale" name="gioitinh" type="radio" value="male" checked="checked">male
										<input id="rdbFemale" name="gioitinh" type="radio" value="female">female
									</div>
									<br />
									
									<label for="mota"><b>Mô tả</b></label> <br />
									<textarea id="mota" name="mota" class="form-control" rows="5" placeholder="Mô tả ngắn gọn........"></textarea> <br />
									
									<label for="hinhsp"><b>Hình ảnh</b></label> <br />
									<input id="hinhsp" name="hinhsp" type="file" class="form-control"> <br />
								</div>
								
								<div id="container-chitietsanpham" class="col-md-6">
									<div class="chitietsanpham">
										<h3 style="text-align: center;">Chi tiết sản phẩm</h3> <br/>
										
										<span><b>Size</b></span> <br>
										<select id="size" name="size" class="form-control">
											<c:forEach var="sizesp" items="${dsSize }">
												<option value="${sizesp != null ? sizesp.getIdSize() : 0 }">${sizesp.getSize() }</option>
											</c:forEach>
										</select> <br>
										
										<span><b>Màu sắc</b></span> <br>
										<select id="mau" name="mau" class="form-control">
											<c:forEach var="mau" items="${dsMau }">
												<option value="${mau != null ? mau.getIdMau() : 0 }">${mau.getMau() }</option>
											</c:forEach>
										</select> <br>
										
										<label for="soluong"><b>Số lượng</b></label> <br>
										<input min="1" id="soluong" name="soluong" type="number" class="form-control" placeholder="Nhập số lượng" value="1"> <br>
										
										<button class="btn btn-primary btn-themchitiet">Thêm chi tiết</button>
									</div>
								</div>
								
								<!-- clone 1 thẻ div -->
								<div id="chitietsanpham" class="chitietsanpham">
									<span><b>Size</b></span> <br>
									<select id="size" name="size" class="form-control">
										<c:forEach var="sizesp" items="${dsSize }">
											<option value="${sizesp.getIdSize() }">${sizesp.getSize() }</option>
										</c:forEach>
									</select> <br>
									
									<span><b>Màu sắc</b></span> <br>
									<select id="mau" name="mau" class="form-control">
										<c:forEach var="mau" items="${dsMau }">
											<option value="${mau.getIdMau() }">${mau.getMau() }</option>
										</c:forEach>
									</select> <br>
									
									<label for="soluong"><b>Số lượng</b></label> <br>
									<input min="1" id="soluong" name="soluong" type="number" class="form-control" placeholder="Nhập số lượng" value="1">
									<br>
									<button class="btn btn-primary btn-themchitiet">Thêm chi tiết</button>
								</div>
								
								<!-- submit -->
								<div class="col-md-6">
									<input id="btnThemSanPham" name="btnThemSanPham" type="submit" class="btn btn-success" value="Thêm mới">
									<input id="btnCapNhatSanPham" name="btnCapNhatSanPham" type="submit" class="hidden btn btn-success" value="Cập nhật">
									<input id="btnThoatCapNhat" name="btnThoatCapNhat" class="hidden btn btn-success" style="float: right;" type="submit" value="Thoát cập nhật">
									<br />
									<div style="color: red; margin-top: 10px;"><span>${msgThemSanPham }</span></div>
								</div>
							</div>
						</form>
					</div>
					
				</div>
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

	<script src='<c:url value="/resources/js/jquery-3.3.1.min.js" />'></script>
	<script src='<c:url value="/resources/js/custom.js" />'></script>

	<!-- script src='<c:url value="/resources/bootstrap4/vendor/jquery/jquery.min.js" />'></script -->
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
