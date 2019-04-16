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
<form:form modelAttribute="apost"  method="post" id="form1">
    <fieldset>
        <legend>修改一个岗位</legend>
        <p>
            <label>岗位名:</label>
            <form:hidden path="id"/>
            <form:input path="pname"/>
        </p>
        <p>
            <label>岗位类型：</label>
            <form:select path="ptype"> 
                <form:options items="${ptypes }"/>
            </form:select>
        </p>
        <p>
            <label>编制人数:</label>
           <form:input path="organization"/>
        </p>
        <p id="buttons">
            <input id="reset" type="reset">
            <input id="submit" type="button" onclick="submitJson('form1','post/updatePost', '修改成功！')" value="修改">
        </p>
    </fieldset>
</form:form>
</body>
</html>