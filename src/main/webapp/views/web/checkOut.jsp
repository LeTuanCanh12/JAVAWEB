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


<%@ include file="/common/header.jsp"%>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
         data-setbg="<c:url value='/template/web/img/breadcrumb.jpg'/>"
         style="background-image: url(<c:url value='/template/web/img/breadcrumb.jpg'/>);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Thanh toán</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.html">Trang chủ</a> <span>Thanh toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
        </div>
        <div class="checkout__form">
            <h4>Chi tiết thanh toán</h4>
            <form action="thanh-toan" method="post">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p >Tên<span>*</span></p>
                                    <input  type="text" name="ten">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ<span>*</span></p>
                                    <input  type="text"  name="ho">
                                </div>
                            </div>
                        </div>

                        <div class="checkout__input">
                            <p >Địa chỉ<span>*</span></p>
                            <input name="diachi" type="text" placeholder="" class="checkout__input__add">

                        </div>
                        <div class="checkout__input">
                            <p>Thị trấn/Thành phố<span>*</span></p>
                            <input name="thanhpho" type="text">
                        </div>
                        <div class="checkout__input">
                            <p>Quốc gia<span>*</span></p>
                            <input name="quocgia" type="text">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Số di động<span>*</span></p>
                                    <input name="phone" type="text">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input name="email" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Ghi chú<span>*</span></p>
                            <input name="note" type="text"
                                   placeholder="Ghi chú về đơn hàng của bạn...">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng của bạn</h4>
                            <div class="checkout__order__products">Các sản phẩm <span>Tổng</span></div>
                            <ul>
                                <c:forEach items="${cart.list }" var="o">
                                    <li>${o.pro.name}
                                        <span> ${o.thanh_tien() }đ
                                	 </span></li>
                                </c:forEach>

                            </ul>
                            <div class="checkout__order__subtotal">Giảm giá<span>0đ</span></div>
                            <div class="checkout__order__total">Tổng <span>${cart.tong_tien_gio() }đ</span></div>
                            <div class="checkout__input__checkbox">

                            </div>
                            <p>Phương thức thanh toán.</p>
                            <div class="checkout__input__checkbox">
                                <label for="offline">
                                    Thanh toán khi nhận hàng
                                    <input type="checkbox" id="offline">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                        <button href="#" type="submit" class="site-btn">Thanh toán</button>
                    </div>
                </div>

        </form>
    </div>
    </div>
</section>
<%@ include file="/common/footer.jsp"%>
</section>
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