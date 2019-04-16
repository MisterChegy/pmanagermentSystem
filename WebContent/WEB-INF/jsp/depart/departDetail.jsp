<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
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
 
</head>
<body>
    <fieldset>
        <legend>部门详情</legend>
        <p>
            <label>部门名:</label>
            <label>${adepart.dname }</label>
        </p>
        <p>
            <label>部门类型：</label>
            <label>${adepart.dtype }</label>
        </p>
        <p>
            <label>电话:</label>
            <label>${adepart.dtel }</label>
        </p>
        <p>
           <label>传真:</label>
           <label>${adepart.dfax }</label>
        </p>
        <p>
            <label>描述:</label>
             <label>${adepart.description }</label>
        </p>
        <p>
            <label>上级部门:</label>
            <label>${adepart.supdepartment1 }</label>
        </p>
    </fieldset>
</body>
</html>