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
						<h2>公司信息</h2>
						<div class="titText"></div>
					</div>
					<br><p><h1>华为是谁？</h1></p>

                                                     <h3>华为是全球领先的信息与通信技术(ICT)解决方案供应商，专注于ICT领域，坚持稳健经营、持续创新、开放合作，在电信运营商、企业、
                                                     终端和云计算等领域构筑了端到端的解决方案优势，为运营商客户、企业客户和消费者提供有竞争力的ICT解决方案、产品和服务，并致力于使能未来信息社会、
                                                     构建更美好的全联接世界。目前，华为约有18万名员工，业务遍及全球170多个国家和地区，服务全世界三分之一以上的人口。</h3>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<div class="foot">Copyright © 2018 itmag.com All rights reserved.
	</div>
</body>
</html>

