<%@page import="xxmtest5.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xxmtest5.ProductController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>支付页面</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
img {
	width: 300px;
	height: 400px;
}

.bg {
	background: lightblue;
	background-size: 100% 100%;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body class="bg">
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String userid = (String) session.getAttribute("uid");
	%>
	<!-- 导航栏 -->
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="products.jsp">XioMinShop</a>
		<button class="navbar-toggler d-lg-none" type="button"
			data-toggle="collapse" data-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link" href="my.jsp">个人中心
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="shopcart.jsp">购物车</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="dropdownId"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">商品分类</a>
					<div class="dropdown-menu" aria-labelledby="dropdownId">
						<a class="dropdown-item" href="">食品</a> <a class="dropdown-item"
							href="#">衣服</a> <a class="dropdown-item" href="#">书籍</a>
					</div></li>
				<!-- 显示按钮 -->
				<%
					//display the one of buttons
					if(userid!=null && userid.length()!=0){
					
				%>
				<li class="nav-item"><img style="width: 1em; height: 1em;"
					alt="pic" src="img/peo.png"><%=userid %>
					<button type="button" class="btn btn-outline-primary">
						<a href="leave.jsp">退出</a>
					</button></li>
				<%
					}else{
					
			%><li>
					<button type="button" class="btn btn-outline-primary">
						<a href="login.jsp">登录</a>
					</button> <%} %>
				</li>

			</ul>
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="text" name="text" value=""
					placeholder="三只松鼠">

				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- 主体 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-sm-12">
				<!-- 选择支付方式 -->
				<form action="success.jsp">
					<!-- 输入表单 -->
					<div class="card">
						<div class="card-body">

							<h4 class="card-title">请选择支付方式</h4>
							<!-- 输入框 -->
							<div class="form-group">

								<div class="form-group">
									<input type="submit" value="支付宝"
										class="form-control btn btn-primary btn-block">
								</div>
								<div class="form-group">
									<input type="submit" value="微信"
										class="form-control btn btn-primary btn-block">
								</div>
								<div class="form-group">
									<input type="submit" value="银联"
										class="form-control btn btn-primary btn-block">
								</div>

							</div>
						</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>