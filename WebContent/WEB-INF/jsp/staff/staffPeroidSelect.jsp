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
<form:form modelAttribute="staff"  method="post" action="staff/selectStaffCon?act=peroid">
	 <fieldset>
	  <legend>试用期管理</legend>
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
            <label>岗位名：</label>
           <form:select path="post_id"> 
           		<option value="0"/>选择岗位
                <form:options items="${posts }" itemValue="id" itemLabel="pname"/>
            </form:select>
        </p>
         <p>
            <label>试用期状态：</label>
           <form:select path="status"> 
           		<option value=""/>选择状态
                <form:options items="${status }"/>
            </form:select>
        </p>
        <p>
           <label>试用开始日期：</label>
		   <form:input path="startdate"  cssClass="laydate-icon" id="demo1"/>
		   <label>试用结束日期：</label>
		    <form:input path="enddate"  cssClass="laydate-icon" id="demo2"/>
		</p>
	
         <p>
         	<input type="submit" value="查询"/>
         </p>
        </fieldset>
	</form:form>
	<c:if test="${staffs.size() == 0 }">
		您还没有试用期员工。
	</c:if>
	<c:if test="${staffs.size() != 0 }">
		<table border="1" bordercolor="PaleGreen">
			<tr>
				<th width="100px">ID</th>
				<th width="100px">员工名称</th>
				<th width="100px">所在部门</th>
				<th width="100px">岗位名称</th>
				<th width="100px">试用期状态</th>
				<th width="300px">试用期区间</th>
				<th width="200px">操作</th>
			</tr>
			<c:forEach items="${staffs }" var="staff">
				<tr onmousemove="changeColor(this)" onmouseout="changeColor1(this)">
					<td>${staff.id }</td>
					<td>${staff.sname }</td>
					<td>${staff.dname }</td>
					<td>${staff.pname }</td>
					<td>${staff.status }</td>
					<td>${staff.startdate1 }至${staff.enddate1 }</td>
					<td>
					<c:if test="${staff.status == '正常' }">
						<a href="javaScript:testJson('${staff.id }','ok')" >转正</a>
						&nbsp;&nbsp;
						<a href="javaScript:testJson('${staff.id }','delay')" >延期</a>
						&nbsp;&nbsp;
						<a href="javaScript:testJson('${staff.id }','no')" >不录用</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
<script type="text/javascript" src="js/calendar/laydate.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function testJson(id, act1) {
	$.ajax({
		//请求路径
		url : "staff/peroidOp",
		//请求类型
		type : "post",
		//data表示发送的数据，这里传递两个参数数据
		data : {id:id,act:act1},
		//成功响应的结果
		success : function(data){
			 alert("修改成功！");
			 window.location.href="http://localhost:8080/pmanagement/" + data;
		},
        error : function() {
            alert("处理异常！");
        }
	});
}

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