<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%    
             if(session.getAttribute("username") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
            location.href="views/login/login.jsp";  
           </script>   
   <%    
       }    
   %> 
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
    <div class="left">
    	<div class="card shadow">
        	<a href="#" class="select">新闻</a>
        </div>
        <div class="box1 shadow" style="height:70%">
            <label style="margin-left:23%;font-size:20px;">${newsContext[0].newsname }</label><br>
            <label style="margin-left:37%;font-size:15px;">${newsContext[0].author }</label> <label style="margin-left:5%;font-size:15px;">${newsContext[0].date }</label><br>
            <label style="margin-left:10%;font-size:20px;">${newsContext[0].context }</label>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<div class="foot">Copyright © 2012 itmag.com All rights reserved. | 苏ICP备12067872号 </div>
</body>
</html>

