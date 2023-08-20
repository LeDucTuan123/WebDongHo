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
<script src="../views/js/jquery.min.js"></script>
<script src="../views/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../views/css/main.css">
<link rel="stylesheet" href="../views/css/cart.css">
<script src="https://kit.fontawesome.com/5a854a2686.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<fmt:setLocale value="vi_VN" />
	<div class="container">
		<header class="row align-item">
			<div class="col-4 m-auto">
				<c:if test="${sessionScope.user == null }">
					<a href="/form/${link}" class="login"> <i
						class="fa-solid fa-user"></i> ${sign }
					</a>
				</c:if>
				<c:if test="${sessionScope.user != null }">
					<span class="login"> <i class="fa-solid fa-user"></i> Tài
						khoản <i class="fa-solid fa-chevron-down"></i>
						<ul class="subnav-login">
							<li class="subnav-login-item"><a href="/hoadon"
								class="subnav-login-link">Hóa đơn</a></li>
							<c:if test="${sessionScope.user.admin }">
								<li class="subnav-login-item"><a href="/admin/index"
									class="subnav-login-link">Trang quản trị</a></li>
							</c:if>
							<li class="subnav-login-item"><a href="/form/${link }"
								class="subnav-login-link">${sign }</a></li>
						</ul>
					</span>
				</c:if>

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
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Mã đơn hàng</th>
						<th scope="col">Ngày đặt</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
						<th scope="col">Hoạt động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${items }">
						<tr>
							<th scope="row">${item.id }</th>
							<td>${item.createdate }</td>
							<td><fmt:formatNumber value="${item.price }" type="currency" />
							</td>
							<c:if test="${!item.status }">
								<td>Đang chờ</td>
							</c:if>
							<c:if test="${item.status }">
								<td>Đã giao</td>
							</c:if>
							<td>
								<a href="/hoadonchitiet/${item.id }" class="btn btn-primary"
									style="margin-right: 4px;">Hóa đơn</a>

							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>