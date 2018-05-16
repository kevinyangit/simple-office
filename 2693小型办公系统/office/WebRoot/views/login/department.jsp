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
						<h2>部门信息</h2>
						<div class="titText"></div>
					</div>
					<br>
					<p>
					<h1>财务部</h1>
					</p>

					<h3>财务部是指在本机构一定的整体目标下，关于资产的购置（投资），资本的融通（筹资）和经营中现金流量（营运资金），以及利润分配的管理的部门。
						财务部（Financial Management Department），企业、事业机构设立的职能部门，负责本机构的财务管理。</h3>
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

