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
<title>网上商城</title>
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
	<!-- javaBean -->
	<jsp:useBean id="good" scope="application"
		class="xxmtest5.ProductController"></jsp:useBean>
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
					if (userid != null && userid.length() != 0) {
				%>
				<li class="nav-item"><img style="width: 1em; height: 1em;"
					alt="pic" src="img/peo.png"><%=userid%>
					<button type="button" class="btn btn-outline-primary">
						<a href="leave.jsp">退出</a>
					</button></li>
				<%
					} else {
				%><li>
					<button type="button" class="btn btn-outline-primary">
						<a href="login.jsp">登录</a>
					</button> <%
 	//在哪儿跳到登录页面的
 		session.setAttribute("Lmsg", "products.jsp");
 	}
 %>
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

	<!-- 表单 -->
	<form action="" method="post">
		<table class="table">
			<tbody>
				<tr>
					<!-- 遍历商品的全部信息 -->
					<%
						String op = null;

						ArrayList<Product> list = good.getAllProduct();
						if (list != null && list.size() != 0) {
							//3 products per line
							int count = 0;
							for (int i = 0; i < list.size(); i++) {
								Product pro = list.get(i);
								int id = pro.getId();
								String name = pro.getName();
								double price = pro.getPrice();
								String type = pro.getType();
								String msg = pro.getMsg();
								int quantity = pro.getQuantity();

								count++;
					%>
					<td><dd>
							<img alt="商品图片" src="img/<%=pro.getPicture()%>">
						</dd> <br>


						<dd>
							商品名称：<%=name%></dd> <br>
						<dd>
							商品价格：￥<%=price%></dd> <br>
						<dd>
							<a class="btn btn-primary"
								href="shopcart.jsp?op=add&pid=<%=id%>&shopadd=false"
								role="button">加入购物车</a>

						</dd>
						<dd>
							<div class="row">
								<div class="col-lg-6 col-sm-12">
									<button type="button" class="btn btn-primary btn-block"
										data-toggle="modal" data-target="#<%=name + id%>">详细信息</button>
									<!-- 查看商品详细信息 -->
									<!-- Modal 模态对话框 -->
									<div class="modal fade" id="<%=name + id%>" tabindex="-1"
										role="dialog" aria-labelledby="modelTitleId"
										aria-hidden="true">

										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title ">详细信息</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label for=""><img alt="商品图片"
															src="img/<%=pro.getPicture()%>"></label>

													</div>
													<div class="form-group">
														<label for="">商品名称：<%=name%></label>

													</div>
													<div class="form-group">
														<label for="">商品价格：￥<%=price%></label>

													</div>
													<div class="form-group">
														<label for="">商品类型：<%=type%></label>

													</div>
													<div class="form-group">
														<label for="">商品介绍：<%=msg%></label>

													</div>
													<div class="form-group">
														<label for="">库存：<%=quantity%></label>

													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">关闭</button>

													<a class="btn btn-primary"
														href="shopcart.jsp?op=add&pid=<%=id%>&shopadd=false"
														role="button">加入购物车</a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</dd></td>
					<!-- 三个一行 -->
					<%
						if (count % 3 == 0) {
					%>
				
				<tr></tr>

				<%
						}
					}
				 }
				%>

				</tr>

			</tbody>
		</table>


	</form>
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