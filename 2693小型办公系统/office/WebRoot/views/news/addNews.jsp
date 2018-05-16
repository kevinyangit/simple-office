<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
	<link rel="apple-touch-icon" sizes="76x76" href="${domain}/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="${domain}/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title></title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="${domain}/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${domain}/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="${domain}/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${domain}/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="${domain}/assets/css/themify-icons.css" rel="stylesheet">

</head>
<body>

<div class="wrapper">
	

    <div class="main-panel">
		
        

        <div class="content"><div style="padding-left: 20px;padding-right: 20px">
             <form>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>新闻标题</label>
                                                <input type="text" class="form-control border-input"  placeholder="新闻标题"  id="account">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>作者</label>
                                                <input type="text" class="form-control border-input" placeholder="作者"  id="name">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">发表时间</label>
                                                <input type="text" class="form-control border-input" placeholder="发表时间"  id="pwd">
                                            </div>
                                        </div>
                                    </div>
									<div class="row">
									    <div class="col-md-4">
                                            <div class="form-group">
                                                <label>内容</label>
                                                <textarea rows="10" cols="60" id="age"></textarea>
                                            </div>
                                        </div>
									</div>

                                   
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd" onclick="update()">添加新闻</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form></div>
            </div>
        </div>



    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="${domain}/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="${domain}/assets/js/bootstrap.min.js" type="text/javascript"></script>

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
	function update(){
			var newsname = document.getElementById("account").value;
			var author= document.getElementById("name").value;
			var date = document.getElementById("pwd").value;
			var context = document.getElementById("age").value;
			if(newsname==""||author==""||date==""||context==""){
				layer.msg('请把信息填写完整!',{icon: 2,time:2000});   
				return false;
			}
			$.post("${domain}/insertNews.do",{
				'newsname' : newsname,
				'author' : author,
				'date' : date,
				'context' : context,
			},function(result){
				if(result=="false"){
					layer.msg('用户名已存在!',{icon: 2,time:2000});
					return false;
				}
				if(result == "true"){
					layer.msg('添加成功!',{icon: 1,time:2000});
				}
			})
	}
	</script>
</html>
