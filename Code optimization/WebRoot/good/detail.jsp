<%@ page language="java" contentType="text/html;charset=GB18030"
	pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>��������Ϣ����ƽ̨</title>
<link rel="stylesheet" href="..\static\css\bootstrap.min.css">
<script src="..\static\js\jquery-1.11.2.js"></script>
<script src="..\static\js\bootstrap.min.js"></script>
<script>
	function chooseMajor() {
		var choice = document.form1.department;
		var chooseMajor = document.form1
		var index = 0;
		// alert(choice.options[1].value);
		var i;
		for (i = 1; i < choice.options.length; i++) {
			if (choice.options[i].selected) {
				// alert(choice.options[i].value);
				// choice.options[i].className="show";
				index = i;
			} else {
				// choice.options[i].className="hidden"
			}
		}
		if (index == 0) {
			document.getElementById("major_00").disabled = "true";
			document.getElementById("major_00").className = "form-control show"
		} else {
			document.getElementById("major_00").disabled = "true";
			document.getElementById("major_00").className = "form-control hidden"
		}
		for (i = 1; i < choice.options.length; i++) {
			var name = "major_"
			if (i < 10) {
				name = name + "0" + i;
			} else {
				name = name + i;
			}
			if (i == index) {
				document.getElementById(name).className = "form-control show"
				document.getElementById(name).disabled = false
			} else {
				document.getElementById(name).className = "form-control hidden"
				document.getElementById(name).disabled = true
			}
		}

	}
</script>
<style>
body {
	background-color: rgb(240, 240, 240);
}

.row {
	padding: 100px;
}

.book-thumbnail {
	margin-bottom: 20px;
}

.btn-detail {
	width: 49%;
}

.caption-detail {
	text-align: center;
	font-weight: bold;
}

a.signin {
	float: right;
	background-color: #222222;
	color: #9d9d9d;
	font-size: 20px;
	height: 50px;
	line-height: 50px;
	padding-right: 20px;
	text-align: center;
	text-decoration: none;
}

a.signin:visited {
	color: #e0e0e0;
}

a.signin:hover {
	color: #ffffff;
}

a.signin:active {
	color: #ffffff;
}

div.body_left.col-md-2 {
	position: fixed;
	top: 100px;
	left: 85px;
}

form#form1 {
	width: 300px;
	margin: 0 auto;
}

h2 {
	text-align: center;
	font-weight: bold;
}

label {
	margin-left: -25px;
}

.keyword {
	padding: 0px;
}

.price.form-control {
	padding: 0px;
	width: 430px;
	margin-left: 15px;
	margin-right: 15px;
	position: relative;
}
/*input.form-control{padding-right:30px; margin-right:30px;}*/

/*tr{background-color:grey;}*/
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a href="listAll?id=1" class="navbar-brand">������Ʒ</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="listAll?id=1"
					class="dropdown-toggle" data-toggle="dropdown">����<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="listAll?id=11">�����</a></li>
						<li><a href="listAll?id=12">����</a></li>
						<li><a href="listAll?id=13">����</a></li>
					</ul></li>
				<li class="dropdown"><a href="listAll?id=2"
					class="dropdown-toggle" data-toggle="dropdown">������Ʒ<b
						class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="listAll?id=21">�·�</a></li>
						<li><a href="listAll?id=22">��ױƷ</a></li>
						<li><a href="listAll?id=23">�ӻ�</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">���Ӳ�Ʒ<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">����</a></li>
						<li><a href="#">�ֻ�/ipad</a></li>
						<li><a href="#">���뵶</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">�Ҿ���Ʒ </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">������� </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Ӱ����Ϸ </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">���� </a></li>
			</ul>
			<div class="pull-right">
				<c:choose>
					<c:when test="${sessionScope.user == null}">
						<a href="<%=basePath %>user/register.jsp" class="signin">ע��</a>
						<a href="<%=basePath %>user/login.jsp" class="signin" >��¼</a> 
					</c:when>
					<c:otherwise>
						<a href="<%=basePath %>user/logout" class="signin">ע��</a>
						<a href="javascript:void(0)" class="signin" style="color:red">${sessionScope.user.name}</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title text-center lead">����</h3>
					</div>
					<div class="panel-body" align="center">
						<img src="../static/image/${good.imgSrc}" alt="ͨ�õ�ռλ������ͼ" height="256px" width="225px">
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title text-center lead">������Ϣ����</h3>
					</div>
					<table class="table table-hover table-bordered"
						style="tableLayout:fixed; margin-top:14px; margin-bottom:14px">
						<tr class="text-center">
							<td>����</td>
							<td>${good.name}</td>
						</tr>
						<tr class="text-center">
							<td width="25%">���</td>
							<td width="75%">${good.detail}</td>
						</tr>
						<tr class="text-center">
							<td>�۸�</td>
							<td>${good.price }</td>
						</tr>
						<tr class="text-center">
							<td>����</td>
							<td>${good.user.name }</td>
						</tr>
						<tr class="text-center">
							<td>�绰</td>
							<td>${good.user.telephone }</td>
						</tr>
						<tr class="text-center">
							<td>email</td>
							<td>${good.user.email }</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
