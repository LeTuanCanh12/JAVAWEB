<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Dang nhap</title>
	<link rel="stylesheet" href="<c:url value='/template/web/css/login.css' />">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
	<link
			href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
			rel="stylesheet">
	<title>Pepe Shop</title>
<body>
<html>

<head>


<body>
<header>
	<div class="container header_top">
		<div class="top_left">
			<a href="/trang-chu"> <img src="<c:url value='/template/web/img/logo.png' />" alt="logo"
									   srcset=""></a>
			<h3 class="header_title">Đăng nhập</h3>
		</div>
		<div class="top_right">
			<a href="help.html">Bạn cần giúp đỡ?</a>
		</div>
	</div>
</header>


<div class="ig" id="ig">
	<div class="container_content" style="margin-top: 50px">
		<div class="header">
			<h2>Đăng Nhập Tài Khoản</h2>
		</div>
		<form action="/dang-nhap" method="post" class="form" id="form">

			<div class="form-control">
				<label>Email</label> <input type="text" placeholder="Email"
											id="email" name="username"> <i class="fa-solid fa-circle-check"></i> <i
					class="fa-solid fa-circle-info"></i> <small>Error message</small>
			</div>
			<div class="form-control">
				<label>Mật Khẩu</label> <input type="password"
											   placeholder="Tối thiểu 8 kí tự, ít nhất 1 chữ cái và 1 số"
											   id="password" name="password"> <i class="fa-solid fa-circle-check"></i> <i
					class="fa-solid fa-circle-info"></i> <small>Error message</small>
			</div>

			<button>Đăng Nhập</button>
			<div class="for">
				<a href="forgot.html">Quên Mật Khẩu</a>
			</div>
			<div class="reg">


				<a href="/dang-ky">Đăng Kí Tài Khoản</a>
			</div>


		</form>
	</div>
</div>
<!-- Footer Section Begin -->


<script src="js/al.js"></script>
</body>

</html>
</body>
</html>