<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

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

<header>
	<style>

		.logout{
			color: #7fad39;
		}

		.logout:hover {
			color: #007bff;
		}
	</style>
<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="hero__search__phone">
						<div class="hero__search__phone__icon">
							<i class="fa fa-phone" style="margin-top: 15px"></i>
						</div>
						<div class="hero__search__phone__text">
							<h5>+84 888 888 888</h5>
							<span>Hỗ trợ 24/7 qua đường dây nóng</span>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header__top__right">
						<%--						<%! UserModel userModel = (UserModel) session.getAttribute("user"); %>--%>
						<c:if test="${sessionScope.user != null}">
							<div class="header__top__right__auth">
								<a href="<c:url value='#'/>"><i class="fa fa-user"></i>Tài khoản</a>
							</div>
							<a href="/dang-xuat" class="logout">Đăng xuất</a>
						</c:if>
						<c:if test="${sessionScope.user == null}">
							<div class="header__top__right__auth">
								<a href="/dang-ky"><i class="fa fa-user-plus"></i> Đăng
									ký</a>
							</div>
							<div class="header__top__right__auth">
								<a href="dang-nhap"><i class="fa fa-user"></i> Đăng nhập</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="/trang-chu"><img
						src="<c:url value='/template/web/img/logo.png' />"></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
				<ul>
					<li ><a
						href="<c:url value='/trang-chu'/>">Trang Chủ</a></li>
					<li><a href="<c:url value='/danh-sach-san-pham'/>">Sản Phẩm</a></li>
					<li><a href="#">Phân Loại</a>
						<ul class="header__menu__dropdown">
							<li><a href="/cay-an-qua">Cây ăn quả</a></li>
							<li><a href="/cay-cong-nghiep">Cây công
									nghiệp</a></li>
							<li><a href="/cay-lay-go">Cây lấy gỗ</a></li>
						</ul></li>
					<li><a href="<c:url value='/lien-he'/>">Liên hệ</a></li>
				</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<li><a href="<c:url value='danh-sach-yeu-thich'/>"><i class="fa fa-heart"></i> <span>${favour.tong_so_luong_sp()}</span></a></li>
						<li><a href="<c:url value='gio-hang-cua-ban'/>"><i class="fa fa-shopping-bag"></i>
								<span>${cart.tong_so_luong_sp()}</span></a></li>
					</ul>
					<div class="header__cart__price">
						 <%-- item: <span>0.00</span>--%>
					</div>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
	</header>