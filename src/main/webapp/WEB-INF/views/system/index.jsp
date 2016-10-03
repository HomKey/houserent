<%@page import="com.hk.base.support.RequestUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/test.css" />
<script type="text/javascript" src="${basePath}/resources/js/jquery-1.11.3.min.js"></script>
<title>系统管理</title>
</head>
<body>
<h1>index</h1>
<a href="${basePath}/system/buildingList">楼房列表</a>
<a href="${basePath}/system/buildingAdd">楼房增加</a>
<a href="${basePath}/system/roomList">房间列表</a>
<a href="${basePath}/system/roomAdd">房间增加</a>
<a href="${basePath}/system/rentDetailList">租金表</a>
<a href="${basePath}/system/rentDetailAdd">租金数据增加</a>
<a href="${basePath}/system/import?buildingId=1">导入租金数据(传buildingId)</a>
<div>
</div>

</body>
<script type="text/javascript">
$(function(){
});
</script>
</html>