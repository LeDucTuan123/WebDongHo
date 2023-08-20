<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/jquery.min.js"></script>
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
		<div class="cart">
			<h1 class="cart-heading">Giỏ hàng</h1>
			<table class="table">
				<tbody>
					<c:forEach var="item" items="${items }">
						<tr>
							<form action="/cart/update/${item.id }" method="post">
								<td><img src="../views/image/product/${item.product.image }"
									width="100px" alt=""></td>
								<td>
									<p class="cart-product-name">${item.product.name }</p>
									<p class="cart-product-price" style="color: red;"> <fmt:formatNumber value=" ${item.product.price -  (item.product.discount * item.product.price / 100) }" type="currency" /></p>
								</td>
								<td><input class="cart-input-qty" name="quantity" onblur="this.form.submit()" type="number" min="1"
									value="${item.quantity }"></td>
									<td><p class="cart-product-price" style="color: red;"><fmt:formatNumber value=" ${(item.product.price -  (item.product.discount * item.product.price / 100)) * item.quantity }" type="currency" /></p></td>
								<td><a href="/cart/delete/${item.id }" class="cart-product-remove">Xóa</a></td>
							</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="cart-sum-wrap">
				<p class="cart-sum">
					<span class="cart-sum-label">Tổng tiền</span> <span
						class="cart-sum-price" style="color: red; font-weight: 700;"> <fmt:formatNumber value="${sum }" type="currency" /> </span>
				</p>
			</div>
		</div>

	</div>

</body>

</html>