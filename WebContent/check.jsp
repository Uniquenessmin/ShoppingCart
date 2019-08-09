<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check</title>
</head>
<body>
	<p>跳转中......</p>

	<%
		String uid = request.getParameter("uid");
	String uname = request.getParameter("uname");
	String passwd = request.getParameter("passwd");
	
	if(uid!=null && passwd!=null){
		
		
		if((uid.equals("123")&&passwd.equals("123"))||(uid.equals("456")&&passwd.equals("456"))){
			session.setAttribute("uid", uid);
			session.setAttribute("passwd", passwd);
			session.setAttribute("msg", "");
			response.sendRedirect((String)session.getAttribute("Lmsg"));
		}else if((uid.equals("123")&&!passwd.equals("123"))||(uid.equals("456")&&!passwd.equals("456"))){
			session.setAttribute("msg", "密码错误");
			response.sendRedirect("login.jsp");
		}else{
			out.println("该用户还未注册！注册请点击");%>

	<a href="signup.jsp" role="button" class="btn btn-primary">注册</a>
	<% 
		}
		
	}
	
	
	
	%>
</body>
</html>