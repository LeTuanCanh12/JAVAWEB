<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>

<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Pepe Shop</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value='/template/web/css/bootstrap.min.css ' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/font-awesome.min.css ' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/elegant-icons.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/nice-select.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/jquery-ui.min.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/owl.carousel.min.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/slicknav.min.css' />"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value='/template/web/css/style.css' />" type="text/css">
</head>
<body>
	<%@ include file="/common/header.jsp"%>


	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value='/template/web/img/breadcrumb.jpg'/>"
		style="background-image: url(<c:url value='/template/web/img/breadcrumb.jpg'/>);">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Giỏ hàng</h2>
					<div class="breadcrumb__option">
						<a href="/trang-chu">Trang chủ</a> <span>Giỏ hàng</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<thead>
							<tr>
								<th class="shoping__product">Sản phẩm</th>
								<th>Giá</th>
								<th>Số lượng</th>
								<th>Thành tiền</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${cart.list}" var = "o">
								<tr>
									<td class="shoping__cart__item"><img
										src="<c:url value='${o.pro.getImg()}' />" alt="">
										<h5>${o.pro.name }</h5></td>
									<td class="shoping__cart__price">${o.pro.price}đ</td>
									<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" name="quantityUpdate" value="${o.quantity}">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">${o.thanh_tien()}đ</td>
									<td class="shoping__cart__item__close"><span
										class="icon_close"></span></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="danh-sach-san-pham" class="primary-btn cart-btn">Tiếp
						tục mua sắm</a>
					<a href="/gio-hang-cua-ban"
						class="primary-btn cart-btn cart-btn-right"><span
						class="icon_loading"></span> Cập nhật lại giỏ</a>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>Mã giảm giá</h5>
						<form action="#">
							<input type="text" placeholder="Nhập mã giảm giá của bạn">
							<button type="submit" class="site-btn">Áp dụng mã</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>Tổng tiền</h5>
					<ul>
						<li>Phụ thu <span>0đ</span></li>
						<li>Tổng <span>${cart.tong_tien_gio()}đ</span></li>
					</ul>
					<a href="/thanh-toan" class="primary-btn">Thanh Toán</a>
				</div>
			</div>
		</div>
	</div>
	</section>






	<%@ include file="/common/footer.jsp"%>


</body>
</html>