<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
//如果用户没有登录，则订单收藏等等不能查看
$(document).ready(function(){
 var username = $("#username").val();
  $("#grda").click(function(){
    if(username==null || username=="" )
           alert("请先登录！");
    else
        location.href="userInfo.do";    
  });
  $("#jlgl").click(function(){
    if(username==null || username=="" )
           alert("请先登录！");
    else
        location.href="rcapList.do";    
  });
   $("#fbqz").click(function(){
    if(username==null || username=="" )
           alert("请先登录！");
    else
        location.href="shengqingList.do";    
  });
   $("#wdkq").click(function(){
    if(username==null || username=="" )
           alert("请先登录！");
    else
        location.href="chuqingList.do";    
  });
   $("#myjy").click(function(){
    if(username==null || username=="" )
           alert("请先登录！");
    else
        location.href="salaryList.do";    
  });
});
</script>
<div class="topBg"> 
<input type="hidden" id="username" value="${sessionScope.username}">
    <div class="top layout"></div>
    <div class="nav layout">
        <a href="index.jsp" style="margin-left: 30px">首页</a>
        <a href="javascript:void(0);" id="grda">个人档案</a>
        <a href="javascript:void(0);" id="fbqz">申请审批</a>
        <a href="javascript:void(0);" id="wdkq">考勤审批</a>
        <a href="javascript:void(0);" id="jlgl">信息管理</a>
         <a href="javascript:void(0);" id="myjy">薪资查询</a>
        <a href="allNews.do">公告</a>
        <c:choose>
		<c:when test="${sessionScope.username!= null }">
		<font style="color:red">您好！<%=session.getAttribute("username")%>用户 </font>
        </c:when>
        <c:otherwise>
	   <font style="color:red"><a href="views/login/login.jsp">请登录</a></font>
	</c:otherwise>
	</c:choose>
        <a href="exit.do" class="navEnd">退出</a>
    </div>
</div>
