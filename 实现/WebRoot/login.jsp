<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>��¼</title>
	<link rel="stylesheet" href=".\css\bootstrap.min.css">
	<script src=".\js\jquery-1.11.2.js"></script>
	<script src=".\js\bootstrap.min.js"></script>

	<style>
	.signin{
		width:220px;
		margin:auto;
		margin-top:200px;
	}
	input{
		margin-bottom:10px;
	}
	h2{
		text-align:center;
	}
	button{
		width:49%;
	}
	</style>
</head
<body>
	<div class="container">
		<form action="/userhome/login!check.action" class="signin" method="post">
			<h2>��¼</h2>
			<input type="text" name="name" class="form-control" placeholder="Email Address" style="margin-bottom:10px"required autofocus>
			<input type="password" name="user_password" class="form-control" placeholder="Password" style="margin-bottom:10px"required>
			<button class="btn btn-success submit">��¼</button>
			<button class="btn btn-default">�������룿</button>
		</form>
	</div>
</body>
</html>