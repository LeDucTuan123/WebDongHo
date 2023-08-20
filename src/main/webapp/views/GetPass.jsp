<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<script src="../views/js/jquery.min.js"></script>
<script src="../views/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="Login-form-wrap">
			<h1 class="text-center"
				style="text-transform: uppercase; color: #05c3ff; font-weight: 700;">Mail bạn sử dụng</h1>
			<form action="/GetPass" method="post">
				<div class="form-group">
					<label for="exampleInputPassword2">Email</label> <input type="email"
						name="email" class="form-control"
						id="exampleInputPassword2" placeholder="Email" />
				</div>
				<button type="submit" class="btn btn-primary">Lấy lại mật khẩu</button>
			</form>
			<c:if test="${isHaveEmail }">
				<p style="color: red;">Tài khoản email không tồn tại</p>
			</c:if>
			<c:if test="${isSendEmail }">
				<p style="color: red;">Kiểm tra tài khoản email của bạn</p>
			</c:if>
		</div>
	</div>
</body>
</html>