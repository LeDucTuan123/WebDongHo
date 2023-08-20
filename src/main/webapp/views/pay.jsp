<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/jquery.min.js"></script>
<link rel="stylesheet" href="../views/css/main.css">
<link rel="stylesheet" href="../views/css/thanhtoan.css">
<script src="https://kit.fontawesome.com/5a854a2686.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<fmt:setLocale value="vi_VN" />
	<div class="container">
		<header class="row align-item">
			<div class="col-4 m-auto">
				<a href="/form/${link }" class="login"> <i
					class="fa-solid fa-user"></i> ${sign }
				</a> <span class="contact-number"> Hotline <span>09335425686</span>
				</span>
			</div>
			<div class="col-3 text-center">
				<img src="../views/image/logo.png" class="logo" alt="">
			</div>
			<div class="col-5 d-flex align-items-center justify-content-end">

				<div class="header-search">
					<p class="header-search-text">
						<i class="fa-solid fa-magnifying-glass"></i>Tìm kiếm
					</p>
					<form action="" class="header-search-form">
						<div class="input-group mb-3" style="width: 250px">
							<input type="text" class="form-control" placeholder="Tìm kiếm"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="button-addon2">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</div>
					</form>
				</div>

				<div class="header-cart">
					<a href="/cart" class="header-cart-text"> <i
						class="fa-solid fa-cart-shopping"></i>Giỏ hàng <span
						class="header-cart-qty">(${count })</span>
					</a>
				</div>
			</div>
		</header>
		<nav>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<ul class="nav-list">
						<li class="nav-item"><a href="/" class="nav-link">Trang
								chủ</a></li>
						<li class="nav-item"><a href="" class="nav-link">Sản phẩm
								<i class="fa-solid fa-chevron-down"></i>
						</a>
							<ul class="subnav-list">
								<li class="subnav-item"><a href="" class="subnav-link">Xiaomi
										Watch</a></li>
								<li class="subnav-item"><a href="" class="subnav-link">Apple
										Watch</a></li>
							</ul></li>
						<li class="nav-item"><a href="" class="nav-link">Tin tức</a></li>
						<li class="nav-item"><a href="" class="nav-link">Liên hệ</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<div class="form">
					<p class="form-heading"></p>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title form-heading">Thông tin người mua</h5>
							<form action="/success" method="post">
								<div class="row form-controll">
									<div class="col">
										<label for="" class="form-label">Họ và tên</label> <input
											type="text" class="form-control" name="fullname" value="${user.fullname }" placeholder="Họ và tên">
									</div>
								</div>
								<div class="row form-controll">
									<div class="col">
										<label for="" class="form-label">Email</label> <input
											type="email" name="email" value="${user.email }" class="form-control" placeholder="Email">
									</div>
									<div class="col">
										<label for="" class="form-label">Số điện thoại</label> <input
											type="text" name="phone" class="form-control" placeholder="Số điện thoại">
									</div>
								</div>
								<div class="row form-controll">
									<div class="col">
										<label for="" class="form-label">Địa chỉ</label> <input
											type="text" name="address" class="form-control" placeholder="Địa chỉ">
									</div>
								</div>
								<div class="row form-controll">
									<div class="col">
										<button class="btn btn-primary" style="margin-right: 4px;">Xác
											nhận thanh toán</button>
										<a href="/cart" class="btn btn-warning">Hủy thanh toán</a>
									</div>

								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="form">
					<p class="form-heading"></p>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title form-heading">Hóa đơn</h5>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">Sản phẩm</th>
										<th scope="col">Tổng tiền</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="item" items="${items }">
									<tr>
										<td>${item.product.name } (${item.quantity })</td>
										<td> <fmt:formatNumber type="currency" value="${item.product.price }" /> </td>
									</tr>
								</c:forEach>
									<tr>
										<th>Tạm tính</th>
										<th> <fmt:formatNumber type="currency" value="${oldSum }" /> </th>
									</tr>
									<tr>
										<th>Khuyến mãi</th>
										<th><fmt:formatNumber type="currency" value="${discount }" /></th>
									</tr>
									<tr>
										<th>Tổng</th>
										<th><fmt:formatNumber type="currency" value="${newSum }" /></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>