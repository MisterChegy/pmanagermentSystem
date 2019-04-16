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
<form:form modelAttribute="transfer" method="post" id="form1" >
<table style="text-align: center;">
	<caption>录入调动员工信息</caption>
	<tr>
		<td><font color="red">*</font>员工编号</td>
		<form:hidden path="act" id="act"/>
		<td><form:input path="staff_id" onblur="gogo()"/></td>
	</tr>
	<tr>
		<td><font color="red">*</font>员工姓名</td>
		<td><form:input path="sname" readonly="true" disabled="true"/></td>
	</tr>
	<tr>
		<td><font color="red">*</font>之前岗位</td>
		<td>
			<form:hidden path="beforepost_id"/>
			<form:input path="beforepost_name" readonly="true" disabled="true"/>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>调动后岗位</td>
		<td>
			<form:select path="afterpost_id"> 
                <form:options items="${afterpost }" itemLabel="pname" itemValue="id"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>调动类型</td>
		<td>
			<form:select path="ttype"> 
                <form:options items="${ttype }"/>
            </form:select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font>调动日期</td>
		<td>
			<form:input path="tdate"  cssClass="laydate-icon" id="demo1"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" onclick="submitQuit()" value="录入"/>
			<input type="reset" value="重置"/>
		</td>
	</tr>
</table>
</form:form>
<script type="text/javascript" src="js/calendar/laydate.js"></script>
<script type="text/javascript">
		function gogo(){
			$("#act").val("init");//给隐藏域赋值
			$.ajax({
				//请求路径
				url : "transfer/addTransferStaff",
				//请求类型
				type : "post",
				//data表示发送的数据
				data: $('#form1').serializeArray(),
				contentType : "application/x-www-form-urlencoded",
				//成功响应的结果
				success : function(data){
					if(data == "no"){
						alert("未查到员工！");
						$("#sname").val("");//清空
						$("#beforepost_id").val("");//清空
						$("#beforepost_name").val("");//清空
					}else{
						var a = data.split("|");
						$("#sname").val(a[0]);//赋值
						$("#beforepost_id").val(a[1]);//赋值
						$("#beforepost_name").val(a[2]);//赋值
					}
				},
		        error : function() {
		            alert("处理异常！");
		        }

			});
		}
		
		function submitQuit(){
			$("#act").val("");//给隐藏域赋值
			$.ajax({
				//请求路径
				url : "transfer/addTransferStaff",
				//请求类型
				type : "post",
				//data表示发送的数据
				data: $('#form1').serializeArray(),
				contentType : "application/x-www-form-urlencoded",
				//成功响应的结果
				success : function(data){
					alert("员工调动确认成功！");
					window.location.href="http://localhost:8080/pmanagement/" + data;
				},error : function() {
		            alert("处理异常！");
		        }

			});
		}
		
		
		 !function(){
	            laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	            laydate({elem: '#demo1'});//绑定元素
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