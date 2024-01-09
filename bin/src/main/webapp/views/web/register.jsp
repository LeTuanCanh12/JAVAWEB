<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
<%--    <meta charset="UFT-8">--%>
    <title>Dang ky tai khoan</title>
    <link rel="stylesheet" href="<c:url value ='/template/web/css/register.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>


    </head>

    <body>
    <div class ="container" style="padding-top: 20px">
        <div class="header">
            <h2>Đăng Kí Tài Khoản</h2>

        </div>
        <h1>
            <%String massger = (String) request.getAttribute("massger"); %>
            <% if (massger == null) { %>

            <% } else { %>
            <p style="color: red"><%=massger%>
            </p>
            <% } %>
        </h1>

        <form action="/dang-ky" method="post" class="form" id ="form">
            <div class="form-control ">
                <label>Họ Và Tên</label>
                <input type="username" placeholder="Tên tài khoản" id="username"
                       name = "username">
                <i class="fa-solid fa-circle-check"></i>
                <i class="fa-solid fa-circle-info"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label>Email</label>
                <input type="text" placeholder="Email" id="email"
                       name="email">
                <i class="fa-solid fa-circle-check"></i>
                <i class="fa-solid fa-circle-info"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label>Mật Khẩu</label>
                <input type="password" placeholder="Tối thiểu 8 kí tự, ít nhất 1 chữ cái và 1 số" id="password" name ="password">
                <i class="fa-solid fa-circle-check"></i>
                <i class="fa-solid fa-circle-info"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label> Xác Nhận Mật Khẩu</label>
                <input type="password2" placeholder="Nhập lại mật khẩu" id="password2" name ="passwordnew">
                <i class="fa-solid fa-circle-check"></i>
                <i class="fa-solid fa-circle-info"></i>
                <small>Error message</small>
            </div>


            <button >Đăng Kí</button>
            <div class="ta">
                Bạn đã có tài khoản?
                <a href="/dang-nhap">Đăng Nhập</a>
            </div>





        </form>
    </div>
    <header>
            <div class=" header_top">
                <div class="top_left">
                    <a href="trang-chu">   <img src="/template/web/img/logo.png" alt="logo" srcset=""> </a>
                    <h3 class="header_title">Đăng Kí Tài Khoản</h3>
                </div>
                <div class="top_right">
                    <a href="#">Bạn cần giúp đỡ?</a>
                </div>
            </div>
        </header>
    <script src="/template/web/js/register.js"></script>
    </body>
</html>