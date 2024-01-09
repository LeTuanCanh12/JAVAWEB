<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->

	<!-- Humberger End -->

	<!-- Header Section Begin -->

	<%@ include file="/common/header.jsp"%>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value='/template/web/img/breadcrumb.jpg'/>"
		style="background-image: url(<c:url value='/template/web/img/breadcrumb.jpg'/>);">
	<div class="container">
		<div class="row" style="">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Cây Công Nghiệp</h2>
					<div class="breadcrumb__option">
						<a href="<c:url value='/trang-chu' /> ">Trang chủ</a> <span>Sản
							phẩm</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
	<div class="container">
		<div class="row">

			<div class="col-lg-12 col-md-7">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="filter__sort">
								<span>Sắp xếp</span> <select>
									<option value="0">Mặc định</option>
									<option value="0">Thấp đến cao</option>
									<option value="0">Cao đến thấp</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>Sản phẩm</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${cayCongNghiep}" var="i">
						<div class="col-lg-4 col-md-6 col-sm-6">

							<div class="product__item">
								<div class="product__item__pic set-bg"
									 data-setbg="<c:url value='${i.getImg()}'/> ">
									<a href="thong-tin-san-pham?pid=${i.pro_id}"><img
											src=" "> </a>

									<ul class="product__item__pic__hover">
										<li><a href="yeu-thich?proId=${i.pro_id}"><i
												class="fa fa-heart"></i></a></li>
										<li><a href="gio-hang?proId=${i.pro_id}"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>

								</div>
								<a href="thong-tin-san-pham?pid=${i.pro_id}">
									<div class="product__item__text">
										<h6>${i.name}</h6>
										<p>
												${i.rate.getPoint()} <i class="fa fa-star"
																		style="color: #ffA200"></i>
										</p>
										<h5>${i.price}đ</h5>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="product__pagination">
					<c:forEach begin="1" end="${endPage }" var="i">
						<a href="cay-an-qua?indexPage=${i}" style="${tag==i?"background-color:green":""}">${i}</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%> </section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->

	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="<c:url value='/template/web/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/template/web/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/template/web/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/template/web/js/main.js' /> "></script>



</body>

</html>