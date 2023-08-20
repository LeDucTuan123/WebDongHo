<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../views/css/bootstrap.min.css">
  <script src="https://kit.fontawesome.com/5a854a2686.js" crossorigin="anonymous"></script>
</head>
<body>
  <div class="container">
    <div class="Login-form-wrap">
      <h1 class="text-center" style="text-transform: uppercase; color: #05c3ff; font-weight: 700;">Đăng nhập </h1>
      <form action="/login" method="post">
        <div class="form-group">
          <label for="exampleInputEmail1">Tên đăng nhập</label>
          <input type="text" name="username" value="${username }" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
            placeholder="Tên đăng nhập">
          <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
        </div>
        <div class="form-group">
          <label for="exampleInputPassword1">Mật khẩu</label>
          <input type="password" name="password" value="${pass }" class="form-control" id="exampleInputPassword1" placeholder="Mật khẩu">
        </div>
        <div class="form-check">
          <input type="checkbox" name="remember" value="true" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label" for="exampleCheck1" style="color: #05c3ff;">Nhớ tài khoản!</label>
        </div>
        <button type="submit" class="btn btn-primary">Đăng nhập</button>
      </form>
      <span style="color: red; font-weight: 700;">${message }</span>
      <div class="form-dangky">
        <a href="/getp">Quên mật khẩu</a>
      </div>
      <div class="form-dangky">
        <span>Bạn chưa có tài khoản? <a href="/signUp">Đăng ký tại đây</a></span>
      </div>
      
    </div>
  </div>
</body>
</html>