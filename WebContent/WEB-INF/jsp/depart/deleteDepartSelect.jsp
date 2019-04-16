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
    <title>selectGoods.jsp</title>
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
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		function changeColor(obj){
			obj.className = "bgcolor";
		}
		function changeColor1(obj){
			obj.className = "";
		}
		function checkDel(id){
  			if(window.confirm("是否删除该部门？")){
  				$.ajax({
  					//请求路径
  					url : "depart/deleteDepart",
  					//请求类型
  					type : "post",
  					//data表示发送的数据
  					data : JSON.stringify({id:id}),
  					//定义发送请求的数据格式为JSON字符串
  					contentType : "application/json;charset=utf-8",
  					//定义回调响应的数据格式为JSON字符串，该属性省略
  					//dataType : "json",
  					//成功响应的结果
  					success : function(data){
  						if(data != "fail"){
  							alert("删除成功！");
  							window.location.href="http://localhost:8080/pmanagement/" + data;
  						}else{
  							alert("有子记录不能删除！");
  						}
  					},
  			        error : function() {
  			            alert("处理异常！");
  			        }

  				});
  			}
  		}
	</script>
</head>
<body>
<form:form modelAttribute="depart"  method="post" action="depart/selectDepartCon?act=delete">
	 <fieldset>
	  <legend>删除部门</legend>
        <p>
            <label>部门名:</label>
            <form:input path="dname"/>
        </p>
        <p>
            <label>部门类型：</label>
            <form:select path="dtype"> 
            	<option value=""/>选择部门类型
                <form:options items="${dtypes }"/>
            </form:select>
        </p>
         <p>
         	<input type="submit" value="查询"/>
         </p>
        </fieldset>
	</form:form>
	<c:if test="${departs.size() == 0 }">
		您还没有部门。
	</c:if>
	<c:if test="${departs.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">ID</th>
				<th width="200px">名称</th>
				<th width="200px">类型</th>
				<th width="200px">成立日期</th>
				<th width="100px">删除</th>
			</tr>
			<c:forEach items="${departs }" var="depart">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${depart.id }</td>
					<td>${depart.dname }</td>
					<td>${depart.dtype }</td>
					<td>${depart.establishmentdate1 }</td>
					<td><a href="javascript:checkDel('${depart.id }')">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		${message }
	</c:if>
</body>
</html>