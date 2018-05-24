<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8" />
		<c:set var="domain" value="${pageContext.request.contextPath}"></c:set>
		<link rel="apple-touch-icon" sizes="76x76"
			href="${domain}/assets/img/apple-icon.png">
		<link rel="icon" type="image/png" sizes="96x96"
			href="${domain}/assets/img/favicon.png">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

		<title></title>

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
		<link href="${domain}/assets/css/themify-icons.css" rel="stylesheet">

	</head>
	<body>

		<div class="wrapper">


			<div class="main-panel">



				<div class="content">
					<div style="padding-left: 20px; padding-right: 20px">
						<form>
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label>
											用户名
										</label>
										   <select class="form-control" placeholder="用户名" id="account">
									    </select>
						<!-- 				<input type="text" class="form-control border-input"
											placeholder="用户名" id="account"> -->
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>
											年份
										</label>
										<input type="text" class="form-control border-input"
											placeholder="年份" id="year" value="2018">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>
											月份
										</label>
										<select name="month" id="month"
											class="form-control border-input">
											<option value="01">
												一月份
											</option>
											<option value="02">
												二月份
											</option>
											<option value="03">
												三月份
											</option>
											<option value="04">
												四月份
											</option>
											<option value="05">
												五月份
											</option>
											<option value="06">
												六月份
											</option>
											<option value="07">
												七月份
											</option>
											<option value="08">
												八月份
											</option>
											<option value="09">
												九月份
											</option>
											<option value="10">
												十月份
											</option>
											<option value="11">
												十一月份
											</option>
											<option value="12">
												十二月份
											</option>
										</select>
										<!-- input type="text" class="form-control border-input"
											placeholder="月份" id="month"-->
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>
											基本工资
										</label>
										<input type="text" class="form-control border-input"
											placeholder="基本工资" id="jibensalary">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>
											绩效工资
										</label>
										<input type="text" class="form-control border-input"
											placeholder="绩效工资" id="jixiaosalary">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>
											请假天数
										</label>
										<input type="text" class="form-control border-input"
											placeholder="请假天数, 鼠标离开后会自动获取" id="qingJiaDate">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>
											扣钱单价
										</label>
										<input type="text" class="form-control border-input"
											placeholder="扣钱单价" id="kouQian" >
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label>
											合计
										</label>
										<input type="text" class="form-control border-input"
											placeholder="合计,鼠标离开后会自动获取" id="total">
									</div>
								</div>
							</div>




							<div class="text-center">
								<button type="button" class="btn btn-info btn-fill btn-wd"
									onclick="update()">
									提交
								</button>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>



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
	//初始化用户列表
	function initUserList(){
		$.post("${domain}//user/list.do",{
		},function(result){
			if(result.code== 0){
				if(result.data != null){
					for (var i = 0; i < result.data.length; i++) {
						$('.form-group #account').append("<option value='" + result.data[i].username + "'>" +result.data[i].username  + "</option>")
					}
				}
			}else{
				console.log('system error');
			}
		})
	}
	initUserList();
	function update(){
			var username = document.getElementById("account").value;
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var jibensalary = document.getElementById("jibensalary").value;
			var jixiaosalary = document.getElementById("jixiaosalary").value;
			var qingJiaDate = document.getElementById("qingJiaDate").value;
			var kouQian = document.getElementById("kouQian").value;
			var total = document.getElementById("total").value;
			if(total = null || total ==''){
				layer.msg('工资合计不能为空!',{icon: 2,time:2000});
			}
			$.post("${domain}/insertSalary.do",{
				'username' : username,
				'year' : year,
				'month' : month,
				'jibensalary':jibensalary,
				'jixiaosalary' : jixiaosalary,
				'qingJiaDate' : qingJiaDate,
				'kouQian' : kouQian,
				'total' : total
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
	
	//初始化请假天数
	$(".form-group #qingJiaDate").blur(initQingJiaDate);
	//$(".form-group #month").change(initQingJiaDate);
	
	function initQingJiaDate() {
		var year = $('#year').val();
		var month =$('#month').val();
		var username = document.getElementById("account").value;

		var monthStr = year + "-" + month;
		$.post("${domain}/chuqing/day.do",{
			'username': username,
			'monthStr': monthStr
		},function(result){
			if(result.code== 0){
				if(result.data != null){
					$('#qingJiaDate').val(result.data);
				}else{
					$('#qingJiaDate').val('');
				}
			}else{
				console.log('system error');
			}
		})
	  }
	//初始化合计
	//$('#kouQian').blur(initTotal);
	$('#total').blur(initTotal);
	
	function initTotal(){
		var jibensalary = document.getElementById("jibensalary").value;
		var jixiaosalary = document.getElementById("jixiaosalary").value;
		var qingJiaDate = $('#qingJiaDate').val();
		var kouQian = $('#kouQian').val();
		var total = (parseInt(jibensalary) + parseInt(jixiaosalary)) - (qingJiaDate * kouQian );
		$('#total').val(total);
	}
	
	</script>
</html>
