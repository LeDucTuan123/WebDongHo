<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jstl/core_rt"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Insert title here</title>
  </head>
  <body>
    <jsp:include page="/views/Admin/Layout/sidebar.jsp"></jsp:include>
    <div style="margin-left: 15%; padding: 10px">
      <div style="margin-top: 100px; text-align: center">
        <h1 style="color: red; font-size: 10rem">Hello Admin</h1>
      </div>
      <jsp:include page="/views/Admin/Layout/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
