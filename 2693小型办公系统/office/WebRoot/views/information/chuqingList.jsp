<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%    
             if(session.getAttribute("username") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
            location.href="../login/login.jsp";  
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
    
    <title>出勤审批</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="style/css.css" rel="stylesheet" type="text/css" />
   <script src="js/jquery.min.js"></script>
	<script type="text/javascript">
	function deleteResume(id){
	if(confirm('确认要删除吗？')==true){
			$.ajax({
				type: 'get',
				url: 'deleteResume.do',
				data: {id : id},
				success: function(data){
					alert("删除成功！");
					setTimeout(function(){
						location.reload();
					},2000)
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		}
}
	</script>
  </head>
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
     <a href="shengqingList.do">申请记录</a>
	    <div class="box1 shadow" style="height:70%">
        	<div class="tit">
            	<h3>所有申请</h3>
        	</div> 
        	<c:choose>
        	<c:when test="${chuqingList!=null && fn:length(chuqingList) > 0  }">  
            <table class="TB2">
                <tr>
                    <td>编号</td>
                    <td>申请类别</td>
                    <td>申请时间范围</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${requestScope.chuqingList }" var="item" varStatus="status"> 
                <tr>
                    <td>${status.count}</td>
                    <td>${item.chuqingtype }</td>
                    <td>${item.timeranges }</td>
                    <td><a href="chuqingInfo.do?id=${item.id }">查看</a></td>
                </tr>
                </c:forEach>
            </table>
            </c:when>
            <c:otherwise>
            <lable>没有任何申请要审批</lable>
            </c:otherwise>
            </c:choose>
        </div>
        </div>
	</div>
</div>
<!-- <div class="foot">Copyright © 2012 itmag.com All rights reserved. | 苏ICP备12067872号 </div> -->
</body>
</html>
</html>
