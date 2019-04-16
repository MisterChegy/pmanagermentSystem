<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form:form modelAttribute="staff" method="post" id="form1">
<table style="text-align: center;">
	<caption>录入员工信息</caption>
	<tr>
		<td><font color="red">*</font>姓名</td>
		<td><form:input path="sname"/></td>
		<td><font color="red">*</font>性别</td>
		<td>
			<form:select path="sex"> 
                <form:options items="${sex }"/>
            </form:select>
		</td>
		<td><font color="red">*</font>出生日期</td>
		<td>
			<form:input path="birthday"  cssClass="laydate-icon" id="demo1"/>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>身份证号</td>
		<td><form:input path="sid"/></td>
		<td><font color="red">*</font>部门</td>
		<td>
			<form:select path="depart_id"> 
                <form:options items="${departs }" itemValue="id" itemLabel="dname"/>
            </form:select>
		</td>
		<td><font color="red">*</font>岗位</td>
		<td>
			<form:select path="post_id"> 
                <form:options items="${posts }" itemValue="id" itemLabel="pname"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>入职日期</td>
		<td><form:input path="entrydate"  cssClass="laydate-icon" id="demo2"/></td>
		<td><font color="red">*</font>参加工作日期</td>
		<td><form:input path="joinworkdate"  cssClass="laydate-icon" id="demo3"/></td>
		<td><font color="red">*</font>用工形式</td>
		<td>
			<form:select path="workform"> 
                <form:options items="${workform }"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>人员来源</td>
		<td>
			<form:select path="staffsource"> 
                <form:options items="${staffsource }"/>
            </form:select>
		</td>
		<td>政治面貌</td>
		<td>
			<form:select path="politicalstatus"> 
				<option value=""/>选择政治面貌
                <form:options items="${politicalstatus }"/>
            </form:select>
		</td>
		<td>民族</td>
		<td>
			<form:select path="nation"> 
				<option value=""/>选择民族
                <form:options items="${nation }"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td>籍贯</td>
		<td><form:input path="nativeplace"/></td>
		<td>联系电话</td>
		<td><form:input path="stel"/></td>
		<td>电子邮件</td>
		<td><form:input path="semail"/></td>
	</tr>
	<tr>
		<td>身高</td>
		<td><form:input path="sheight"/></td>
		<td>血型</td>
		<td>
			<form:select path="bloodtype"> 
				<option value=""/>选择血型
                <form:options items="${bloodtype }"/>
            </form:select>
		</td>
		<td>婚姻状况</td>
		<td>
			<form:select path="maritalstatus"> 
				<option value=""/>选择婚姻状况
                <form:options items="${maritalstatus }"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td>户口所在地</td>
		<td><form:input path="registeredresidence"/></td>
		<td>最高学历</td>
		<td>
			<form:select path="education"> 
				<option value=""/>选择最高学历
                <form:options items="${education }"/>
            </form:select>
		</td>
		<td>最高学位</td>
		<td>
			<form:select path="degree"> 
				<option value=""/>选择最高学位
                <form:options items="${degree }"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td>毕业院校</td>
		<td><form:input path="university"/></td>
		<td>所学专业</td>
		<td><form:input path="major"/></td>
		<td>毕业日期</td>
		<td><form:input path="graduationdate"  cssClass="laydate-icon" id="demo4"/></td>
	</tr>
	<tr>
		<td>试用开始日期</td>
		<td><form:input path="startdate"  cssClass="laydate-icon" id="demo5"/></td>
		<td>试用结束日期</td>
		<td><form:input path="enddate"  cssClass="laydate-icon" id="demo6"/></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6">
			<input type="button" onclick="submitJson('form1','staff/addStaff', '录入员工成功！')" value="录入"/>
			<input type="reset" value="重置"/>
		</td>
	</tr>
</table>
</form:form>
<script type="text/javascript" src="js/calendar/laydate.js"></script>
<script type="text/javascript">
        !function(){
            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
            laydate({elem: '#demo1'});//绑定元素
            laydate({elem: '#demo2'});//绑定元素
            laydate({elem: '#demo3'});//绑定元素
            laydate({elem: '#demo4'});//绑定元素
            laydate({elem: '#demo5'});//绑定元素
            laydate({elem: '#demo6'});//绑定元素
        }();
        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY-MM-DD',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16', //最大日期
            istime: true,
            istoday: false,
            choose: function(datas){
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY-MM-DD',
            min: laydate.now(),
            max: '2099-06-16',
            istime: true,
            istoday: false,
            choose: function(datas){
                start.max = datas; //结束日选好后，充值开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);
        //自定义日期格式
        laydate({
            elem: '#test1',
            format: 'YYYY年MM月DD日',
            festival: true, //显示节日
            choose: function(datas){ //选择日期完毕的回调
                alert('得到：'+datas);
            }
        });
        //日期范围限定在昨天到明天
        laydate({
            elem: '#hello3',
            min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
            max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
        });
    </script>

</body>

</html>