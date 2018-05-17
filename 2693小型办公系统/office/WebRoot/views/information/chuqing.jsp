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
    
    <title>职位申请</title>
    
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
	function addResume(){
	var shengqingtype=$("#shengqingtype").val();
	var context=$("#context").val();
	var timeranges=$("#timeranges").val();
			if(shengqingtype==""||context==""){
				alert("请把信息填写完整!");   
				return false;
			}
			$.post("insertChuqing.do",{
			'timeranges':timeranges,
				'chuqingtype' : shengqingtype,
				'context' : context,
			},function(result){
				if(result == "true"){
					alert("申请上传成功！");
					location.href="mychuqingList.do";
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
     <a href="views/information/chuqing.jsp" class="select">添加申请</a><a href="mychuqingList.do">申请记录</a>
	    <div class="box1 shadow" style="height:70%">
        	<div class="tit">
            	<h3>请填写你的申请</h3>
        	</div>    
            <table class="TB2">
                <tr>
                    <th>申请类型：</th>
                    <td><select name="shengqingtype" id="shengqingtype">
                            <option>请假</option>
                            <option>外出</option>
                            <option>休假</option>
                    </td>
                </tr>
                <tr>
                    <th>时间范围：</th>
                    <td><input type="text" id="timeranges"></td>
                </tr>
                <tr>
                    <th>申请理由：</th>
                    <td><textarea id="context" class="TB2Textarea"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                    	<hr class="line" />
                        <a href="javascript:void(0);" class="TB2Btn1" onclick="addResume()">完成</a></td>
                </tr>
            </table>
        </div>
	</div>
	</div>
</div>
<div class="foot">Copyright © 2018  All rights reserved. </div>
</body>
</html>
</html>
