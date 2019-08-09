<%@page import="java.math.BigDecimal"%>
<%@page import="xxmtest5.CartController"%>
<%@page import="xxmtest5.Cart"%>
<%@page import="xxmtest5.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="xxmtest5.ProductController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>我的购物车</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
img {
	width: 200px;
	height: 200px;
}

.bg {
	background: lightblue;
	background-size: 100% 100%;
	width: 100%;
	height: 100%;
}

.site {
	padding-left: 20%;
}

.tb {
	width: 500px;
}
</style>
</head>
<body class="bg">
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
//		用户名
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
			
					}%>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="text" name="text" value=""
					placeholder="三只松鼠">

				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<!-- 使用bean -->
	<jsp:useBean id="shop" scope="application"
		class="xxmtest5.CartController"></jsp:useBean>
	<%ArrayList<Cart> carts = new ArrayList<>(); %>

	<%
		
		if (userid == null) {
			response.sendRedirect("login.jsp");
		}
		else{
			
		
		String cid = request.getParameter("cid");
		String pid = request.getParameter("pid");
		String op = request.getParameter("op");
		String num = request.getParameter("num");
		String flag = request.getParameter("shopadd");
		
		//	对应的操作
		if (op != null && op.length() != 0) {

			if (op.equals("add")) {
				shop.add(pid,userid);
				// on shpcart page,not return
				if (flag != null && flag.length() != 0 && flag.equals("false")) {

					response.sendRedirect("products.jsp");
				}

			} else if (op.equals("less")) {

				shop.less(pid,userid);
			} else if (op.equals("de")) {
				shop.delete(pid,userid);
			}

			else if (op.equals("clear")) {
				shop.clear(userid);
				out.println("购物车已清空");
			}
		}
	%>
	<!-- 使用bean -->
	<jsp:useBean id="ob" scope="application"
		class="xxmtest5.DatabaseConnection"></jsp:useBean>
	<jsp:useBean id="good" scope="application"
		class="xxmtest5.ProductController"></jsp:useBean>
	<!-- 表单 -->

	<%
	StringBuilder pages = new StringBuilder();
		if(userid!=null&&userid.length()!=0){
			pages.append("pay.jsp");
		}else{
			pages.append("login.jsp");
		}
	%>

	<!-- 展示购物清单 -->
	<!-- <form action="" method="post"> -->
	<div class="site">
		<table class="table tb">
			<!-- 遍历商品的全部信息 -->
			<%
					String shopadd = null;
					//CartController p = new CartController();
					 carts = shop.getAllCart(userid);
					 
					 session.setAttribute("shoplist", carts);
					// Map<String,ArrayList<Cart>> sbshop = new HashMap<>();
					 //sbshop.put(userid, carts);
					 //application.setAttribute("sbshop", sbshop);//根据用户存储对应购物清单
					 
					if (carts != null && carts.size() != 0) {
						//3 products per line
						int count = 0;
						for (int i = 0; i < carts.size(); i++) {
							Cart c = carts.get(i);

							int ccid = c.getCart_id();
							int prid = c.getProduct_id();
							String name = c.getProduct_name();
							double price = c.getProduct_price();
							int quantity = c.getCart_pquantity();
							double totalprice = c.getTotalPrice();
							int pnum = good.getIdProduct(prid).getQuantity();
							count++;
				%>
			<tr>
				<td>
					<p>
						商品名：<%=name%>
					</p> <img alt="pic" src="img/0<%=prid%>.jpg">
				</td>
				<td>


					<p class="card-text">
						单价：<%=price%>

					</p>

					<p>
						件数： <a href="shopcart.jsp?op=less&pid=<%=prid%>&shopadd=true"
							class="btn btn-primary " role="button">－</a> <input size=3
							type="text" name="amount" value="<%=quantity%>"> <a
							href="shopcart.jsp?op=add&pid=<%=prid%>&shopadd=true"
							class="btn btn-primary" role="button">+</a>
					</p>
					<p class="card-text">
						序列号:<%=ccid%></p>
					<p class="card-text">
						商品号:<%=prid%></p> <a href="shopcart.jsp?op=de&pid=<%=prid%>"
					class="btn btn-success" role="button">删除</a>

				</td>
			</tr>

			<%
					}
					}
				%>

		</table>


		<a href="<%=pages%>" class="btn btn-success btn-lg" role="button">提交购物车</a>
		<a href="shopcart.jsp?op=clear" class="btn btn-danger btn-lg"
			role="button">清空购物车</a>
		<%} 
			
			session.setAttribute("Lmsg", "shopcart.jsp");
			%>
	</div>

	<!-- </form> -->


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