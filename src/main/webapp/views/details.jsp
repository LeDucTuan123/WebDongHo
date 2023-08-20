<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/jquery.min.js"></script>
<script src="../views/js/slick.min.js"></script>
<link rel="stylesheet" href="../views/css/slick.css">
<link rel="stylesheet" href="../views/css/slick-theme.css">
<link rel="stylesheet" href="../views/css/main.css">
<link rel="stylesheet" href="../views/css/details.css">
<script src="https://kit.fontawesome.com/5a854a2686.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<fmt:setLocale value="vi_VN" />
	<div class="container">
		<header class="row align-item">
			<div class="col-4 m-auto">
				<a href="/form/${link }" class="login"> <i class="fa-solid fa-user"></i> ${sign }
				</a>
				<span class="contact-number">
					Hotline <span>09335425686</span>
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
					<a href="/cart" class="header-cart-text">
						<i class="fa-solid fa-cart-shopping"></i>Giỏ hàng <span
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
		<div class="product">
			<div class="row">
				<div class="col-6">
					<div class="product-img-wrap">
						<img src="../views/image/product/${product.image }" width="100%"
							alt="">
					</div>
				</div>
				<div class="col-6">
					<div class="product-content">
						<h1 class="product-content-name">${product.name }</h1>
						<p class="product-content-price">
							<span class="new"> <fmt:formatNumber
									value="${product.price - product.price * product.discount / 100 }"
									type="currency" />
							</span> <span class="old"> <fmt:formatNumber
									value="${product.price }" />
							</span>
						</p>
						<p class="product-content-detail">Đo nhịp tim, Tính lượng
							Calories tiêu thụ, Đếm số bước chân, Tính quãng đường chạy, Chế
							độ luyện tập, Phát hiện té ngã, Báo thức, Nghe nhạc với tai nghe
							Bluetooth, Gọi điện trên đồng hồ, Từ chối cuộc gọi, Dự báo thời
							tiết, La bàn, Điều khiển chơi nhạc, Thay mặt đồng hồ</p>
						<div class="product-content-qty">
							<p>Số lượng</p>
							<form action="/cart/${product.id }" medthod="post">
								<div class="input-group mb-3" style="width: 150px;">
									<div class="input-group-prepend">
										<button class="btn btn-outline-secondary" onclick="decrease()"
											type="button" id="button-addon1">
											<i class="fa-solid fa-circle-minus"></i>
										</button>
									</div>
									<input type="number" name="qty" class="form-control text-center"
										id="qty-input" placeholder="" value="1"
										aria-label="Example text with button addon"
										aria-describedby="button-addon1"
										style="color: #f61900; font-weight: 700;">
									<div class="input-group-prepend">
										<button class="btn btn-outline-secondary" onclick="increase()"
											type="button" id="button-addon1">
											<i class="fa-solid fa-circle-plus"></i>
										</button>
									</div>
								</div>
								<button class="qty-btn">
									<i class="fa-solid fa-basket-shopping"></i> Cho vào giỏ hàng
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detail-product">
			<h1 class="detail-product-heading">Thông tin chi tiết</h1>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th scope="row">Tên sản phẩm</th>
						<td>${product.name }</td>
					</tr>
					<tr>
						<th scope="row">Hãng sản xuất</th>
						<td>${product.category.name }</td>
					</tr>
					<tr>
						<th scope="row">màn hình</th>
						<td>Retina</td>
					</tr>
					<tr>
						<th scope="row">Màu sắc</th>
						<td>Màu hồng</td>
					</tr>
					<tr>
						<th scope="row">Thời lượng pin</th>
						<td>Sử dụng đến 18h</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="another-product">
			<h1 class="detail-product-heading">Sản phẩm liên quan</h1>
			<div class="row another-product-list">
				<c:forEach var="item" items="${products.content }">
					<div class="col-3 another-product-item">
						<div class="product-item">
							<a href="/details/${item.id }" class="product-item-link"></a>
							<div class="product-img">
								<img src="../views/image/product/${item.image }" alt="">
							</div>
							<div class="product-content text-center">
								<p class="product-name">${item.name }</p>
								<div class="product-price">
									<fmt:formatNumber type="currency" value="${item.price }" />
								</div>
							</div>
							<div class="product-icon">
								<a href="/details/${item.id }" class="text-center"> <i
									class="fa-solid fa-magnifying-glass-plus"></i>
								</a> <a href="" class="text-center"> <i
									class="fa-solid fa-basket-shopping"></i>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div
				class="row footer-content justify-content-between align-item-center">
				<div class="col-4 m-auto">
					<div class="footer-nav">
						<h3>Thông tin cửa hàng</h3>
						<ul class="footer-list">
							<li class="footer-item">Tự soạn thảo 1</li>
							<li class="footer-item">Tự soạn thảo 1</li>
							<li class="footer-item">Tự soạn thảo 1</li>
						</ul>
					</div>
				</div>
				<div class="col-4 m-auto">
					<div class="footer-nav">
						<h3>Delta Watch</h3>
						<ul class="footer-list">
							<li class="footer-item">Địa chỉ: Quận Tân Bình, HCM</li>
							<li class="footer-item">Điện thoại: 09XXXXXXXX</li>
							<li class="footer-item">Email: donghoDW@fpt.edu.vn</li>
						</ul>
					</div>
				</div>
				<div class="col-4 m-auto">
					<div class="footer-nav">
						<h3>Theo dõi chúng tôi</h3>
						<iframe
							src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fcongtywebvua%2F&tabs&width=340&height=130&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=1601131973565308"
							width="340" height="130" style="border: none; overflow: hidden"
							scrolling="no" frameborder="0" allowfullscreen="true"
							allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-end">
			<div class="container">
				<div class="row">
					<div class="col">
						<p class="d-flex m-auto p-3">
							Copyright &copy 2019 <span style="color: #05c3ff;">Delta
								Watch</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script>
		let qty = document.getElementById("qty-input");
		function increase() {
			let qtyValue = qty.value;
			qtyValue++;
			qty.value = qtyValue;
		}

		function decrease() {
			let qtyValue = document.getElementById("qty-input").value;
			if (qtyValue > 1) {
				qtyValue--;
				qty.value = qtyValue;
			}

		}
		$('.another-product-list').slick({
			slidesToShow : 5,
			slidesToScroll : 1,
			autoplay : true,
			autoplaySpeed : 2000,
			adaptiveHeight : true,
			arrows : true,
			Infinity : true
		});
	</script>
</body>

</html>