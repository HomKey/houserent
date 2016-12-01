<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${basePath}/resources/js/bootstrap/css/bootstrap.min.css">
    <!-- datetimepicker -->
  <link rel="stylesheet" href="${basePath}/resources/js/datetimepicker/css/bootstrap-datetimepicker.min.css"">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${basePath}/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<style>
body{padding: 0px;margin: 0px; border: 0px}
.ovcl{overflow: hidden;clear: both;}
.fl{float: left;}
.fr{float: right;}
.startDate,.endDate{width: 300px;float: right;margin-top: 20px;}
.startDate span,.endDate span{height: 30px;line-height: 30px;}
.startDate span .fa-calendar,.endDate span .fa-calendar{line-height: 30px;}
.startDate input,.endDate input{width:150px;height:30px;float: left;text-align: center;font-size: 16px;border: 1px solid #dddddd;border-radius: 3px;padding: 4px;}
.box-solid{margin: 20px auto;width: 98%;}
.box-body{padding:0px !important;background: #ffffff;border:1px solid #67a8ce;color: #333333}
.tableDiv{
   border-collapse: collapse;/* 边框合并属性  */
   width:200px;
}
.search{margin-top: 20px;line-height: 20px;height: 30px;width: 80px;background-color: #333333;color: #ffffff;padding: 5px 10px;text-align: center;border-radius: 3px;cursor: pointer;margin-right: 40px;}
.table_tr div{
     border: 1px solid #dddddd;
}
.table_tr{clear: both;}
.table_tr div{float: left;text-align: center;line-height: 34px;border-bottom: : 0px;border-right: : 0px;}
.tableDiv{border:1px solid #dddddd;border-right: 0;border-bottom: 0;}
.table_td1{cursor:pointer;width: 15%;height:35px;text-align: center;line-height: 35px;}
.table_tr .table_td2 div,.table_tr .table_td1{border:1px solid #dddddd;border-left: 0px;border-top: 0px; }
.table_tr .table_td2{border: 0px;width: 85%;}
.tableDiv2{width:98%;clear: both;overflow: hidden;margin:30px auto;border:1px solid #dddddd;border-right: 0;border-bottom: 0;}
.tableDiv2 div{height:35px;line-height:35px;text-align:center;float: left;border:1px solid #dddddd;border-left: 0;border-top: 0;}
.tableDiv2 .div1{width: 10%}
.tableDiv2 .div2{width: 23.3%}
</style>
<body class="hold-transition sidebar-mini">





<section class="content-header">
  <h1>
    总览
    <!-- <small>Control panel</small> -->
  </h1>
  <ol class="breadcrumb">
    <li><a><i class="fa fa-dashboard"></i>总览详情</a></li>
    <!-- <li class="active">Dashboard</li> -->
  </ol>
</section> 



<!-- dateTimePicker -->
<div class="" style="    overflow: hidden;">
	<div class="fr search">
    	检索
  </div>

  <div class="fl input-append date startDate">
    <span class="fl">查询日期：</span>
    <input class="" size="16" type="text" value="" readonly>
    <span class="add-on fl"> <i class="fa fa-calendar"></i></span>
  </div>
  
  <!-- <div class="fl input-append date endDate" >
    <span class="fl">结束时间：</span>
    <input size="16" type="text" value="" readonly>
    <span class="add-on fl"> <i class="fa fa-calendar"></i></span>
  </div> -->
  
</div> 



<!-- Calendar -->
          <div class="box box-solid bg-light-blue-gradient">
            <div class="box-header">
             

              <h3 class="box-title">总览</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
              <div class="tableDiv" style="width: 100% ;" >
                  <div class="table_tr">
                    <div class="table_td1">&nbsp</div>
                    <div class="table_td2 name">
                      <!-- <div>顺心园</div>
                      <div>如意楼</div>
                      <div>岭南大厦</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1 "><span class="fa fa-plus" style="position: relative;left: -50px"></span>月租</div>
                    <div class="table_td2 rent">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -50px"></span>电收</div>
                    <div class="table_td2 electricity">
                     <!--  <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -50px"></span>水收</div>
                    <div class="table_td2 water">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -50px"></span>其他</div>
                    <div class="table_td2 incidental">
                    <!--   <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -50px"></span>押金</div>
                    <div class="table_td2 deposit">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -50px"></span>门押</div>
                    <div class="table_td2 gate">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-plus" style="position: relative;left: -42px"></span>总收入</div>
                    <div class="table_td2 totalIn">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -42px"></span>应缴电</div>
                    <div class="table_td2 electricityPay">
                     <!--  <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -42px"></span>应缴水</div>
                    <div class="table_td2 waterPay">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -34px"></span>其他支出</div>
                    <div class="table_td2 incidentalPay">
                     <!--  <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -47px"></span>退押</div>
                    <div class="table_td2 depositPay">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -39px"></span>退门押</div>
                    <div class="table_td2 gatePay">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1"><span class="fa fa-minus" style="position: relative;left: -39px"></span>总支出</div>
                    <div class="table_td2 totalOut">
                      <!-- <div>1</div>
                      <div>1</div>
                      <div>1</div> -->
                    </div>
                  </div>
              </div><!-- /.tableDiv -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <div class="tableDiv2">
              <div class="div1 ">利润：</div>
              <div class="div2 lirun"></div>
              <div class="div1 ">同比：</div>
              <div class="div2 tongbi" ></div>
              <div class="div1 ">环比：</div>
              <div class="div2 huanbi"></div>
            </div>














<!-- jQuery 2.2.3 -->
<script src="${basePath}/resources/js/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${basePath}/resources/js/bootstrap/js/bootstrap.min.js"></script>
<!-- datetimepick-->
<script src="${basePath}/resources/js/datetimepicker/js/bootstrap-datetimepicker.js"></script>

<!-- FastClick -->
<script src="${basePath}/resources/js/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${basePath}/resources/js/dist/js/app.js"></script>
<!-- Sparkline -->
<script src="${basePath}/resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${basePath}/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${basePath}/resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${basePath}/resources/js/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="${basePath}/resources/js/plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${basePath}/resources/js/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${basePath}/resources/js/dist/js/demo.js"></script>

<script type="text/javascript">
setTableHeight();
var basePath = '${basePath}';
var time= new Date();
var nowTime = time.getFullYear()+"-"+(time.getMonth()+1);
$(function(){
	getData(nowTime,nowTime);
	getCompair(nowTime,nowTime);
})
$(".startDate input").val(nowTime);
$(".startDate").datetimepicker({
    format: "yyyy-mm",
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    minView:3,
    startView:3,
    todayHighlight:true,
});
 $(".endDate").datetimepicker({
    format: "yyyy-mm",
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    minView:3,
    startView:3,
    todayHighlight:true,
});
function setTableHeight(){
  var divNum = 100/$(".table_td2").eq(0).find("div").length;
  $(".table_td2").find("div").css("width",divNum+"%");
}
function getData(start,end){
	$.getJSON(basePath+"/rent/getTotal"
		,{"start":start+"-1","end":end+"-31"}
		,function(data){
			$(".tableDiv .table_td2").html("");
			var dataDetail = data.data;
			if(data.status == "success"){
				var dataNum = 0;
				for(var i in dataDetail){
					if(dataDetail[i].data != null){
						for(var j in dataDetail[i].data){
							$("."+j).append("<div>"+dataDetail[i].data[j]+"</div>");
						}
					}else{
						$(".water").append("<div>0</div>");
						$(".incidentalPay").append("<div>0</div>");
						$(".electricityPay").append("<div>0</div>");
						$(".gatePay").append("<div>0</div>");
						$(".depositPay").append("<div>0</div>");
						$(".incidental").append("<div>0</div>");
						$(".deposit").append("<div>0</div>");
						$(".rent").append("<div>0</div>");
						$(".electricity").append("<div>0</div>");
						$(".waterPay").append("<div>0</div>");
						$(".gate").append("<div>0</div>");
						$(".totalIn").append("<div>0</div>");
						$(".totalOut").append("<div>0</div>");
					}
					$(".tableDiv .name").append("<div>"+dataDetail[i].name+"</div>")
					dataNum = i;
				}
				$(".tableDiv .table_td2 div").css("width",100/(parseFloat(dataNum)+1)+"%");
			}else{
				alert("检索失败，请重新检索");
			}
		}
	)
}
function getCompair(start,end){
	$.getJSON(basePath+"/rent/getTotalRate"
	,{"start":start+"-1","end":end+"-31"}
	,function(data){
		if(data.status == "success"){
			var now = (data.now[0].totalIn?data.now[0].totalIn:0)-(data.now[0].totalOut?data.now[0].totalOut:0);
			var month = (data.month[0].totalIn?data.month[0].totalIn:0)-(data.month[0].totalOut?data.month[0].totalOut:0);
			var year = (data.year[0].totalIn?data.year[0].totalIn:0)-(data.year[0].totalOut?data.year[0].totalOut:0);
			$(".lirun").text(now);
			$(".tongbi").text(now-year);
			$(".huanbi").text(now-month);
		}
	})
}
$(".search").click(function(){
	var time = $(".startDate input").val();
	getData(time,time);
	getCompair(time,time);
})
</script>


</body>
</html>














