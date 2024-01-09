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
					<h2>Sản phẩm yêu thích</h2>
					<div class="breadcrumb__option">
						<a href="/trang-chu">Trang chủ</a> <span>Sản phẩm yêu thích</span>
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
								<th>Đánh giá</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${favour.list}" var="o">
								<tr>
									<td class="shoping__cart__item"><img
											src="<c:url value='${o.pro.getImg()}' />" alt="">
										<h5>${o.pro.name }</h5></td>
									<td class="shoping__cart__price">${o.pro.price}đ</td>
									<td class="shoping__cart__quantity">
										<div class="product__details__rating">
											${o.pro.rate.getPoint()} <i class="fa fa-star"></i>

										</div>
									</td>
									
									<td >
									${o.pro.rate.listRate()} đánh giá 
									<td class="shoping__cart__total"><a href=""> <i
											class="fa fa-cart-plus"></i>
									</a> <a href=""><i class="fa fa-close"></i> </a></td>
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
					<a href="danh-sach-san-pham" class="primary-btn cart-btn">Xem
						thêm sản phẩm</a> <a href="danh-sach-yeu-thich"
						class="primary-btn cart-btn cart-btn-right"><span
						class="icon_upload"></span> Cập nhật danh sách yêu thích</a>
				</div>
			</div>


		</div>
	</div>
	</section>






	<%@ include file="/common/footer.jsp"%>


</body>
</html>