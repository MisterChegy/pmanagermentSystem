<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>selectPosts.jsp</title>
	<link href="css/common.css" type="text/css" rel="stylesheet">
	<style type="text/css">
		table{
			text-align: center;
			border-collapse: collapse;
		}
		.bgcolor{
		  	background-color: #F08080;
		}
	</style>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
	</script>
</head>
<body>
<form:form modelAttribute="post"  method="post" action="post/selectPostCon?act=update">
	 <fieldset>
	   <legend>修改岗位</legend>
        <p>
            <label>岗位名:</label>
            <form:input path="pname"/>
        </p>
        <p>
            <label>岗位类型：</label>
            <form:select path="ptype"> 
            	<option value=""/>选择岗位类型
                <form:options items="${ptypes }"/>
            </form:select>
        </p>
         <p>
         	<input type="submit" value="查询"/>
         </p>
        </fieldset>
	</form:form>
	<c:if test="${posts.size() == 0 }">
		您还没有岗位。
	</c:if>
	<c:if test="${posts.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">ID</th>
				<th width="200px">名称</th>
				<th width="200px">类型</th>
				<th width="200px">编制人数</th>
				<th width="100px">详情</th>
			</tr>
			<c:forEach items="${posts }" var="post">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${post.id }</td>
					<td>${post.pname }</td>
					<td>${post.ptype }</td>
					<td>${post.organization }</td>
					<td><a href="post/selectAPost?id=${post.id }&act=update">修改</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>