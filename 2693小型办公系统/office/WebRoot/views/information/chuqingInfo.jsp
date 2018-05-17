<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <title>申请内容</title>
    
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
	function agree(id){
			$.post("updateChuqing.do",{
				id:id,
				'status':'同意',
			},function(result){
				if(result == "true"){
					alert("审批成功！");
					window.location.href="chuqingList.do";
				}
			})
	}
	function reject(id){
			$.post("updateChuqing.do",{
				id:id,
				'status':'不同意',
			},function(result){
				if(result == "true"){
					alert("审批成功！");
					window.location.href="chuqingList.do";
				}
			})
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
    <div class="left" >
     <div class="card shadow">
	    <div class="box1 shadow" style="height:70%">
        	<div class="tit">
            	<h3>申请内容</h3>
        	</div>    
            <table class="TB2">
                <tr>
                    <th>申请类型：</th>
                    <td>
                    <input type="text" id="shengqingtype" value="${chuqingInfo[0].chuqingtype }">
                    </td>
                </tr>
                  <tr>
                    <th>申请时间范围：</th>
                    <td><input type="text" id="timeranges" value="${chuqingInfo[0].timeranges }"></td>
                </tr>
                <tr>
                    <th>申请理由：</th>
                    <td><textarea id="context" class="TB2Textarea">${chuqingInfo[0].context }</textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<hr class="line" />
                        <a href="javascript:void(0);" class="TB2Btn1" onclick="agree(${chuqingInfo[0].id })">同意</a>
                        <a href="javascript:void(0);" class="TB2Btn1" onclick="reject(${chuqingInfo[0].id })">不同意</a>
                        </td>
                </tr>
            </table>
        </div>
	</div>
	</div>
</div>
<div class="foot">Copyright © 2012 itmag.com All rights reserved. | 苏ICP备12067872号 </div>
</body>
</html>
</html>
