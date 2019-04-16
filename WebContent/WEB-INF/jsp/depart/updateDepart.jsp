<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form:form modelAttribute="adepart"  method="post" id="form1">
    <fieldset>
        <legend>修改一个部门</legend>
        <p>
            <label>部门名:</label>
            <form:hidden path="id"/>
            <form:input path="dname"/>
        </p>
        <p>
            <label>部门类型：</label>
            <form:select path="dtype"> 
                <form:options items="${dtypes }"/>
            </form:select>
        </p>
        <p>
            <label>电话:</label>
           <form:input path="dtel"/>
        </p>
        <p>
            <label>传真:</label>
           <form:input path="dfax"/>
        </p>
        <p>
            <label>描述:</label>
            <form:textarea path="description" rows="5"/>
        </p>
        <p>
            <label>上级部门:</label>
            <form:select path="supdepartment"> 
                <option value="0"/>请选择上级部门
                <form:options items="${supDeparts }" itemLabel="dname" itemValue="id"/>
            </form:select>
        </p>
        <p id="buttons">
            <input id="reset" type="reset">
            <input id="submit" type="button" onclick="submitJson('form1','depart/updateDepart', '修改成功！')" value="修改">
        </p>
    </fieldset>
</form:form>
</body>
</html>