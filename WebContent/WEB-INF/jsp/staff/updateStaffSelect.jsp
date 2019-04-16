<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<form:form modelAttribute="staff"  method="post" action="staff/selectStaffCon?act=update">
	 <fieldset>
	  <legend>修改员工</legend>
        <p>
            <label>员工名:</label>
            <form:input path="sname"/>
        </p>
        <p>
            <label>部门名：</label>
           <form:select path="depart_id"> 
           		<option value="0"/>选择部门
                <form:options items="${departs }" itemValue="id" itemLabel="dname"/>
            </form:select>
        </p>
         <p>
         	<input type="submit" value="查询"/>
         </p>
        </fieldset>
	</form:form>
	<c:if test="${staffs.size() == 0 }">
		您还没有岗位。
	</c:if>
	<c:if test="${staffs.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">ID</th>
				<th width="200px">员工名称</th>
				<th width="200px">所在部门</th>
				<th width="200px">岗位名称</th>
				<th width="100px">操作</th>
			</tr>
			<c:forEach items="${staffs }" var="staff">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${staff.id }</td>
					<td>${staff.sname }</td>
					<td>${staff.dname }</td>
					<td>${staff.pname }</td>
					<td><a href="staff/selectAStaff?id=${staff.id }&act=update" >修改</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>