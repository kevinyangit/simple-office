<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	if (session.getAttribute("adminname") == null) {
%>
<script type="text/javascript" language="javascript">        
            alert("您还没有登录，请登录...");   
           location.href="views/admin/adminLogin.jsp";  
           </script>
<%
	}
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
		<link rel="apple-touch-icon" sizes="76x76"
			href="${domain}/${domain}/assets/img/apple-icon.png">
		<link rel="icon" type="image/png" sizes="96x96"
			href="${domain}/${domain}/assets/img/favicon.png">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title>用户管理</title>

		<meta
			content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
			name='viewport' />
		<meta name="viewport" content="width=device-width" />


		<!-- Bootstrap core CSS     -->
		<link href="${domain}/assets/css/bootstrap.min.css" rel="stylesheet" />

		<!-- Animation library for notifications   -->
		<link href="${domain}/assets/css/animate.min.css" rel="stylesheet" />

		<!--  Paper Dashboard core CSS    -->
		<link href="${domain}/assets/css/paper-dashboard.css" rel="stylesheet" />

		<!--  CSS for Demo Purpose, don't include it in your project     -->
		<link href="${domain}/assets/css/demo.css" rel="stylesheet" />

		<!--  Fonts and icons     -->
		<link
			href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
			rel="stylesheet">
		<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
			rel='stylesheet' type='text/css'>
		<link href="${domain}/assets/css/themify-icons.css" rel="stylesheet">

	</head>
	<body>

		<div class="wrapper">
			<%@include file="/left.jsp"%>
			<div class="main-panel">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar bar1"></span>
							<span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#">用户列表</a>
					</div>
					<div class="collapse navbar-collapse">

					</div>
				</div>
				</nav>


				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="header">
										<p class="category">
											请选择你要进行的操作
										</p>
										<h4 class="title">
											<button class="btn btn-info btn-fill " onclick="add()">
												增加
											</button>
										</h4>
									</div>
									<div class="content table-responsive table-full-width">
										<table class="table table-striped">
											<thead>

												<th  style=" display:none">
													编号ID
												</th>
												<th>
													会员昵称
												</th>
												<th>
													密码
												</th>
												<th>
													工号
												</th>
												<th>
													姓名
												</th>
												<th>
													性别
												</th>
												<th>
													年龄
												</th>
												<th>
													联系方式
												</th>
												<th>
													邮箱
												</th>
												<th>
													职位
												</th>
												<th style="width: 100px;text-align: center;">
													编辑
												</th>
												<th style="width: 100px;text-align: center;">
													刪除
												</th>
											</thead>
											<tbody>
												<c:forEach var="list" items="${finduserList}">
													<tr>
													    <td  style=" display:none">
															${list.id}
														</td>
														<td>
															${list.username}
														</td>
														<!-- <td>${list.password}</td> -->
														<td>
															****
														</td>
														<td>
															${list.gonghao}
														</td>
														<td>
															${list.name}
														</td>
														<td>
															${list.sex}
														</td>
														<td>
															${list.age}
														</td>
														<td>
															${list.phone}
														</td>
														<td>
															${list.email}
														</td>
														<td>
															${list.status}
														</td>
														<td  style="text-align: center;" >
															<button class="btn btn-primary btn-fill " 
																onclick="">
																编辑
															</button>
														</td >
														<!--  button class="btn btn-danger btn-fill " onclick="update(${list.id})">编辑</button-->
														<td  style="text-align: center;"> 
															<button class="btn btn-danger btn-fill "
																onclick="del(${list.id})">
																删除
															</button>
														</td>

													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>
								</div>
							</div>





						</div>
					</div>
				</div>

				<footer class="footer">
				<div class="container-fluid">
					<div class="copyright">
						Copyright &copy; 2018.Company name All rights reserved.
						<a target="_blank" href="javascript:">abcd</a>
					</div>
				</div>
				</footer>


			</div>
		</div>


	</body>

	<!--   Core JS Files   -->
	<script src="${domain}/assets/js/jquery-1.10.2.js"
		type="text/javascript"></script>
	<script src="${domain}/assets/js/bootstrap.min.js"
		type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="${domain}/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="${domain}/assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="${domain}/assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>--->

	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="${domain}/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="${domain}/assets/js/demo.js"></script>
	<script src="${domain}/js/layer.js"></script>
	<script type="text/javascript">
function add(){
	parent.layer.open({
    type: 2,
    shadeClose: true,
    shade: 0.8,
    area: ['450px', '75%'],
    content: 'views/admin/addUser.jsp',
    end: function () {
       location.reload();
    }
});
}

function del(id){
	layer.confirm('确认要删除这位求职者吗？',function(index){
			$.ajax({
				type: 'get',
				url: '${domain }/deluser.do',
				data: {id : id},
				success: function(data){
					layer.msg('删除成功!',{icon: 1,time:2000});
					setTimeout(function(){
						location.reload();
					},2000)
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
}

function update(id){
	parent.layer.open({
	    type: 2,
	    shadeClose: true,
	    shade: 0.8,
	    area: ['450px', '75%'],
	    content: '${domain }/upUser.do?id='+id,
	    end: function () {
	       //window.location.href='views/sys/userTable.jsp';
	       location.reload();
	    }
	});
}
</script>

</html>
