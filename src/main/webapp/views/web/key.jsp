<%@ page import="vn.edu.hcmuaf.fit.model.Key" %>
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
	<%
		// Lấy giá trị từ session
		Key myValue = (Key) request.getSession().getAttribute("Key");
	%>
	<div class="container header_top">
		<div class="top_left">
			<a href="/trang-chu"> <img src="<c:url value='/template/web/img/logo.png' />" alt="logo"
									   srcset=""></a>
			<h3 class="header_title">Chữ ký điện tử</h3>
		</div>
		<div class="top_right">
<%--			<a href="help.html">Bạn cần giúp đỡ?</a>--%>
		</div>
	</div>
</header>


<div class="ig" id="ig">
	<div class="container_content" style="margin-top: 50px">
		<div class="header">
			<h2>Key</h2>
		</div>
		<form>
			<div class="form-control">
				<label>Public</label> <button  onclick="copyToClipboard1() ">Coppy</button>
				<textarea id="Public" rows="6" cols="40" readonly><%=myValue.getPublickey()%></textarea>
				<i class="fa-solid fa-circle-check"></i>
				<i class="fa-solid fa-circle-info"></i>
				<small>Error message</small>
			</div>
			<div class="form-control">
				<label>Private</label> <button  onclick="copyToClipboard2() ">Coppy</button>
				<textarea id="Private" rows="6" cols="40" readonly><%=myValue.getPrivatekey()%></textarea>
				<i class="fa-solid fa-circle-check"></i>
				<i class="fa-solid fa-circle-info"></i>
				<small>Error message</small>
			</div>

			<div class="reg">
				<a href="/dang-nhap">Đăng Kí Tài Khoản</a>
			</div>
		</form>
	</div>
</div>
<!-- Footer Section Begin -->


<script src="js/al.js"></script>
<script>
	function copyToClipboard1() {
		/* Lấy đối tượng input chứa dữ liệu cần sao chép */
		var input = document.getElementById('Public');
		/* Chọn toàn bộ nội dung của input */
		input.select();
		/* Sao chép nội dung vào clipboard */
		document.execCommand('copy');

	}
	function copyToClipboard2() {
		/* Lấy đối tượng input chứa dữ liệu cần sao chép */
		var input = document.getElementById('Private');
		/* Chọn toàn bộ nội dung của input */
		input.select();
		/* Sao chép nội dung vào clipboard */
		document.execCommand('copy');

	}
</script>
</body>

</html>
</body>
</html>