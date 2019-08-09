<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<style>
.bg {
	background: url(img/bg2.jpg) no-repeat;
	background-size: 100% 100%;
	width: 100%;
	height: 140%;
	padding: 10%;
	margin-top: 100px;
}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body class="bg">
	<!-- 主体 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-4 col-sm-12">

				<form action="">
					<!-- 输入表单 -->
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">用户注册</h4>
							<!-- 输入框 -->
							<div class="form-group">
								<label for="">用户ID</label> <input type="text" name="uid"
									value=""
									onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}"
									class="form-control form-control-lg">
							</div>
							<div class="form-group">
								<label for="">用户名</label> <input type="text" name="uname"
									value="" class="form-control form-control-lg">
							</div>
							<div class="form-group">
								<label for="">密码</label> <input type="password" name="passwd"
									value="" class="form-control form-control-lg">
							</div>
							<div class="form-group">
								<label for="">确认密码</label> <input type="password" name="passwd"
									value="" class="form-control form-control-lg">
							</div>
							<div class="form-group">

								<input type="submit" value="注册"
									class="form-control btn btn-primary">

							</div>
							<div class="form-group">

								<a href="signup.jsp">还没有注册？点击这里注册</a>

							</div>

						</div>

					</div>
				</form>
			</div>
		</div>
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