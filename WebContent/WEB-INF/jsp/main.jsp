<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>后台主页面</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0px auto;
	height: auto;
	width: 800px;
	border: 1px solid #006633;
}

#header {
	height: 90px;
	width: 800px;
	background-image: url(images/bb.jpg);
	margin: 0px 0px 3px 0px;
}

#header h1 {
	text-align: center;
	font-family: 华文彩云;
	color: #000000;
	font-size: 30px；
}

#navigator {
	height: 25px;
	width: 800px;
	font-size: 14px;
	background-image: url(images/bb.jpg);
}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;
}
#navigator li a {
	color: #000000;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 98px;
	height: 22px;
	text-align: center;
	background-color: PaleGreen;
	margin-left: 2px;
}
#navigator li a:hover {
	background-color: #006633;
	color: #FFFFFF;
}
#navigator ul li ul {
   visibility: hidden;
   position: absolute;
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}

#content {
	height: auto;
	width: 780px;
	padding: 10px;
}

#content iframe {
	height: 500px;
	width: 780px;
}

#footer {
	height: 30px;
	width: 780px;
	line-height: 2em;
	text-align: center;
	background-color: PaleGreen;
	padding: 10px;
}
</style>
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎${auser.aname}使用人事管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li>
				<a>部门管理</a>
				<ul>
					<li><a href="depart/toAdd" target="center">新建部门</a></li>
					<li><a href="depart/selectDepart?act=update" target="center">修改部门</a></li>
					<li><a href="depart/selectDepart?act=delete" target="center">删除部门</a></li>
					<li><a href="depart/selectDepart" target="center">查询部门</a></li>
				</ul>
			</li>
			<li>
				<a>岗位管理</a>
				<ul>
					<li><a href="post/toAdd" target="center">增加岗位</a></li>
					<li><a href="post/selectPost?act=update" target="center">修改岗位</a></li>
					<li><a href="post/selectPost?act=delete" target="center">删除岗位</a></li>
					<li><a href="post/selectPost" target="center">查询岗位</a></li>
				</ul>	
			</li>
			<li>
				<a>入职管理</a>
				<ul>
					<li><a href="staff/toAdd" target="center">员工基本信息</a></li>
				</ul>
			</li>
			<li>
				<a>试用期管理</a>
				<ul>
					<li><a href="staff/selectStaff?act=peroid" target="center">试用期员工管理</a></li>
					<li><a href="staff/selectStaff?act=ok" target="center">已转正员工查询</a></li>
				</ul>
			</li>
			<li>
				<a>岗位调动管理</a>
				<ul>
					<li><a href="transfer/toTransferStaff"  target="center">岗位调动管理</a></li>
					<li><a href="transfer/selectTransferStaff" target="center">调动员工查询</a></li>
				</ul>
			</li>
			<li>
				<a>员工离职管理</a>
				<ul>
					<li><a href="quit/toQuitStaff" target="center">确定离职员工</a></li>
					<li><a href="quit/selectQuitStaff" target="center">已离职员工查询</a></li>
				</ul>
			</li>
			<li>
				<a>员工信息中心</a>
				<ul>
					<li><a href="staff/selectStaff?act=update" target="center">修改员工信息</a></li>
					<li><a href="staff/selectStaff" target="center">查询员工信息</a></li>
				</ul>
			</li>
			<li><a>报表管理</a>
				<ul>
					<li><a href="report/reportSelect?act=new" target="center">新聘员工报表</a></li>
					<li><a href="report/reportSelect?act=quit" target="center">离职员工报表</a></li>
					<li><a href="report/reportSelect?act=transfer" target="center">岗位调动报表</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="content">
		<iframe src="depart/selectDepart"  name="center" frameborder="0"></iframe>
	</div>
	<div id="footer">Copyright ©清华大学出版社</div>
</body>
</html>


