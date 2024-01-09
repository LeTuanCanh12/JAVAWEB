<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tạo chữ ký</title>
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
            <h3 class="header_title">Tạo chữ ký</h3>
        </div>
        <div class="top_right">
            <a href="help.html">Bạn cần giúp đỡ?</a>
        </div>
    </div>
</header>


<div class="ig" id="ig">
    <div class="container_content" style="margin-top: 50px">
        <div class="header">
            <h2>Tạo chữ ký cho tài khoản</h2>
        </div>
        <form action="/tao-chu-ky" method="post" class="form" id="form">

            <div class="form-control">
                <label>Private Key:</label> <input type="password" placeholder="Nhập private key"
                                            id="private-key" name="private-key"> <i class="fa-solid fa-circle-check"></i> <i
                    class="fa-solid fa-circle-info"></i> <small>Error message</small>
            </div>
            <div class="form-control">
                <label>Nhập chữ ký muốn tạo</label> <input type="text"
                                               placeholder="Nhập văn bản chữ ký muốn tạo"
                                               id="signature-text" name="signature-text"> <i class="fa-solid fa-circle-check"></i> <i
                    class="fa-solid fa-circle-info"></i> <small>Error message</small>
            </div>


                <button>Tạo chữ ký</button>




        </form>
    </div>
</div>
<!-- Footer Section Begin -->


<script src="js/al.js"></script>
</body>

</html>
</body>
</html>