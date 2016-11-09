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
  <link rel="stylesheet" href="${basePath}/resources/js/datetimepicker/css/bootstrap-datetimepicker.min.css">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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
  .startDate,.endDate{width: 300px;float: right;margin-top: 20px;}
  .startDate span,.endDate span{line-height: 30px;}
  .startDate input,.endDate input{width:150px;height:30px;float: left;text-align: center;font-size: 16px;border: 1px solid #dddddd;border-radius: 3px;padding: 4px;}
  .box-solid{margin: 20px auto;width: 98%;}
  .box-body{padding:0px !important;background: #ffffff;border:1px solid #67a8ce;color: #333333}
  .tableDiv{
     border-collapse: collapse;/* 边框合并属性  */
     width:200px;
  }

  .table_tr div{
       border: 1px solid #dddddd;
  }
  .table_tr{clear: both;}
  .table_tr div{float: left;text-align: center;line-height: 34px;border-bottom: : 0px;border-right: : 0px;}
  .tableDiv{border:1px solid #dddddd;border-right: 0;border-bottom: 0;}
  .table_td1{width: 15%;height:35px;text-align: center;line-height: 35px;}
  .table_tr .table_td2 div,.table_tr .table_td1{border:1px solid #dddddd;border-left: 0px;border-top: 0px; }
  .table_tr .table_td2{border: 0px;width: 85%;}
  .tableDiv2{width:98%;clear: both;overflow: hidden;margin:30px auto;border:1px solid #dddddd;border-right: 0;border-bottom: 0;}
  .tableDiv2 div{height:35px;line-height:35px;text-align:center;float: left;border:1px solid #dddddd;border-left: 0;border-top: 0;}
  .tableDiv2 .div1{width: 10%}
  .tableDiv2 .div2{width: 23.3%}
</style>
<body class="hold-transition sidebar-mini">

<!-- dateTimePicker -->
<div class="" style="    overflow: hidden;">
  <a class="fl" style="float: right;cursor: pointer;height:    width: 300px;line-height: 30px;margin-top: 20px;margin-right: 30px; ">检索</a>
  <div class="fl input-append date endDate" >
    <span class="fl">结束时间：</span>
    <input size="16" type="text" value="" readonly>
    <span class="add-on fl"> <i class="fa fa-calendar"></i></span>
  </div>
  <div class="fl input-append date startDate">
    <span class="fl">开始时间：</span>
    <input size="16" type="text" value="" readonly>
    <span class="add-on fl"> <i class="fa fa-calendar"></i></span>
  </div>


</div> 

<!-- Calendar -->
          <div class="box box-solid bg-light-blue-gradient">
            <div class="box-header">
             

              <h3 class="box-title">顺心园A/B座</h3>
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
                    <div class="table_td2">
                      <div>顺心园</div>
                      <div>如意楼</div>
                      <div>岭南大厦</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份租金</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份电费收入</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份应缴电费</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份水费收入</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份应缴水费</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份押金</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份退押金</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份门押</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">月份退门押</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">其他收入</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">其他支出</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
                  <div class="table_tr">
                    <div class="table_td1">总收入</div>
                    <div class="table_td2">
                      <div>1</div>
                      <div>1</div>
                      <div>1</div>
                    </div>
                  </div>
              </div><!-- /.tableDiv -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <!-- <div class="tableDiv2">
              <div class="div1">利润：</div>
              <div class="div2">利润：</div>
              <div class="div1">同比：</div>
              <div class="div2">利润：</div>
              <div class="div1">环比：</div>
              <div class="div2">利润：</div>
            </div> -->














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
	setTableHeight()
	var basePath = '${basePath}';
	var time= new Date();
	var nowTime = time.getFullYear()+1+"-"+(time.getMonth()+1);
	var startDate = time.getFullYear()+"-"+(time.getMonth()-2);
	$(function(){
		var id=getQueryString("id");
		getData(id,startDate,nowTime);
	})
	$(".endDate input").val(nowTime);
	$(".startDate input").val(startDate);
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
	function getData(id,start,end){
		$.getJSON(basePath+"/rent/getBuildingInfo"
			,{"buildingId":id,"start":start+"-1","end":end+"-31"}
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
	function getQueryString(name){ 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) return unescape(r[2]); return null; 
	} 



</script>


</body>
</html>














