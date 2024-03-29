<%@ page import="vn.edu.hcmuaf.fit.model.Key" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Vui lòng bảo mật</title>
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
    <%
		// Lấy giá trị từ session
		String myValue = (String) request.getSession().getAttribute("signature");

	%>

<body>
<header>
  <div class="container header_top">
    <div class="top_left">
      <a href="/trang-chu"> <img src="<c:url value='/template/web/img/logo.png' />" alt="logo"
                                 srcset=""></a>
      <h3 class="header_title">Vui lòng bảo mật</h3>
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
    <form method="post" class="form" id="form">
      <div class="form-control">
        <p>Chữ ký điện tử đã tạo thành công. Vui lòng giữ bí mật chuỗi xác nhận người dùng và văn bản chữ ký đã nhập!
        </p>
      </div>
      <div class="form-control">
        <label>Mã xác nhận người dùng: </label> <button  onclick="copyToClipboard1() ">Copy</button>
        <textarea id="Public" rows="6" cols="40" readonly><%=myValue.toString()%></textarea>
        <i class="fa-solid fa-circle-check"></i>
        <i class="fa-solid fa-circle-info"></i>
        <small>Error message</small>
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

</script>
</body>

</html>
</body>
</html>