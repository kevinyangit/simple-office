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
    
    <title>薪水查询</title>
    
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
				<a href="rcapList.do" class="select">薪水查询</a>
	    <div class="box1 shadow" style="height:70%;">
        	<div class="tit">
            	<h3>本月薪水</h3>
        	</div> 
        	<c:choose>
        	<c:when test="${salaryList!=null && fn:length(salaryList) > 0  }">  
            <table class="TB2">
                <tr>
                    <td>编号</td>
                    <td>年份</td>
                    <td>月份</td>
                    <td>基本工资</td>
                    <td>绩效工资</td>
                    <td></td>
                </tr>
                <c:forEach items="${requestScope.salaryList }" var="item" varStatus="status"> 
                <tr>
                    <td>${status.count}</td>
                    <td>${item.year}</td>
                    <td>${item.month}</td>
                    <td>${item.jibensalary}</td>
                    <td>${item.jixiaosalary}</td>
<!--                     <td><a href="javascript:void(0);" onClick="alert('确认成功！')">确认</a></td>
 -->                </tr>
                </c:forEach>
            </table>
            </c:when>
            <c:otherwise>
            <lable>没有本月薪水信息</lable>
            </c:otherwise>
            </c:choose>
        </div>
        </div>
	</div>
</div>
<!-- <div class="foot">Copyright © 2018  All rights reserved. </div> -->
</body>
</html>
</html>
