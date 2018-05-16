<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%    
             if(session.getAttribute("username") == null) {      
   %>    
          <script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
            location.href="login.jsp";  
           </script>   
   <%    
       }    
   %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userManage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="style/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function update() {
		var id = $("#id").val();
		var username = $("#username").val();
		var sex = $("#sex").val();
		var age = $("#age").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var gonghao = $("#gonghao").val();
		var name = $("#name").val();
		$.post("updateUserInfo.do", {
			id : id,
			'username' : username,
			'gonghao' : gonghao,
			'name' : name,
			'sex' : sex,
			'age' : age,
			'email' : email,
			'phone' : phone,
		}, function(result) {
			if (result == "true") {
				alert("修改成功！");
				location.href="userInfo.do";
			}
		});
	}
</script>
</head>
<body>
	<p>&nbsp;</p>
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
				<!-- <a href="#" class="select">求职档案</a><a href="#">伯乐档案</a></div> -->
				<!-- 一条记录 开始 -->
				<div class="box1 shadow">
					<div class="tit">
						<h2>个人信息</h2>
						<div class="titText"></div>
					</div>
					<input type="hidden" id="id" name="id"
						style="height:40px;width:200px;" value="${userInfo[0].id }">
					用户名：<input type="text" id="username" name="username"
						style="height:40px;width:200px;" value="${userInfo[0].username }">
					工&nbsp;&nbsp;&nbsp;号：<input
						type="text" id="gonghao" style="height:40px;width:200px;"
						value="${userInfo[0].gonghao }"><br>
					 姓&nbsp;&nbsp;&nbsp;名：<input
						type="text" id="name" style="height:40px;width:200px;"
						value="${userInfo[0].name }">
					性&nbsp;&nbsp;&nbsp;别：<input type="text" id="sex"
						style="height:40px;width:200px;" value="${userInfo[0].sex }"><br>
					<br> 年&nbsp;&nbsp;&nbsp;龄：<input type="text" id="age"
						style="height:40px;width:200px;" value="${userInfo[0].age }">
					邮&nbsp;&nbsp;&nbsp;箱：<input type="text" id="email"
						style="height:40px;width:200px;" value="${userInfo[0].email }">
					<br> <br> 电&nbsp;&nbsp;&nbsp;话：<input type="text"
						id="phone" style="height:40px;width:200px;"
						value="${userInfo[0].phone }"> <br> <br> <input
						type="button" name="submit" value="提交"
						style="height:40px;width:50px;margin-left:45%" onClick="update()">
					<!--  <table class="myInfo">
                <tr>
                    <th>姓名：</th>
                    <td> 2012年8月1日</td>
                    <th>性别</th>
                    <td>男</td>
                </tr>
                <tr>
                    <th>现居住地：</th>
                    <td>南京市鼓楼区</td>
                    <th>工作年限</th>
                    <td>二年以上</td>
                </tr>
                <tr>
                    <th>出生日期：</th>
                    <td>戴光浩</td>
                    <th>学历</th>
                    <td>初中</td>
                </tr>
                <tr>
                    <th>联系电话：</th>
                    <td>13565657878</td>
                    <th>专业</th>
                    <td>计算机系</td>
                </tr>
            </table>
        </div>
        一条记录 结束
        
        一条记录 开始
        <div class="box1 shadow">
        	<div class="tit">
            	<h2>简历信息</h2>
                <div class="titText"></div>
        	</div>    
            <table class="myInfo">
                <tr>
                    <th>技能特长：</th>
                    <td> 2012年8月1日</td>
                </tr>
                <tr>
                    <th>工作心得：</th>
                    <td>南京市鼓楼区</td>
                </tr>
                <tr>
                    <th>简厅附件：</th>
                    <td>戴光浩</td>
                </tr>
            </table> -->
				</div>
				<!-- 一条记录 结束 -->

				<!-- 一条记录 开始 -->
				<!-- 一条记录 结束 -->

				<!-- 一条记录 开始 -->
				<!-- 一条记录 结束 -->
			</div>
		</div>
		<!-- <div class="foot">Copyright © 2012 itmag.com All rights reserved. | 苏ICP备12067872号 </div> -->
</body>
</html>
