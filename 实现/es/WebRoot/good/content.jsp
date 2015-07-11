<%@ page language="java" contentType="text/html;charset=GB18030"
	pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>������Ϣ����ƽ̨</title>
<link rel="stylesheet" href="..\static\css\bootstrap.min.css">
<script src="..\static\\js\jquery-1.11.2.js"></script>
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
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a href="listAll?id=1" class="navbar-brand">������Ʒ</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="listAll?id=1" class="dropdown-toggle"
					data-toggle="dropdown">����<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="listAll?id=11">�����</a></li>
						<li><a href="listAll?id=12">����</a></li>
						<li><a href="listAll?id=13">����</a></li>
					</ul></li>
				<li class="dropdown"><a href="listAll?id=2" class="dropdown-toggle"
					data-toggle="dropdown">������Ʒ<b class="caret"></b>
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
			<!-- <a href="#Login" data-toggle="modal" class="signin">��¼</a> -->
			<div class="pull-right">
				<c:choose>
					<c:when test="${sessionScope.user == null}">
						<a href="<%=basePath %>user/register.jsp" class="signin">ע��</a>
						<a href="<%=basePath %>user/login" class="signin" >��¼</a> 
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
			<div class="body_left col-md-2" style="background-color:#eee">
				<div class="panel panel-info">
					<p class="text-center lead" style="font-weight:bolder ">����������﷢�����õĶ�����Ϣ</p>
					<p class="text-muted text-center lead" style="font-weight:bold">�������İ�ť����һ��</p>
					<c:choose>
						<c:when test="${sessionScope.user == null}">
							<button class="btn btn-info btn-block btn-lg"
							onclick="javascript:window.location.href='<%=basePath%>user/login?redirectUrl=<%=basePath%>good/publish.jsp'">����</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-info btn-block btn-lg"
							onclick="javascript:window.location.href='<%=basePath%>good/publish.jsp'">����</button>
						</c:otherwise>
					</c:choose>	
				</div>
			</div>
			<div class="col-md-10" style="margin-left:240px">
				<div class="rowtest">
					<c:forEach items="${goods}" var="g">
						<div class="col-sm-6 col-md-3 book-thumbnail">
							<div class="thumbnail">
								<img class="thumbnail" src="../static/image/${g.imgSrc}">
							</div>
							<div class="caption">
								<h3 class="caption-detail">${g.name}</h3>
								<p>${g.detail}</p>
								<c:choose>
									<c:when test="${sessionScope.user == null}">
										<button class="btn btn-info btn-detail"
										onclick="location='<%=basePath %>user/login?redirectUrl=<%=basePath %>good/detail?id=${g.id}'">����</button>
										<button class="btn btn-primary btn-detail pull-left" disabled>�ղ�</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-info btn-detail"
										onclick="location='<%=basePath %>good/detail?id=${g.id}'">����</button>
										<button class="btn btn-primary btn-detail pull-left" disabled>�ղ�</button>
									</c:otherwise>
								</c:choose>	
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<c:if test="${pageNum > 1}">
		<div class="col-lg-offset-2">
			<ul class="pager">
				<c:choose >
					<c:when test="${page==1}">
						<li><a href="<%=basePath%>good/listAll?id=${good.categories[0].id}&page=1">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<%=basePath%>good/listAll?id=${good.categories[0].id}&page=${page-1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose >
					<c:when test="${page==pageNum}">
						<li><a href="<%=basePath%>good/listAll?id=${good.categories[0].id}&page=${pageNum}">Next</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="<%=basePath%>good/listAll?id=${good.categories[0].id}&page=${page+1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		</c:if>
		<div class="col-lg-offset-7">
			<p>��${page}ҳ</p>
			<p>��${pageNum}ҳ</p>
		</div>
	</div>
</body>
</html>