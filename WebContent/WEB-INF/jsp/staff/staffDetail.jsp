<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
<title>Insert title here</title>
<link href="css/common.css" type="text/css" rel="stylesheet">
</head>
<body>
<table style="text-align: center; border-collapse: collapse;" border="1">
	<caption>录入员工信息</caption>
	<tr>
		<td>姓名</td>
		<td>${astaff.sname }</td>
		<td>性别</td>
		<td>
			${astaff.sex }
		</td>
		<td>出生日期</td>
		<td>
			${astaff.birthday1 }
		</td>
	</tr>
	<tr>
		<td>身份证号</td>
		<td>${astaff.sid }</td>
		<td>部门</td>
		<td>
			${astaff.dname }
		</td>
		<td>岗位</td>
		<td>
			${astaff.pname }
		</td>
	</tr>
	<tr>
		<td>入职日期</td>
		<td>${astaff.entrydate1 }</td>
		<td>参加工作日期</td>
		<td>${astaff.joinworkdate1 }</td>
		<td>用工形式</td>
		<td>
			${astaff.workform }
		</td>
	</tr>
	<tr>
		<td>人员来源</td>
		<td>
			${astaff.staffsource }
		</td>
		<td>政治面貌</td>
		<td>
			${astaff.politicalstatus }
		</td>
		<td>民族</td>
		<td>
			${astaff.nation }
		</td>
	</tr>
	<tr>
		<td>籍贯</td>
		<td>${astaff.nativeplace }</td>
		<td>联系电话</td>
		<td>${astaff.stel }</td>
		<td>电子邮件</td>
		<td>${astaff.semail }</td>
	</tr>
	<tr>
		<td>身高</td>
		<td>${astaff.sheight }</td>
		<td>血型</td>
		<td>
			${astaff.bloodtype }
		</td>
		<td>婚姻状况</td>
		<td>
			${astaff.maritalstatus }
		</td>
	</tr>
	<tr>
		<td>户口所在地</td>
		<td>${astaff.registeredresidence }</td>
		<td>最高学历</td>
		<td>
			${astaff.education }
		</td>
		<td>最高学位</td>
		<td>
			${astaff.degree }
		</td>
	</tr>
	<tr>
		<td>毕业院校</td>
		<td>${astaff.university }</td>
		<td>所学专业</td>
		<td>${astaff.major }</td>
		<td>毕业日期</td>
		<td>${astaff.graduationdate1 }</td>
	</tr>
	<tr>
		<td>试用开始日期</td>
		<td>${astaff.startdate1 }</td>
		<td>试用结束日期</td>
		<td>${astaff.enddate1 }</td>
		<td>试用期状态</td>
		<td>${astaff.status }</td>
	</tr>
</table>

</body>

</html>