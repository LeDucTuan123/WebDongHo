<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
				style="text-transform: uppercase; color: #05c3ff; font-weight: 700;">Đăng
				ký</h1>
			<form:form action="/SignUp" method="post" modelAttribute="account">
				<div class="form-group">
					<label for="exampleInputPassword2">Tên đầy đủ</label>
					<form:input path="fullname" type="text" class="form-control"
						id="exampleInputPassword2" placeholder="Tên đầy đủ" />
					<form:errors path="fullname" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword3">Email</label>
					<form:input path="email" type="email" class="form-control"
						id="exampleInputPassword3" placeholder="Email" />
					<form:errors path="email" />
					<c:if test="${isEmail }">
						<small style="color: red !important" id="emailHelp"
							class="form-text text-muted">Email đã được sử dụng</small>
					</c:if>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Tên đăng nhập</label>
					<form:input path="username" type="text" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp"
						placeholder="Nhập tên đăng nhập" />
					<c:if test="${isHave }">
						<small style="color: red !important" id="emailHelp"
							class="form-text text-muted">Tên đăng nhập đã tồn tại</small>
					</c:if>
					<form:errors path="username" />

				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Mật khẩu</label>
					<form:input path="password" type="password" class="form-control"
						id="exampleInputPassword1" placeholder="Mật khẩu" />
					<form:errors path="password" />
				</div>
				<div class="form-group">
					<label for="exampleInputPassword2">Nhập lại mật khẩu</label> <input
						type="password" name="rePass" class="form-control"
						id="exampleInputPassword2" placeholder="Nhập lại mật khẩu">
					<c:if test="${re }">
						<small id="emailHelp" style="color: red !important"
							class="form-text text-muted">Mật khẩu nhập lại không
							giống</small>
					</c:if>

				</div>
				<button type="submit" class="btn btn-primary">Đăng ký</button>
			</form:form>
			<div class="form-dangky">
				<span>Bạn đã có tài khoản <a href="/form/in">Đăng nhập
						tại đây</a></span>
			</div>
		</div>
	</div>
</body>
</html>