<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>出租屋数据管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${basePath}/resources/js/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
 <link rel="stylesheet" href="${basePath}/resources/js/cdnjs/ionicons/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${basePath}/resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${basePath}/resources/js/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="${basePath}/resources/js/JSTree/jquery.treemenu.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<style>
	.ml10{margin-left:10px}
	.dn{display:none}
	.treemenu{padding:0px}
	.treemenu li{padding:12px 20px;color:#b8c7ce;}
	.treemenu li:hover{background:#1a2226;color:#ffffff !important}
	.treemenu li a:hover{color:#ffffff !important}
	.iframe-bar{clear:both;overflow:hidden;background:#ffffff;padding-top:20px;padding-left:15px;border-bottom:1px solid #dddddd}
	.iframe-bar a{border-radius:3px 3px 0 0;cursor:pointer;display:block;float:left;background:#ffffff;color:#333333;width:103px;height:43px;line-height:45px;text-align:center;font-size:16px;border:1px solid #dddddd}
	.iframe-bar .active{background:#3c8dbc;color:#ffffff}
	a{cursor:pointer;}
</style>
<body class="hold-transition sidebar-mini skin-blue ">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>LOGO</b></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Admin</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p class=nowTime>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <!-- <a href="#" class="btn btn-default btn-flat">Profile</a> -->
                </div>
                <div class="pull-right">
                  <a href="/houserent/logout.do" class="btn btn-default btn-flat">退出</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  <!-- 左侧导航，包括LOGO和侧栏 -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- 侧栏 用户信息 -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" style="height:45px;">
        </div>
        <div class="pull-left info">
          <p>Admin</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">导航栏</li>
        <li class="active allData"><a><i class="fa fa-home"></i> <span>总览</span></a></li>
        <ul class="tree">
		</ul>
        <li><a href="${basePath}/templates/index8" target="_blank"><i class="fa fa-book"></i> <span>押金池</span></a></li>
        
		<sec:authorize access="hasRole('ROLE_ADMIN')">
        	<li><a href="${basePath}/system/index" target="_blank"><i class="fa fa-laptop"></i> <span>数据管理</span></a></li>
        </sec:authorize>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- <section class="content-header">
      <h1>
        Dashboard
        <small>Version 2.0</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section> -->

    <!-- Main content -->
    <section class="iframe-bar">
    	<a class="active" iframenum="1">总览</a>
    </section>
    <section class="content-iframe">
      <iframe id="iframeId1" src="${basePath}/templates/index3" style="width: 100%;height: 100%;padding: 0px;border: 0px">
      
      </iframe>
    </section>
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.6
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer> -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="${basePath}/resources/js/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${basePath}/resources/js/bootstrap/js/bootstrap.min.js"></script>
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
<script src="${basePath}/resources/js/JSTree/jquery.treemenu.js"></script>
<script type="text/javascript">
  var screenHeight = document.documentElement.clientHeight;
  var contentheight;
  var headerHeight = 50;
  var footerHeight = 51;
//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.Format = function(fmt)   
{ //author: meizz   
 var o = {   
   "M+" : this.getMonth()+1,                 //月份   
   "d+" : this.getDate(),                    //日   
   "h+" : this.getHours(),                   //小时   
   "m+" : this.getMinutes(),                 //分   
   "s+" : this.getSeconds(),                 //秒   
   "q+" : Math.floor((this.getMonth()+3)/3), //季度   
   "S"  : this.getMilliseconds()             //毫秒   
 };   
 if(/(y+)/.test(fmt))   
   fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
 for(var k in o)   
   if(new RegExp("("+ k +")").test(fmt))   
 fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
 return fmt;   
}  
  $(function(){
    $(".content-wrapper").css("min-height",screenHeight-headerHeight);
    $(".nowTime").text((new Date().Format("yyyy-MM-dd hh:mm:ss")));
    //$(".content-iframe").css("height",screenHeight-headerHeight );
  })
  loadIframe("iframeId1");
  function loadIframe(iframeName){
	  $("#"+iframeName).load(function (){ 
	    var iframe=document.getElementById(iframeName);      
	    var height=iframe.contentWindow.document.documentElement.scrollHeight;  
	    $("#"+iframeName).css("height",height);
	  });
  }
  



</script>
<script>
	var basePath='${basePath}';
	$(function(){
		$.getJSON(basePath+"/building/getTree",function(data){
			if(data.status == "success"){
				var content="";
				addBuildingList(data.data);
			}else{
				alert("获取楼层导航失败，请刷新页面");
			}
		})
	})
	var content="";
	function addBuildingList(data){
		showBuildingList(data);
		$(".tree").html(content);
		$(".tree").treemenu({delay:300}).openActive();
	}
	function showBuildingList(buildingList){
		for(var i in buildingList){
			content += "<li><a data-id='"+buildingList[i].id+"' data-lc='"+buildingList[i].longCode+"'>"+buildingList[i].name+"</a>"
			if(buildingList.children != ""){
				content +="<ul>";
				showBuildingList(buildingList[i].children);
				content +="</ul>";
			}
			content +="</li>";
		}
	}
	
</script>
<script>
	var iframeNum=1;
    $(".sidebar-menu li").click(function(){
    	$(".sidebar-menu li").removeClass("active");
    	$(this).addClass("active");
    })
    $(document).on("click",".treemenu a",function(e){
    	var buildingID = $(this).attr("data-id");
    	var buildingLC = $(this).attr("data-lc");
    	var buildingName = encodeURI($(this).text());
    	$(".iframe-bar a").removeClass("active");
    	$(".content-iframe iframe").addClass("dn");
    	var content="";
    	iframeNum+=1;
    	content+='<iframe id="iframeId'+iframeNum+'" src="" style="width: 100%;height: 100%;padding: 0px;border: 0px"></iframe>'
    	$(".content-iframe").append(content);
    	$("#iframeId"+iframeNum).attr("src","${basePath}/templates/index4?id="+buildingID+"&buildingName="+buildingName+"&buildingLC="+buildingLC);
    	loadIframe("iframeId"+iframeNum);
    	content="";
    	content+='<a class="active iframe-bar-click" iframenum="'+iframeNum+'">'+$(this).text()+"<i class='closeDiv ml10 fa fa-close'></i>"+'</a>';
    	$(".iframe-bar").append(content);
    })
    $(document).on("click",".iframe-bar a",function(e){
    	var num = $(this).attr("iframenum");
    	$(".iframe-bar a").removeClass("active");
    	$(this).addClass("active");
    	$(".content-iframe iframe").addClass("dn");
    	$("#iframeId"+num).removeClass("dn");
    })
    /* $(".allData").click(function(){
    	$("#iframeId1").attr("src","${basePath}/templates/index3");
    }) */
    $(document).on("click",".fa-close",function(e){
    	var obj = $(this).parent();
    	var iframenum = obj.attr("iframenum");
    	var previframenum = obj.prev().attr("iframenum");
    	if(obj.hasClass("active")){
	    	obj.prev().addClass("active");
	    	$("#iframeId"+previframenum).removeClass("dn");
    	}
    	$("#iframeId"+iframenum).remove();
    	obj.remove();
    	e.stopPropagation()
    })
    $(document).on("dblclick",".iframe-bar-click",function(e){
    	var obj = $(this);
    	var iframenum = obj.attr("iframenum");
    	var previframenum = obj.prev().attr("iframenum");
    	if(obj.hasClass("active")){
	    	obj.prev().addClass("active");
	    	$("#iframeId"+previframenum).removeClass("dn");
    	}
    	$("#iframeId"+iframenum).remove();
    	obj.remove();
    	e.stopPropagation()
    })
</script>
</body>
</html>
