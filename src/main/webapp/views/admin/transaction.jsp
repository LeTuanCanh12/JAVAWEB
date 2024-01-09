<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Quan ly san pham</title>
</head>
<body>
	<%@include file="header.jsp"%>
<body onload="time()" class="app sidebar-mini rtl"></body>
<main class="app-content">
	<div class="app-title">
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item active"><a href="#"><b>Danh
						sách hóa đơn</b></a></li>
		</ul>
		<div id="clock"></div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<div class="row element-button">
						
					</div>
					<table class="table table-hover table-bordered" id="sampleTable">
						<thead>
							<tr>
								<th>Mã hóa đơn</th>
								<th>Tên người mua</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Email</th>
								<th>Giá tiền</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${trans}" var="o">
								<tr>
									<td>${o.id}</td>
									<td>${o.name}</td>
									<td>${o.phone}</td>
									<td>${o.address}</td>
									<td>${o.email}</td>
									<td>${o.total}đ</td>
									<td><button class="btn btn-primary btn-sm trash"
											type="button" title="Xóa" onclick="myFunction(this)">
											<i class="fas fa-trash-alt"></i>
										</button>
										<button class="btn btn-primary btn-sm edit" type="button"
											title="Sửa" id="show-emp" data-toggle="modal"
											data-target="#ModalUP">
											<i class="fas fa-edit"></i>
										</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</main>


</body>
</html>