<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/test.css" />
<script type="text/javascript" src="${basePath}/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${basePath}/resources/js/utils.js"></script>
<title>系统管理</title>
</head>
<body>
<div>username : <sec:authentication property="name"/></div>
<a href="${basePath}/logout.do">退出</a>
<h1>数据管理页面</h1>
<a href="${basePath}/system/buildingList" target= _blank>楼房列表</a>
<a href="${basePath}/system/buildingAdd" target= _blank>楼房增加</a>
<br/>
<br/>
<a href="${basePath}/system/floorList" target= _blank>楼层列表</a>
<a href="${basePath}/system/floorAdd" target= _blank>楼层增加</a>
<br/>
<br/>
<a href="${basePath}/system/roomList" target= _blank>房间列表</a>
<a href="${basePath}/system/roomAdd" target= _blank>房间增加</a>
<br/>
<br/>
<a href="${basePath}/system/rentDetailList" target= _blank>租金表</a>
<a href="${basePath}/system/rentDetailAdd" target= _blank>租金数据增加</a>
<br/>
<br/>
<!-- 
<a href="${basePath}/system/import?buildingId=1" target= _blank>导入租金数据(传buildingId)</a>
 -->
<%-- <h1>数据接口</h1>
<a href="${basePath}/rent/getBuildingInfo?buildingId=1&start=2016-01-01&end=2017-01-01" target= _blank>查询某栋楼层的租金信息(buildingId,startTime,endTime)</a>
<br/>
<br/>
<a href="${basePath}/rent/getTotalRate?start=2016-01-01&end=2016-01-31" target= _blank>同比环比</a>
<br/>
<br/>
<a href="${basePath}/rent/getTotal?start=2016-01-01&end=2016-01-31" target= _blank>所有小区统计</a>
<br/>
<br/>
<a href="${basePath}/rent/getBuildTotal?start=2016-01-01&end=2016-01-31" target= _blank>所有楼统计</a>
<br/>
<br/>
<a href="${basePath}/rent/getTotalByBuild?start=2016-01-01&end=2016-01-31&buildingId=1" target= _blank>指定楼统计</a>
<br/>
<br/>
<a href="${basePath}/rent/getDepositByBuilding?buildingId=1" target= _blank>统计房间的押金情况</a>
<br/>
<br/>
<a href="${basePath}/rent/getDeposit?buildingId=1" target= _blank>统计押金</a> --%>
<div>
</div>

</body>
<script type="text/javascript">
$(function(){
	//时间参数格式
	console.log(DateUtil.getFirstAndLastMonthDay(2016,2));
	console.log(DateUtil.format("yyyy-mm-dd",new Date(1476028800000)));
});
</script>
</html>