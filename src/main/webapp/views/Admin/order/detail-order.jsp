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
      <span style="font-size: 40px">Danh sách đơn hàng đang chờ</span>
      <div class="card">
        <div class="card-header">Bảng danh sách chi tiết</div>
        <div class="card-body">
          <div
            style="
              display: flex;
              justify-content: flex-start;
              margin-bottom: 10px;
            "
          >
            <a href="/admin/order/order">
              <button class="btn btn-primary">Trở lại</button>
            </a>
          </div>
          <table class="table table-bordered">
            <thead>
              <tr style="text-align: center">
                <th>STT</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>ID đơn đặt hàng</th>
                <th>Id sản phẩm</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${orderDetailItems}" var="od">
              <tr>
                <td>${od.id }</td>
                <td>${od.price }</td>
                <td>${od.quantity }</td>
                <td style="max-width: 50px; min-width: 30px">${od.order.orderid}</td>
                <td style="max-width: 100px">${od.product.productid}</td>
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
