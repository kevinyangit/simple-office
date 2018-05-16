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

<title>My JSP 'indexNewsU.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="style/css.css" rel="stylesheet" type="text/css" />
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
		<div class="left" s>
			<div class="card shadow">
				<a href="#" class="select">新闻</a>
			</div>
			<div class="box1 shadow" style="height:70%">
				<table class="mySubmit ">
					<tr>
						<th width="40%">标题</th>
						<th width="30%">作者</th>
						<th width="30%">发送时间</th>
					</tr>
					<c:forEach var="list" items="${findNewsList}">
						<tr>
							<td><a href="newsContext.do?id=${list.id}">${list.newsname}</a></td>
							<td>${list.author}</td>
							<td>${list.date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	<div class="foot">Copyright © 2012 itmag.com All rights reserved.
		| 苏ICP备12067872号</div>
</body>
</html>

