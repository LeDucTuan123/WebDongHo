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
<body style="background-color: #ccc;">
	<div class="container">
		<div class="form">
			<p class="form-heading"></p>
			<div class="card">
				<div class="card-header text-center"
					style="text-transform: uppercase; color: #05c3ff; font-weight: 700;">
					Cảm ơn bạn đã đã mua hàng</div>
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
									<td> <fmt:formatNumber type="currency" value="${item.price * item.quantity }" /> </td>
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
					<a href="/hoadon" class="btn btn-primary">Quay trở lại</a>
					<a href="/hoadon/delete/${id }" class="btn btn-warning ${status ? 'disabled-link' : '' }">Hủy đặt hàng</a>
				</div>
			</div>
		</div>
	</div>
</body>
</body>

</html>