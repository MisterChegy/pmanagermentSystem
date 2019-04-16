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
        <legend>岗位详情</legend>
        <p>
            <label>岗位名:</label>
            <label>${apost.pname }</label>
        </p>
        <p>
            <label>岗位类型：</label>
            <label>${apost.ptype }</label>
        </p>
        <p>
            <label>编制人数:</label>
            <label>${apost.organization }</label>
        </p>
    </fieldset>
</body>
</html>