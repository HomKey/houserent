<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<body>
<h1>首页</h1>
<div>
<p>保存楼房</p>
<div>username : <sec:authentication property="name"/></div>
<a href="${basePath}/logout.do">退出</a>
</div>

</body>
<script type="text/javascript">
$(function(){
	/*
	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	$.post("${basePath}/user/test",{name:"中文",age:"11",birthday:new Date().Format("yyyy-MM-dd hh:mm:ss")},function(result){
		console.log(result);
	});
	var data = {};
	data.parentId = "acf25d12-4f82-4864-8f43-ae8d579d18da";
	data.BuildingModel = {
		name : "indexB"
	}
	
	$("#saveBuilding").on("click",function(){
		$.post("${basePath}/webservice/saveBuilding",{parentId:"acf25d12-4f82-4864-8f43-ae8d579d18da"},function(result){
			console.log(result);
		});
	});
	*/
});
</script>
</html>