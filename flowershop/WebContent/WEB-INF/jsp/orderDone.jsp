<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>done</title>
</head>
<body>
订单完成。你的订单号是:${ordersn}<br>
<a href="${pageContext.request.contextPath }/order/pay?ordersn=${ordersn}">去付款</a>
</body>
</html>