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
<form:form modelAttribute="transfer"  method="post" action="transfer/selectTransferCon">
	 <fieldset>
	   <legend>查询调动员工</legend>
	    <p>
            <label>员工编号:</label>
            <form:input path="staff_id"/>
        </p>
        <p>
            <label>员工名:</label>
            <form:input path="sname"/>
        </p>
        <p>
            <label>调动类型：</label>
           <form:select path="ttype"> 
           		<option value=""/>选择类型
                <form:options items="${ttype }"/>
            </form:select>
        </p>
         <p>
           <label>查询开始日期：</label>
		   <form:input path="startdate"  cssClass="laydate-icon" id="demo1"/>
		   <label>查询结束日期：</label>
		    <form:input path="enddate"  cssClass="laydate-icon" id="demo2"/>
		</p>
         <p>
         	<input type="submit" value="查询"/>
         </p>
        </fieldset>
	</form:form>
	<c:if test="${transfers.size() == 0 }">
		您还没有调动员工。
	</c:if>
	<c:if test="${transfers.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">员工编号</th>
				<th width="100px">员工名称</th>
				<th width="100px">调动类型</th>
				<th width="100px">调动前岗位</th>
				<th width="100px">调动后岗位</th>
				<th width="150px">调动时间</th>
				<th width="150px">操作时间</th>
			</tr>
			<c:forEach items="${transfers }" var="transfer">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${transfer.staff_id }</td>
					<td>${transfer.sname }</td>
					<td>${transfer.ttype }</td>
					<td>${transfer.beforepost_name }</td>
					<td>${transfer.afterpost_name }</td>
					<td>${transfer.tdate1 }</td>
					<td>${transfer.opdate1 }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
<script type="text/javascript" src="js/calendar/laydate.js"></script>
<script type="text/javascript">
        !function(){
            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
            laydate({elem: '#demo1'});//绑定元素
            laydate({elem: '#demo2'});//绑定元素
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
</html>