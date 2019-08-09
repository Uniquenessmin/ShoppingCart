<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已经退出</title>
</head>
<body>
	<%
	session.setAttribute("uid", null);
	%>
	<h4>
		已经退出，重新登录请点击 <a href="login.jsp" class="btn btn-success" role="button">登录</a>
	</h4>
</body>
</html>