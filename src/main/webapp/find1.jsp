<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>地铁查询系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<Link href="css/tab.css" rel="stylesheet">
<script src="js/tab.js"></script>
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	function post_data() {
		// ajax数据提交代码
		//首先使用val()方法获取id为text文本框的内容
		//并赋予给value变量
		var value = $("#stopname2").val();
		//定义ajax()
		$.ajax({
			//tyep:设置提交方式（get|post）
			type : "post",
			//url:提交到那个servlet，这里写它的路径
			url : "./servlet",
			//data:定义数据,以键值对的方式放在大括号里
			data : {
				stopname : value
			},

		});
	}
</script>

</head>

<body background="img/2.jpg">

	<div class="index-head">地铁查询系统</div>
	<div id="tabDiv" style="width: 1000px">

		<div id="tabsHead">
			<a id="tabs1" class="curtab"
				href="javascript:showTab('tabs1','tabContent1')">线路查询</a> <a
				id="tabs2" class="tabs"
				href="javascript:showTab('tabs2','tabContent2')">站点查询</a> <a
				id="tabs3" class="tabs"
				href="javascript:showTab('tabs3','tabContent3')">起点-终点查询</a>
		</div>

		<div id="tabContent1" style="display: block" class="iform">

			<form action="${pageContext.request.contextPath}/servlet"
				method="post">
				请输入线路: <input type="text" name="line"
					style="width: 300px; height: 30px" /> <input name="method"
					value="find1" type="hidden"> <input type="submit"
					value="查询" style="width: 45px; height: 30px" onclick="check();" />
			</form>

			<table border="1" class="table-show">
				<tr>
					<th colspan=3>线路所有站点</th>
				</tr>
				<tr>

					<c:forEach items="${stop}" var="user" varStatus="status">

						<td>${user}</td>
						<c:if test="${status.count % 3 == 0}">
				</tr>
				<tr>
					</c:if>

					</c:forEach>
				<tr>
			</table>


		</div>
		<div id="tabContent2" style="display: none" class="iform">

			<form onsubmit="return post_data()">
				请输入站点：<input type="text" name="stopname" id="stopname2"
					style="width: 300px; height: 30px" /> <input type="hidden"
					name="method" value="find3"> <input type="submit"
					value="查询" style="width: 45px; height: 30px" />
			</form>


			<table border="1" class="table-show" id="table-shou">
				<tr>
					<th>线路所有站点</th>
				</tr>
				<tr>

					<c:forEach items="${stop3}" var="user" varStatus="status">
						<tr>
							<td>${user}</td>
						</tr>
					</c:forEach>
				<tr>
			</table>

		</div>
		<div id="tabContent3" style="display: none" class="iform">

			<form action="#" method="post" onsubmit="return check();">
				起始站：<input type="text" name="startstopname" id="startstopname"
					style="width: 200px; height: 30px" /> 终点站：<input type="text"
					name="endstopname" id="endstopname"
					style="width: 200px; height: 30px" /> <input type="submit"
					value="查询" style="width: 45px; height: 32px" onclick="check();" />
				<input type="hidden" name="method" value="find2">
			</form>

		</div>
	</div>
</body>
</html>
