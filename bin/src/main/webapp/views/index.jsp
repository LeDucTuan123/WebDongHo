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
<script src="./views/js/jquery.min.js"></script>
<script src="./views/js/bootstrap.min.js"></script>
<script src="./views/js/slick.min.js"></script>
<link rel="stylesheet" href="./views/css/slick.css">
<link rel="stylesheet" href="./views/css/slick-theme.css">
<link rel="stylesheet" href="../views/css/main.css">
<script src="https://kit.fontawesome.com/5a854a2686.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<fmt:setLocale value="vi_VN" />
	<div class="container">
		<header class="row align-item">
			<div class="col-4 m-auto">
				<a href="/form/${link}" class="login"> <i class="fa-solid fa-user"></i> ${sign }
				</a>
				<span class="contact-number">
					Hotline <span>09335425686</span>
				</span>
			</div>
			<div class="col-3 text-center">
				<img src="./views/image/logo.png" class="logo" alt="">
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
	<div class="band">
		<img src="./views/image/band.jpg" height="450px" width="100%" alt="">
	</div>
	<div class="container">
		<div class="content">
			<div class="partner">
				<div class="partner-heading">
					<h1>Đối tác</h1>
					<span>Bộ sưu tập những thương hiệu nổi tiếng về smartwatch
						trên thế giới </span>
				</div>
				<div class="row partner-brand">
					<div class="col partner-brand-img">
						<img src="./views/image/aries.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/atlantic.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/diamon.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/epos.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/jac.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/qq.jpg" alt="">
					</div>
					<div class="col partner-brand-img">
						<img src="./views/image/aries.jpg" alt="">
					</div>
				</div>
			</div>
			<div class="product">
				<div class="partner-heading">
					<h1>Sản phẩm theo danh mục</h1>
					<span>Những sản phẩm nổi tiếng với chất lượng hàng đầu được
						shop nhập về phục vụ quý khách hàng </span>
				</div>
				<div class="product-brand">
					<div class="row justify-content-start">
						<c:forEach var="item" items="${categories }">
							<div class="col">
								<a href="/${item.id }" class="product-brand-link text-center"
									onclick="choose()"> <img
									src="./views/image/product/${item.image }" alt="">
									<p>${item.name }</p>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="product-list">
					<div class="row">
						<c:forEach var="item" items="${products }">
							<div class="col-3">
								<div class="product-item">
									<a href="details/${item.id }" class="product-item-link"></a>
									<div class="product-img">
										<img src="./views/image/product/${item.image }" alt="">
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
										</a> <a href="/cart/${item.id }" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="new-product">
			<div class="partner-heading">
				<h1>Sản phẩm mới</h1>
				<span>Những chiếc đồng hồ thể hiện đẳng cấp, thể thao dành
					cho phái mạnh </span>
			</div>
			<div class="new-product-content">
				<div class="row">
					<div class="col-8">
						<div class="row new-product-list">
							<c:forEach var="item" items="${newProducts }">
								<div class="col-4">
									<div class="product-item">
										<a href="details/${item.id }" class="product-item-link"></a>
										<div class="product-img">
											<img src="./views/image/product/${item.image }" alt="">
										</div>
										<div class="product-content text-center">
											<p class="product-name">${item.name }</p>
											<div class="product-price">
												<fmt:formatNumber value="${item.price }" type="currency" />
											</div>
										</div>
										<div class="product-icon">
											<a href="details/${item.id }" class="text-center"> <i
												class="fa-solid fa-magnifying-glass-plus"></i>
											</a> <a href="/cart/${item.id }" class="text-center"> <i
												class="fa-solid fa-basket-shopping"></i>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-4">
						<div class="new-product-img">
							<img src="./views/image/newProduct.jpg" height="303px" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="new-product">
			<div class="partner-heading">
				<h1>Sản phẩm bán chạy</h1>
				<span>Bộ sưu tập những sản phẩm sang chảnh, thông minh dành
					cho nữ giới </span>
			</div>
			<div class="new-product-content">
				<div class="row">
					<div class="col-4">
						<div class="new-product-img">
							<img src="./views/image/womenWatch.jpg" height="303px" alt="">
						</div>
					</div>
					<div class="col-8">
						<div class="row new-product-list">
							<div class="col-4">
								<div class="product-item">
									<div class="product-img">
										<img src="./views/image/product/applewatch1.jpg" alt="">
									</div>
									<div class="product-content text-center">
										<p class="product-name">Apple watch series 6</p>
										<div class="product-price">10,000,000đ</div>
									</div>
									<div class="product-icon">
										<a href="" class="text-center"> <i
											class="fa-solid fa-magnifying-glass-plus"></i>
										</a> <a href="" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="product-item">
									<div class="product-img">
										<img src="./views/image/product/applewatch1.jpg" alt="">
									</div>
									<div class="product-content text-center">
										<p class="product-name">Apple watch series 6</p>
										<div class="product-price">10,000,000đ</div>
									</div>
									<div class="product-icon">
										<a href="" class="text-center"> <i
											class="fa-solid fa-magnifying-glass-plus"></i>
										</a> <a href="" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="product-item">
									<div class="product-img">
										<img src="./views/image/product/applewatch1.jpg" alt="">
									</div>
									<div class="product-content text-center">
										<p class="product-name">Apple watch series 6</p>
										<div class="product-price">10,000,000đ</div>
									</div>
									<div class="product-icon">
										<a href="" class="text-center"> <i
											class="fa-solid fa-magnifying-glass-plus"></i>
										</a> <a href="" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="product-item">
									<div class="product-img">
										<img src="./views/image/product/applewatch1.jpg" alt="">
									</div>
									<div class="product-content text-center">
										<p class="product-name">Apple watch series 6</p>
										<div class="product-price">10,000,000đ</div>
									</div>
									<div class="product-icon">
										<a href="" class="text-center"> <i
											class="fa-solid fa-magnifying-glass-plus"></i>
										</a> <a href="" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="product-item">
									<div class="product-img">
										<img src="./views/image/product/applewatch1.jpg" alt="">
									</div>
									<div class="product-content text-center">
										<p class="product-name">Apple watch series 6</p>
										<div class="product-price">10,000,000đ</div>
									</div>
									<div class="product-icon">
										<a href="" class="text-center"> <i
											class="fa-solid fa-magnifying-glass-plus"></i>
										</a> <a href="" class="text-center"> <i
											class="fa-solid fa-basket-shopping"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="news">
			<div class="partner-heading">
				<h1>Tin tức</h1>
				<span>Chúng tôi sẵn sàng cập nhật những kiến thức, công nghệ
					mới nhất dành cho các bạn </span>
			</div>
			<div class="news-list">
				<div class="row">
					<div class="col-3">
						<a href="" class="news-item">
							<div class="news-item-img">
								<img src="./views/image/news/news1.jpg" width="100%" alt="">
							</div>
							<p class="news-item-text">Đồng hồ thông minh Apple Watch mới
								ra mắt</p>
						</a>
					</div>
					<div class="col-3">
						<a href="" class="news-item">
							<div class="news-item-img">
								<img src="./views/image/news/news1.jpg" width="100%" alt="">
							</div>
							<p class="news-item-text">Đồng hồ thông minh Apple Watch mới
								ra mắt</p>
						</a>
					</div>
					<div class="col-3">
						<a href="" class="news-item">
							<div class="news-item-img">
								<img src="./views/image/news/news1.jpg" width="100%" alt="">
							</div>
							<p class="news-item-text">Đồng hồ thông minh Apple Watch mới
								ra mắt</p>
						</a>
					</div>
					<div class="col-3">
						<a href="" class="news-item">
							<div class="news-item-img">
								<img src="./views/image/news/news1.jpg" width="100%" alt="">
							</div>
							<p class="news-item-text">Đồng hồ thông minh Apple Watch mới
								ra mắt</p>
						</a>
					</div>
				</div>
			</div>
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
		$('.partner-brand').slick({
			slidesToShow : 6,
			slidesToScroll : 2,
			autoplay : true,
			autoplaySpeed : 2000,
			adaptiveHeight : true,
			arrows : true
		});
		$('.new-product-list').slick({
			slidesToShow : 3,
			slidesToScroll : 2,
			autoplay : true,
			autoplaySpeed : 2000,
			adaptiveHeight : true,
			accessibility : true,
		});
	</script>
</body>

</html>