<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
<script src="../views/js/jquery.min.js"></script>
<script src="../views/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../views/css/main.css">
<script src="https://kit.fontawesome.com/5a854a2686.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="Login-form-wrap">
			<h1 class="text-center"
				style="text-transform: uppercase; color: #05c3ff; font-weight: 700;">Xác
				nhận gmail</h1>
			<form action="/xacnhanMail" method="post">
				<div class="form-group">
					<label for="exampleInputPassword2">Email</label> <input type="text"
						name="email" value="${email1 }" class="form-control"
						id="exampleInputPassword2" placeholder="Email" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword2">Mã OTP</label> <input
						type="text" name="otp" class="form-control"
						id="exampleInputPassword2" placeholder="Mã OTP" />
				</div>
				<button type="submit" class="btn btn-primary">Xác nhận</button>
			</form>
			<div class="form-dangky">
				<span>Chưa nhận được mail <a href="/form/in">Gửi lại mail</a></span>
			</div>
		</div>
	</div>
</body>
</html>