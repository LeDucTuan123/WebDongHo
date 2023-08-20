<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jstl/core_rt"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  </head>
  <body>
    <jsp:include page="/views/Admin/Layout/sidebar.jsp"></jsp:include>
    <div style="margin-left: 15%; padding: 10px">
      <span style="font-size: 40px">Danh sách người dùng</span>

      <div class="card">
        <div class="card-header">Bảng danh sách</div>
        <div class="card-body">
          <!-- search -->
          <jsp:include page="/views/Admin/Layout/search.jsp"></jsp:include>
          <table class="table table-light">
            <thead
              style="font-size: 1.2rem; font-weight: 500; text-align: center"
            >
              <td><b>Tài khoản</b></td>
              <td><b>Mật khẩu</b></td>
              <td><b>Fullname</b></td>
              <td><b>Email</b></td>   
              <td><b>Admin</b></td>  
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${userItems}" var="acc">
              <tr class="table-active">
                <td>${acc.username}</td>
                <td>${acc.password}</td>
                <td>${acc.fullname}</td>
                <td>${acc.email}</td>
                <td>
                	<form class="text-center" action="/admin/user/update?id=${acc.username }" method="post">
                		<input name="isAdmin" value="${!acc.admin }" type="checkbox" ${acc.admin ? 'checked' : '' } onChange="this.form.submit()">
                	</form>
                </td>       
              </tr>
              	</c:forEach>
           
            </tbody>
          </table>
        </div>
      </div>
      <jsp:include page="/views/Admin/Layout/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
