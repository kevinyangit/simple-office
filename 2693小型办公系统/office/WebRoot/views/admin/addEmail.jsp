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


     <script src="${domain}/assets/new/jquery.min.js"></script>  
	<script src="${domain}/js/layer.js"></script>
    <link href="${domain}/assets/new/bootstrap.min.css" rel="stylesheet">  
    <script src="${domain}/assets/new/bootstrap.min.js"></script>  
  
    <script src="${domain}/assets/new/moment-with-locales.min.js"></script>  
    <link href="${domain}/assets/new/bootstrap-datetimepicker.min.css"  rel="stylesheet">  
    <script src="${domain}/assets/new/bootstrap-datetimepicker.min.js"></script>  

</head>
<body>

<div class="wrapper">
	

    <div class="main-panel">
		
        

        <div class="content"><div style="padding-left: 20px;padding-right: 20px">
             <form>
                                   <div class="row">
          <!--                               <div class="col-md-6">
                                            <div class="form-group">
                                                <label>发送人</label>
                                                <input type="text" class="form-control border-input" placeholder="发送人"  id="fsperson" >
                                            </div>
                                        </div> -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>接收人</label>
                                                <input type="text" class="form-control border-input" placeholder="接收人"  id="jsperson">
                                            </div>
                                        </div>
                                        </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                            <label for="date1">选择日期：</label>  
								            <div class="input-group date" >  
								                <input type="text" class="form-control" id='time'>  
								                <span class="input-group-addon">  
								                    <i class="glyphicon glyphicon-calendar"></i>  
								                </span>  
								            </div>  
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label>邮件内容</label>
                                                <textarea rows="5" cols="55" class="form-control border-input" placeholder="邮件内容"  id="thing"></textarea>
<!--                                                 <input type="text" class="form-control border-input" placeholder="邮件内容"  id="thing">
 -->                                            </div>
                                        </div>
                                    </div>
                                    


                                   
                                    <div class="text-center">
                                        <button type="button" class="btn btn-info btn-fill btn-wd" onclick="update()">提交</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form></div>
            </div>
        </div>



    </div>
</div>


</body>

	<script type="text/javascript">
    $('#time').datetimepicker({    
        format: 'YYYY-MM-DD HH:mm:ss',    
        locale: moment.locale('zh-cn')    
    });    
	function update(){
	        //var fsperson = document.getElementById("fsperson").value;
	        var fsperson = "公司";
			var jsperson = document.getElementById("jsperson").value;
			if(null == jsperson){
			layer.msg('请填接收人!',{icon: 2,time:2000});
					return false;
			}
			var time = document.getElementById("time").value;
			var thing = document.getElementById("thing").value;
			$.post("${domain}/insertEmail.do",{
			    'fsperson' : fsperson,
				'jsperson' : jsperson,
				'time' : time,
				'context' : thing,
			},function(result){
				if(result=="false"){
					layer.msg('用户名已存在!',{icon: 2,time:2000});
					return false;
				}
				if(result == "true"){
					layer.msg('添加成功!',{icon: 1,time:2000});
					setTimeout("var index = parent.layer.getFrameIndex(window.name); parent.layer.close(index);",2000);
				}
			})
	}
	</script>
</html>
