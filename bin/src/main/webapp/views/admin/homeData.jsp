<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Admin trang chu</title>
</head>
<%@ include file="header.jsp" %>
<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->

<!-- Sidebar menu-->

<main class="app-content">
  <div class="row">
    <div class="col-md-12">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><a href="#"><b>Trang chủ</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <!--Left-->
    <div class="col-md-12 col-lg-12">
      <div class="row">
        <!-- col-6 -->
        <div class="col-md-3">
          <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
            <div class="info">
              <h4>Tổng khách hàng</h4>
              <p><b>${custom.size()} khách hàng</b></p>
              <p class="info-tong">Tổng số khách hàng được quản lý.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-3">
          <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
            <div class="info">
              <h4>Tổng sản phẩm</h4>
              <p><b>${listPro.size()} sản phẩm</b></p>
              <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-3">
          <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
            <div class="info">
              <h4>Tổng đơn hàng</h4>
              <p><b>0 đơn hàng</b></p>
              <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-3">
          <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
            <div class="info">
              <h4>Sắp hết hàng</h4>
              <p><b>0</b></p>
              <p class="info-tong">Số sản phẩm cảnh báo hết cần nhập thêm.</p>
            </div>
          </div>
        </div>
        <!-- col-12 -->
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Khách hàng mới</h3>
            <div>
              <table class="table table-hover">
                <thead>

                <tr>
                  <th>ID</th>
                  <th>Tên khách hàng</th>
                  <th>Ngày đăng kí</th>
                  <th>Số điện thoại</th>
                </tr>

                </thead>
                <tbody>
                <c:forEach items="${custom}" var="o">
                <tr>
                  <td>${o.user_id}</td>
                  <td>${o.first_name}</td>
                  <td>${o.create_date}</td>
                  <td><span class="tag tag-success">${o.phone}</span></td>

                </tr>
                </c:forEach>

                </tbody>
              </table>
            </div>

          </div>
        </div>
        <!-- / col-12 -->
      </div>
    </div>
    <!--END left-->

  </div>
  <!--END right-->
  </div>



</main>
<script src="<c:url value='/template/admin/doc/js/jquery-3.2.1.min.js'/>."></script>
<!--===============================================================================================-->
<script src="<c:url value='/template/admin/doc/js/popper.min.js'/>"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<!--===============================================================================================-->
<script src="<c:url value='/template/admin/doc/js/bootstrap.min.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/template/admin/doc/js/main.js'/>"></script>
<!--===============================================================================================-->
<script src="<c:url value='/template/admin/doc/js/plugins/pace.min.js'/>"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="<c:url value='/template/admin/doc/js/plugins/chart.js'/>"></script>
<!--===============================================================================================-->
<script type="text/javascript">
  var data = {
    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
    datasets: [{
      label: "Dữ liệu đầu tiên",
      fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
      strokeColor: "rgb(255, 212, 59)",
      pointColor: "rgb(255, 212, 59)",
      pointStrokeColor: "rgb(255, 212, 59)",
      pointHighlightFill: "rgb(255, 212, 59)",
      pointHighlightStroke: "rgb(255, 212, 59)",
      data: [20, 59, 90, 51, 56, 100]
    },
      {
        label: "Dữ liệu kế tiếp",
        fillColor: "rgba(9, 109, 239, 0.651)  ",
        pointColor: "rgb(9, 109, 239)",
        strokeColor: "rgb(9, 109, 239)",
        pointStrokeColor: "rgb(9, 109, 239)",
        pointHighlightFill: "rgb(9, 109, 239)",
        pointHighlightStroke: "rgb(9, 109, 239)",
        data: [48, 48, 49, 39, 86, 10]
      }
    ]
  };
  var ctxl = $("#lineChartDemo").get(0).getContext("2d");
  var lineChart = new Chart(ctxl).Line(data);

  var ctxb = $("#barChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxb).Bar(data);
</script>
<script type="text/javascript">
  //Thời Gian
  function time() {
    var today = new Date();
    var weekday = new Array(7);
    weekday[0] = "Chủ Nhật";
    weekday[1] = "Thứ Hai";
    weekday[2] = "Thứ Ba";
    weekday[3] = "Thứ Tư";
    weekday[4] = "Thứ Năm";
    weekday[5] = "Thứ Sáu";
    weekday[6] = "Thứ Bảy";
    var day = weekday[today.getDay()];
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    nowTime = h + " giờ " + m + " phút " + s + " giây";
    if (dd < 10) {
      dd = '0' + dd
    }
    if (mm < 10) {
      mm = '0' + mm
    }
    today = day + ', ' + dd + '/' + mm + '/' + yyyy;
    tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
    document.getElementById("clock").innerHTML = tmp;
    clocktime = setTimeout("time()", "1000", "Javascript");

    function checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  }
</script>
</body>
</html>