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
      <span style="font-size: 40px">Thống kê lượt thích sản phẩm</span>
      <div class="card">
        <div class="card-header">Bảng danh sách</div>
        <div class="card-body">
          <!-- search -->
          <jsp:include page="/views/Admin/Layout/search.jsp"></jsp:include>
          <table class="table table-bordered">
            <thead>
              <tr style="text-align: center">
                <th>STT</th>
                <th>Tên sản phẩm</th>
                <th>Lượt thích</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="width: 20px">1</td>
                <td style="width: 600px">Đồng hồ mạ vàng</td>
                <td style="width: 250px">200</td>
              </tr>
              <tr>
                <td style="width: 20px">1</td>
                <td style="width: 600px">Đồng hồ mạ vàng</td>
                <td style="width: 250px">200</td>
              </tr>
              <tr>
                <td style="width: 20px">1</td>
                <td style="width: 600px">Đồng hồ mạ vàng</td>
                <td style="width: 250px">200</td>
              </tr>
              <tr>
                <td style="width: 20px">1</td>
                <td style="width: 600px">Đồng hồ mạ vàng</td>
                <td style="width: 250px">200</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <jsp:include page="/views/Admin/Layout/footer.jsp"></jsp:include>
    </div>
  </body>
</html>
