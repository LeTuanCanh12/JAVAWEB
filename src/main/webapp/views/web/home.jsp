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
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>Phân loại</span>
					</div>
					<ul>
						<li><a href="/cay-an-qua">Cây
								ăn quả</a></li>

						<li><a href="/cay-cong-nghiep">Cây
								công nghiệp</a></li>
						<li><a href="/cay-lay-go">Cây
								lấy gỗ</a></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="search">
							<input type="text" name="txt" placeholder="Bạn muốn tìm gì?...">
							<button type="submit" class="site-btn" onclick="onClick()">
								<i class="fa fa-search"></i> Tìm kiếm
							</button>

						</form>
					</div>


					<div id="sales">
						<a href="#"> <img
							src=" <c:url value='/template/web/img/sales.png'/>"></a>
					</div>
				</div>
				<div class="hero__item set-banner"
					style="background-image: url(<c:url value='/template/web/img/hero/banner2.png'/>);">
					<div class="hero__text">
						<span> CÁC LOẠI CÂY TRỒNG</span>
						<h2>
							Cây giống <br />ươm,cấy,ghép
						</h2>
						<p>Miễn phí giao hàng, không lo về giá</p>
						<a href="<c:url value='/danh-sach-san-pham'/> " class="primary-btn">MUA
							NGAY</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories"> </section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->

	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<a href="thong-tin-san-pham?pid=52" style="color: white">
						<div class="banner__pic">
							<img src="<c:url value='/template/web/img/banner/cachua.jpg'/>"
								alt="">
							<div class="button_vd">Mua ngay</div>
						</div>
					</a>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<a href="thong-tin-san-pham?pid=46" style="color: white">
						<div class="banner__pic">
							<img src=" <c:url value='/template/web/img/banner/cay_tao.jpg'/>">
							<div class="button_vd">Mua ngay</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Phổ biến nhất</h4>
					<div class="latest-product__slider owl-carousel">

						<div class="latest-prdouct__slider__item">
							<c:forEach items="${listCo }" end="2" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name}</h6>
										<span>${o.price}đ</span>
										<p>
											${o.rate.getPoint()} <i class="fa fa-star"
												style="color: #ffA200"></i>
										</p>
									</div>
								</a>
							</c:forEach>

						</div>

						<div class="latest-prdouct__slider__item">
							<c:forEach begin="3" items="${listCo}" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name }</h6>
										<span>${o.price }đ</span>
										<p>
											${o.rate.getPoint()}<i class="fa fa-star"
												style="color: #ffA200"></i>
										</p>

									</div>
								</a>
							</c:forEach>

						</div>

					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Đánh giá cao</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${listRa}" end="2" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name}</h6>
										<span>${o.price}đ</span>
										<p>
											${o.rate.getPoint()} <i class="fa fa-star"
												style="color: #ffA200"></i>
										</p>
									</div>
								</a>
							</c:forEach>

						</div>

						<div class="latest-prdouct__slider__item">
							<c:forEach items="${listRa}" begin="3" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

<%----%>

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name }</h6>
										<span>${o.price }đ</span>
										<p>
											${o.rate.getPoint()}<i class="fa fa-star"
												style="color: #ffA200"></i>
										</p>

									</div>
								</a>
							</c:forEach>


						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>Đang giảm giá</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${listSale}" end="2" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name}</h6>
										<span style="color: red">${o.discount_price()}đ
											<p
												style="display: inline-block; text-decoration-line: line-through">
												${o.price}đ</p>
										</span>
										<p>
												${o.rate.getPoint()} <i class="fa fa-star" style="color: #ffA200"></i>
										</p>
									</div>
								</a>
							</c:forEach>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:forEach begin="3" items="${listSale }" end="5" var="o">
								<a href="thong-tin-san-pham?pid=${o.pro_id}" class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="<c:url value='${o.getImg()}'/>" style="height: 100px;width: 100px" alt="">

									</div>
									<div class="latest-product__item__text">
										<h6>${o.name}</h6>
										<span style="color: red">${o.discount_price()}đ
											<p
												style="display: inline-block; text-decoration-line: line-through">
												${o.price}đ</p>
										</span>
										<p>
											${o.rate.getPoint()} <i class="fa fa-star" style="color: #ffA200"></i>
										</p>
									</div>
								</a>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	<section class="from-blog spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title from-blog__title">
					<h2>Tin tức</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">

						<img
							src=" <c:url value='/template/web/img/blog/kythuattrongcay.jfif'/>"
							style="height: 240px" alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 20 tháng 10 năm 2022</li>
							<li><i class="fa fa-comment-o"></i> 5</li>
						</ul>
						<h5>
							<a target="_blank"
								href="https://vuacaygiong.com/huong-dan-ky-thuat-trong-cay-an-qua-don-gian-hieu-qua-nhat/">Hướng
								dẫn kỹ thuật trồng cây ăn quả đơn giản hiệu quả nhất</a>
						</h5>
						<p>Bài viết hôm nay Tiến Đạt Farm sẽ cùng bà con tìm hiểu các
							bước cơ bản trong kỹ thuật trồng cây ăn quả, có thể áp dụng chung
							cho các giống cây trồng khác...</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">
						<img src=" <c:url value='/template/web/img/blog/phattrien.jfif'/>"
							alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 5 tháng 9 năm 2022</li>
							<li><i class="fa fa-comment-o"></i> 2</li>
						</ul>
						<h5>
							<a target="_blank"
								href="https://baohungyen.vn/kinh-te/202101/phat-trien-nhanh-nhung-giong-cay-trong-moi-phuc-vu-chuyen-doi-bai-1nhieu-giong-cay-trong-moi-duoc-dua-vao-co-cau-c4f1fcb/">
								Phát triển nhanh những giống cây trồng mới phục vụ chuyển đổi</a>
						</h5>
						<p>Theo báo Hưng Yên: Giống cây trồng có vai trò quan trọng,
							quyết định năng suất, chất lượng, hiệu quả sản xuất nông nghiệp.
							Do đó, những năm qua, tỉnh đã có nhiều cơ chế hỗ trợ đối với công
							tác chọn, tạo giống cây trồng...</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="blog__item">
					<div class="blog__item__pic">

						<img src=" <c:url value='/template/web/img/blog/sauri.jpg'/>"
							alt="">
					</div>
					<div class="blog__item__text">
						<ul>
							<li><i class="fa fa-calendar-o"></i> 5 tháng 7 2020</li>
							<li><i class="fa fa-comment-o"></i> 8</li>
						</ul>
						<h5>
							<a target="_blank"
								href="https://vnexpress.net/sau-rieng-ruot-do-ve-viet-nam-doi-gia-17-lan-3772797.html">
								Sầu riêng ruột đỏ về Việt Nam đội giá 17 lần</a>
						</h5>
						<p>Nếu tại Malaysia sầu riêng ruột đỏ có giá 57.000 - 60.000
							đồng một kg thì về Việt Nam được nhiều nơi bán tới một triệu
							đồng.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/footer.jsp"%> </section>
	<script src="<c:url value='/template/web/js/jquery-3.3.1.min.js' />"></script>
	<script src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
	<script
		src="<c:url value='/template/web/js/jquery.nice-select.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery-ui.min.js' />"></script>
	<script src="<c:url value='/template/web/js/jquery.slicknav.js' />"></script>
	<script src="<c:url value='/template/web/js/mixitup.min.js' />"></script>
	<script src="<c:url value='/template/web/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/template/web/js/main.js' />"></script>
</body>
</html>