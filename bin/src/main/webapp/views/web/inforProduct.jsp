
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Thông tin sản phẩm</title>
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
					<h2>Thông tin sản phẩm</h2>
					<div class="breadcrumb__option">
						<a href="<c:url value='/trang-chu' /> ">Trang chủ</a> <a
							href="<c:url value='/list-product' /> ">Sản phẩm</a> <span>Thông
							tin sản phẩm</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							 src="<c:url value='${infor.getImg()}'/>" alt="">
					</div>

				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${infor.name}</h3>
					<div class="product__details__rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>${infor.rate.getPoint()}</span>
						<span>(${infor.rate.listRate()} lượt đánh giá)</span>

					</div>
					<div class="product__details__price">${infor.price }đ</div>
					<p>${infor.pro_text}</p>
					<div class="product__details__quantity">
						<form action="<c:url value='/gio-hang' />" method="get">
							<div class="quantity">
								<div class="pro-qty">

									<input name="quantity" type="text" value="1">


								</div>

							</div>
						</form>
					</div>
					<a href="<c:url value='/gio-hang?proId=${infor.pro_id}' /> "
					   class="primary-btn" type="submit" value="go">Thêm vào giỏ hàng</a>
					<a href="<c:url value='/yeu-thich?proId=${infor.pro_id}' /> " class="heart-icon"><span
							class="icon_heart_alt"></span></a>

					<ul>
						<li><b>Xuất xứ:</b> <span>Việt Nam</span></li>


						<li><b>Tình trạng:</b> <span>${infor.checkout() }</span></li>
						<li><b>Số lượng: </b> <a> <span>${infor.quantity }</span></a></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">


						<li class="nav-item"><a class="nav-link" data-toggle="tab"
												href="#tabs-3" role="tab" aria-selected="false">Bình luận <span>(1)</span></a>
						</li>
					</ul>
					<div class="comment_product">
						<img
								src="<c:url value='/template/web/img/user/review-avt.jfif' /> ">
						<span> ${infor.rate.getUser_id().getFirst_name() }</span>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>${infor.rate.getPoint()}
						</span>
						</div>
						<p>${infor.rate.getNote()}</p>
					</div>
				</div>
				<div class="my_comment">
					<textarea class="text_comment"> </textarea>
					<button>
						Bình luận <i class="fa icon_like_alt"> </i>
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title related__product__title">
					<h2>Sản phẩm tương tự</h2>
				</div>
			</div>
		</div>
		<div class="row">

			<c:forEach items="${productOther}" end="3" var="i">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							 data-setbg="img/product/product-1.jpg">
							<a href="thong-tin-san-pham?pid=${i.pro_id }"><img
									src="<c:url value='${i.getImg()}'/>"> </a>

							<ul class="product__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>

						</div>
						<a href="thong-tin-san-pham?pid=${i.pro_id }">
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
	</div>
</section>


<%@ include file="/common/footer.jsp"%>
</body>
</html>