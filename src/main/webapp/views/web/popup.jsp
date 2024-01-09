<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2024
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Open Popup Example</title>
</head>
<body>

<script>
    function openPopup() {
        var width = 400;
        var height = 300;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        var popupFeatures = 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top;
        var popupURL = 'popupContent.jsp';

        window.open(popupURL, 'Popup', popupFeatures);
    }
</script>

<!-- Button hoặc sự kiện nào đó để gọi servlet và mở popup -->
<button onclick="location.href='openPopupServlet'">Open Popup</button>

</body>
</html>