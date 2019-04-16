<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<style type="text/css">
	table{
		text-align: center;
	}
	.textSize{
		width: 200px;
		height: 20px;
	}
	.my_ann1{ width:80px; height:34px; cursor:pointer; line-height:34px;font-size:14px; color:#fff; border:none; background:url(images/my_bj5.gif) no-repeat 0 0; font-family:"微软雅黑"}
	</style>
	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.loginform.submit();
	}
	//取消按钮
	function cancel(){
		document.loginform.action="";
	}
	</script>
  </head>
  <body>
  	<center>
  	<form:form action="user/login" method="post" modelAttribute="auser"  name = "loginform">
	<table>
		<tr>
			<td colspan="2"><img src="images/login.gif"></td>
		</tr>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="aname" class="textSize"/></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="apwd" class="textSize"/></td>
		</tr>		
			
		
		<tr>
			<td height="50" colspan="3">
				<input type="button" name="button" onclick="gogo()" value="登录" class="my_ann1" />
				<input type="button" name="button" onclick="cancel()" value="重置" class="my_ann1" />
			</td>	
		</tr>
	</table>
	</form:form>
	</center>
  </body>
</html>
