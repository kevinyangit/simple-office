<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<c:choose>
 <c:when test="${status=='员工' }">
		<%@include file="/headerUser.jsp"%>
		</c:when>
<c:otherwise>
<%@include file="/headerCompany.jsp"%>
</c:otherwise>
</c:choose>
	<div class="main">
		<div class="left">
			<div class="card shadow">
				<a href="index.jsp" class="select">公司信息</a><a href="views/login/department.jsp">部门信息</a><a
					href="views/login/asset.jsp">公司资产</a><a href="views/login/phone.jsp">通讯录</a>

				<div class="box1 shadow" style="height:70%;">
					<div class="tit">
						<h2>公司资产</h2>
						<div class="titText"></div>
					</div>
					<br>
					<p>
					<h1>资产信息</h1>
					</p>

					<h3>创业团队财富人民币18.53亿元
						(创始人5人、张志东、曾李青、许晨晔、陈一丹)毕业院校：深圳大学如果看到他的名片上印有QQ号，估计已经不会有人感到吃惊。

						但是与大学同窗张志东共同创建腾讯公司、摆弄“网络中文寻呼机”时，马化腾肯定不会想到现在的腾讯QQ会发展到如此规模。当年举步维艰之时，马化腾曾开价十万元人民币将QQ转让，却因开价过高而遭到广东电信的舍弃。正是广东电信的“不识货”，也给了他在6年里打造出一个QQ王国神话的机会。凭着这个小小的即时通讯软件在4年间做到销售过亿元，撰写了一幕深圳版的硅谷传奇。</h3>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class="foot">Copyright © 2012 itmag.com All rights reserved.
		| 苏ICP备12067872号</div>
</body>
</html>

