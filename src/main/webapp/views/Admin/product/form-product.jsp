<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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

	<form:form action="/admin/product/create" modelAttribute="productItem"
		method="post" class="me-auto ms-auto w-50 mt-3 row" enctype="multipart/form-data">
		<div style="margin-left: 15%; padding: 10px">
			<span style="font-size: 40px">Form Sản phẩm</span>

			<c:if test="${not empty success_product}">
				<div class="alert alert-success" role="alert">
					${success_product}</div>
			</c:if>


			<div class="card">
				<div class="card-header">
					<h4>Cập nhật</h4>
				</div>
				<div class="card-body">
					<div class="row g-3">
					<form:input path="id" type="hidden"/>
						<div class="col-md-6">
							<label for="name" class="form-label"><b>Tên sản phẩm</b></label>
							<form:input type="text" class="form-control" path="name" />
							<form:errors path="name" class="form-text text-danger" />
							<c:if test="${not empty error_product}">
								<div class="form-text text-danger">${error_product}</div>
							</c:if>
						</div>
						<div class="col-md-6">
							<label for="discount" class="form-label"><b>Giảm giá</b></label>
							<form:input type="text" class="form-control" path="discount" />
							<form:errors path="discount" class="form-text text-danger" />
							<c:if test="${not empty error_product}">
								<div class="form-text text-danger">${error_product}</div>
							</c:if>
						</div>
						<div class="col-md-6">
							<label for="price" class="form-label"><b>Giá sản phẩm</b></label>
							<form:input type="number" class="form-control" path="price" />
							<form:errors path="price" class="form-text text-danger" />
							<c:if test="${not empty error_product}">
								<div class="form-text text-danger">${error_product}</div>
							</c:if>
						</div>
						<div class="col-md-6">
							<label for="category" class="form-label"><b>Loại</b></label>
							<form:select path="category" class="form-select"
								aria-label="Default select example">
								<c:forEach items="${listCategory}" var="f">
									<form:option value="${f}">${f}</form:option>
								</c:forEach>
							</form:select>
							<c:if test="${not empty error_product}">
								<div class="form-text text-danger">${error_product}</div>
							</c:if>
						</div>
						<div class="col-md-6">
							<label for="image" class="form-label"><b>Chọn hình</b></label>
							<input type="file" class="form-control" name="img" />
						</div>

						<div class="col-md-6">
							<label for="createdate" class="form-label"><b>Ngày
									bán</b></label>
							<form:input type="date" class="form-control" path="createdate" />
							<form:errors path="createdate" class="form-text text-danger" />
							<c:if test="${not empty error_product}">
								<div class="form-text text-danger">${error_product}</div>
							</c:if>
						</div>
						<div class="col-12" style="padding: 10px;">
							<button formaction="/admin/product/create" type="submit"
								class="btn btn-primary">Thêm</button>
							<button formaction="/admin/product/update" type="submit"
								class="btn btn-warning">Sửa</button>
							<button formaction="/admin/product/formproduct" type="submit"
								class="btn btn-danger">Làm mới</button>
						</div>
					</div>
				</div>

			</div>
		</div>

	
	</form:form>
	<div style="margin-left: 15%; padding: 10px">
		<span style="font-size: 40px">Danh sách người dùng</span>

		<div class="card">
			<div class="card-header">Bảng danh sách</div>
			<div class="card-body">
				<!-- search -->
				<jsp:include page="/views/Admin/Layout/search.jsp"></jsp:include>
				<table class="table table-light">
					<thead
						style="font-size: 1.2rem; font-weight: 500; text-align: center">
						<td><b>Tên sản phẩm</b></td>
						<td><b>Giá</b></td>
						<td><b>Giảm giá</b></td>
						<td><b>Loại</b></td>
						<td><b>Hình</b></td>
						<td><b>Ngày</b></td>
						<td><b>Action</b></td>
					</thead>					
					<tbody style="text-align: center">
						<c:forEach items="${productItems}" var="sp">
							<tr class="table">
								<td>${sp.name }</td>
								<td><fmt:formatNumber pattern="#,##0" value="${sp.price }" /> VNĐ</td>
								<td>${sp.discount }</td>
								<td>${sp.category.name }</td>
								<td><img src="${pageContext.request.contextPath }/views/image/product/${sp.image}" height="50px" width="70px" alt=""></td>
								<td><fmt:formatDate value="${sp.createdate}" pattern="dd-MM-yyyy" /></td>
								<td>
									<a href="/admin/product/edit?id=${sp.id}"
										class="btn btn-warning">Edit</a>
									<a href="/admin/product/delete?id=${sp.id}"
										class="btn btn-danger">Xóa</a>
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
