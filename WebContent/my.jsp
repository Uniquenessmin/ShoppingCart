<%@page import="xxmtest5.Cart"%>
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
<title>我的订单</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
.div {
	margin-left: 20%;
	margin-right: 20%;
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
		ArrayList<Cart> order =(ArrayList<Cart>)session.getAttribute("order");
		
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
	<!-- 订单表 -->
	<div class="div">
		<table class="table">
			<thead>
				<tr>
					<th>商品编号</th>
					<th>商品名</th>
					<th>商品单价</th>
					<th>商品数量</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">订单号：<%=System.currentTimeMillis()%></td>
				</tr>
				<%double sumprice = 0;
   if (order != null && order.size() != 0) {
		
		
		for (int i = 0; i <order.size(); i++) {
			Cart c = order.get(i);

			int prid = c.getProduct_id();
			String name = c.getProduct_name();
			double price = c.getProduct_price();
			int quantity = c.getCart_pquantity();
			double totalprice = c.getTotalPrice();
			
			sumprice+=totalprice;//订单总价格
   %>
				<tr>
					<td><%=prid%></td>
					<td><%=name%></td>
					<td><%=price%></td>
					<td><%=quantity%></td>
				</tr>
				<%}
		}%>
				<tr>
					<td colspan="4">订单总价：<%=sumprice %></td>
				</tr>

			</tbody>
		</table>
		<a href="products.jsp" role="button" class="btn btn-primary btn-block">继续购物</a>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>