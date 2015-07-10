<%@ page language="java" contentType="text/html;charset=GB18030" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>����������Ϣ</title>
	<link rel="stylesheet" href="..\static\css\bootstrap.min.css">
	<script src="..\static\js\jquery-1.11.2.js"></script>
	<script src="..\static\js\bootstrap.min.js"></script>
	<script>
	function chooseMajor(){
		var choice=document.form1.department;
		var chooseMajor=document.form1
		var index=0;
		// alert(choice.options[1].value);
		var i;
		for(i=1; i<choice.options.length;i++){
			if(choice.options[i].selected){
				// alert(choice.options[i].value);
				// choice.options[i].className="show";
				index=i;
			}
			else{
				// choice.options[i].className="hidden"
			}
		}
		if(index==0){
			document.getElementById("major_00").disabled="true";
			document.getElementById("major_00").className="form-control show"
		}
		else{
			document.getElementById("major_00").disabled="true";
			document.getElementById("major_00").className="form-control hidden"
		}		
		for(i=1; i<choice.options.length; i++){
			var name="major_"
			if(i<10){
				name=name+"0"+i;
			}
			else{
				name=name+i;
			}
			if(i==index){
				document.getElementById(name).className="form-control show"
				document.getElementById(name).disabled=false
			}
			else{
				document.getElementById(name).className="form-control hidden"
				document.getElementById(name).disabled=true
			}
		}

	}
	</script>
	<style>
	form{
		width:455px;
		margin:50px auto;
	}
	h2{
		text-align:center;
		font-weight:bold;
	}
	.keyword{padding:0px;}
	.price.form-control{padding:0px; width:337px; margin-left:15px; margin-right:15px; position:relative;}
	/*.input-group-addon{position:absolute; left:336px;}*/
	/*label.input-grup-addon{padding-right:15px; position:absolute; left:40px; top:20px;}*/
	</style>
</head>
<body>
	<div class="container">
		<form action="publish" class="form-horizontal" name="form1" method="post" enctype="multipart/form-data">
			<input type="hidden" name="user.id" value="1"/>
			<h2>��Ʒ��Ϣ</h2>
			<div class="form-group">
				<label for="name" class="control-label col-sm-2">����</label>
				<div class="col-sm-10">
					<input type="text"  name= "name" class="form-control" placeholder="ǡ�������ָ��ܱ�������" required autofocus>
				</div>
			</div>
			<div class="form-group">
				<label for="abstract" class="control-label col-sm-2">���</label>
				<div class="col-sm-10">
					<textarea name="detail" id="abstract" cols="30" rows="4" class="form-control" placeholder="��Ҫ����һ�������¾ɳ̶Ȱ�"required></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="control-label col-sm-2">�۸�</label>
				<div class="input-group col-sm-10" >
					<!-- <div class="col-sm-12"> -->
						<input type="text" class="form-control price">
						<label class="input-group-addon" style="padding: 9px 24px 9px 13px; position:absolute; left:352px; ">Ԫ</label>
						<!-- <label for="yuan"><span class="input-group-addon">Ԫ</span></label> -->
					<!-- </div> -->
				</div>
			</div>
			<div class="form-group">
				<label for="contact" class="control-label col-sm-2">����</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="user.name" value="${sessionScope.user.name}">
				</div>
			</div>
			<div class="form-group">
				<label for="tel" class="control-label col-sm-2">�绰</label>
				<div class="col-sm-10">
					<input type="tel" class="form-control" name="user.telephone" value="${sessionScope.user.telephone}">
				</div>
			</div>
			<!-- Ժϵѡ�񣬶�ѡ��select����multiple,ȥ�����ǵ�ѡ -->
			<div class="form-group">
				<label for="department" class="control-label col-sm-2">Ŀ¼</label>
				<div class="col-sm-10 ">
					<select name="categories[0].id" id="department" class="form-control " onchange="chooseMajor()" >
						<option value="selected">ѡ��Ŀ¼</option>
						<option value="1">�鼮</option>
						<option value="11">---�����</option>
						<option value="12">---����</option>
						<option value="13">---����</option>
						<option value="2">������Ʒ</option>
						</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="contact" class="control-label col-sm-2">�ϴ�ͼƬ</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" name="uploadFile">
				</div>
			</div>
			<input type="submit" value="�ύ" class="btn btn-primary btn-block" >
		</form>
	</div>
</body>
</html>