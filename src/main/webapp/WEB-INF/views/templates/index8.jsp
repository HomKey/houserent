<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/js.jsp" %>
<title>GF2活动页面</title>
</head>
<style>
body, html {
    font-family: 'PingFang SC','Microsoft YaHei','Helvetica Neue',Helvetica,STHeitiSC-Light,Arial,sans-serif;
    font-size: 12px;
    width: 100%;
    height: 100%;
    color: #666;
}
body{background-color:#f5f5f5}
	.xsd-font-size16{font-size:16px;}
	.xsd-color-primary{color: #499df2;}
	.xsd-color-gray {color: #999}
	.xsd-padding-l12 {
		padding-left: 12px;
	}
	.xsd-clearfix:after {
		display: block;
		clear: both;
		visibility: hidden;
		height: 0;
		overflow: hidden;
		content: ".";
	}
	body, button, caption, dd, div, dl, dt, fieldset, figure, form, h1, h2, h3, h4, h5, h6, hr, html, input, legend, li, menu, ol, p, pre, table, td, textarea, th, ul {
		margin: 0;
		padding: 0;
	}
	address, cite, dfn, em, i, var {font-style: normal;}
	
	#addTop input {
		width: 120px;
		height: 30px;
	}
	.xsd-input {
		height: 34px;
		line-height: 34px;
		border: 1px solid #e3e3e3;
		border-radius: 5px;
		background: #FFF;
	}
	#addTop {
		margin-left: 310px;
		height: 54px;
		line-height: 54px;
		padding-right: 20px;
		margin-bottom: -20px;
	}
	
	.xsd-select ul, .xsd-select-t ul {
		display: none;
		position: absolute;
		border-radius: 5px;
		border: 1px solid #e3e3e3;
		top: 36px;
		left: 0;
		width: 100%;
		padding: 4px 0;
		background: #FFF;
		z-index: 99999;
		max-height: 280px;
		overflow-x: hidden;
	}
	.xsd-select ul li, .xsd-select-t ul li {
		padding: 4px 0 4px 12px;
		cursor: pointer;
		text-align: left;
	}
	.xsd-select ul li:hover, .xsd-select-t ul li:hover {
		background: #f5f5f5;
	}
	.xsd-select, .xsd-select-t {
		position: relative;
	}
	#addTop ul {
		margin-top: -9px;
	}
	#addTop ul li {
		line-height: 22px;
	}
	.xsd-select ul li, .xsd-select-t ul li {
		padding: 4px 0 4px 12px;
		cursor: pointer;
		text-align: left;
	}
	#addTop .apartment {
		width: 80px;
		height: 30px;
		margin-top: 12px;
		line-height: 30px;
		border-radius: 4px;
	}
	.xsd-text-center {
		text-align: center;
	}
	.xsd-pull-right {
		float: right;
	}
	.xsd-pull-left {
		float: left;
	}
	.xsd-margin-r16 {
		margin-right: 16px;
	}
	.xsd-btn-primary {
		background: #499df2;
		color: #FFF;
	}
	a, button {
		cursor: pointer;
	}
#separate {
    width: 100%;
    padding-right: 0;
    min-width: 799px;
}
#separate>div {
    margin-left: 311px;
    padding: 0 16px 16px;
    margin-top: 20px;
    margin-right: 20px;
    background: #FFF;
    min-height: 714px;
}
#separate #tools {
    padding: 14px 0;
    line-height: 25px;
    border-bottom: 1px solid #f5f5f5;
}
#separate #tools .xsd-margin-r64 {
    margin-right: 64px;
}
.xsd-font-size12 {
    font-size: 12px!important;
}
#separate #tools div .iconfont {
    color: #999;
}
#separate #tools a {
    margin-left: 16px;
    line-height: 30px;
    text-align: center;
    border-radius: 4px;
}
.iconfont {
    font-family: iconfont!important;
    font-size: 16px;
    font-style: normal;
    -webkit-font-smoothing: antialiased;
    -webkit-text-stroke-width: .2px;
    -moz-osx-font-smoothing: grayscale;
}
.xsd-margin-r24 {
    margin-right: 24px;
}
#separate #tools span {
    margin: 0 6px;
}
#separate span.xsd-font-size20 {
    font-size: 20px;
}
.xsd-color-yellow {
    color: #ffae53;
}
#separate #tools a.btn {
    padding: 0 12px;
    background: #499df2;
    color: #FFF;
}
#separate #tools a {
    margin-left: 16px;
    line-height: 30px;
    text-align: center;
    border-radius: 4px;
}
#separate #oneFloor {
    position: relative;
}
.xsd-margin-t22 {
    margin-top: 22px;
}
#separate #oneFloor .floorNum {
    position: absolute;
}
#separate #oneFloor .floor {
    width: 20px;
    height: 43px;
    text-align: center;
    border-top-left-radius: 2px;
    border-bottom-left-radius: 2px;
}
#separate #oneFloor .oneFloor {
    width: 40px;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
#separate #oneFloor .oneFloor td {
    height: 20px;
    font-size: 12px;
    cursor: pointer;
}
#separate td, #separate th {
    border: 1px solid #e3e3e3;
    text-align: center;
}
#separate td {
    height: 76px;
    vertical-align: middle;
    background: #FFF;
}
a, a:hover {
    color: #333;
}
a, a:hover, del, ins, s, u {
    text-decoration: none;
}
#separate #oneFloor .floorNum+div {
    padding-left: 81px;
    border-bottom: 1px #e7e7e7 solid;
}
.xsd-clearfix {
    zoom: 1;
}
#separate #oneFloor .floorNum+div .xsd-margin-r16 {
    padding-bottom: 20px;
}
#separate #oneFloor .allDetails {
    position: relative;
    display: block;
    width: 172px;
    height: 120px;
    border: 1px solid #e7e7e7;
    border-radius: 4px;
}
#separate #oneFloor .allDetails .not-rent {
    background: url(./webapp/resources/images/norent.png) no-repeat;
    width: 40px;
    height: 40px;
    position: absolute;
    right: -1px;
}
#separate #oneFloor .Details {
    font-size: 12px;
    height: 63px;
    border-bottom: 1px solid #e7e7e7;
    padding: 10px 14px;
}
#separate #oneFloor .Details p {
    margin-bottom: 6px;
}
#separate #oneFloor .allDetails .empty {
    text-align: center;
    line-height: 48px;
}
#separate #oneFloor .roomDetails {
    font-size: 12px;
}
#separate #oneFloor .roomDetails .meterReading {
    display: block;
    width: 154px;
    line-height: 32px;
    color: #999;
    margin-left: 9px;
}
#separate #tools a.btn:active, #separate #tools a.btn:hover {
    color: #FFF;
    background: #59acff;
}
.xsd-btn-primary:active, .xsd-btn-primary:hover {
    color: #FFF;
    background: #59acff;
}
#addFloor, #addRoom {
    height: 440px;
    margin-top: -220px;
}

.xsd-modal {
    display: none;
    position: fixed;
    padding-top: 0!important;
    top: 50%;
    left: 50%;
    margin-left: -380px;
    margin-top: -300px;
    width: 760px;
    height: 600px;
    background: #FFF;
    z-index: 400;
    overflow-x: hidden;
}
.xsd-md-modal {
    width: 500px;
    margin-left: -250px;
}
.xsd-drawer-header, .xsd-modal-header {
    padding: 20px!important;
    position: relative;
}
.xsd-margin-b24 {
    margin-bottom: 24px;
}
.xsd-drawer-header .xsd-modal-close, .xsd-modal-header .xsd-modal-close {
    position: absolute;
    right: 12px;
    font-size: 12px;
    color: #999;
}
.xsd-margin-l36 {
    margin-left: 36px;
}
#addFloor .roomDetails p, #addRoom .roomDetails p {
    margin-bottom: 16px;
	font-size:14px;
}
#addFloor .marginDis, #addRoom .marginDis {
    margin-top: 48px;
    margin-right: 32px;
}
.xsd-modal-bottom .xsd-btn-primary {
    margin-left: 20px;
}
.xsd-modal-bottom .xsd-btn {
    padding: 7px 31px;
    line-height: 20px;
}
.xsd-modal-bottom .xsd-btn {
    padding: 7px 31px;
    line-height: 20px;
}
.xsd-btn {
    display: block;
    line-height: 48px;
    border-radius: 4px;
    text-align: center;
}
.xsd-btn-gray {
    border: 1px solid #e7e7e7;
    color: #666;
}
#addFloor div p, #addRoom div p {
    margin-bottom: 10px;
}
.font-size14 {
    font-size: 14px;
    font-weight: 300;
}
#xsd-modal-mask {
    z-index: 300;
}
#xsd-mask, #xsd-modal-mask, #xsd-user-mask {
    display: none;
	top: 0;
    position: fixed;
    height: 100%;
    width: 100%;
    z-index: 100;
    background: #000;
    opacity: .15;
    filter: alpha(opacity=15);
    -moz-opacity: .15;
}
#addFloor div select, #addRoom div select {
    width: 434px;
    padding-left: 16px;
}
.font-size14 {
    font-size: 14px;
    font-weight: 300;
}
.xsd-input {
    height: 34px;
    line-height: 34px;
    border: 1px solid #e3e3e3;
    border-radius: 5px;
    background: #FFF;
}
#addFloor div input, #addRoom div input {
    width: 416px;
    padding-left: 16px;
}
.xsd-color-red {
    color: #ff5153;
}
b {
    font-weight: 400;
}
</style>
<body>
	<div class="xsd-clearfix">
		<div id="addTop">
			<span class="xsd-font-size16">共<i id="buildingCount" class="xsd-color-primary">  </i>幢公寓<!--共几多栋公寓，可有可无-->
			</span>
			<i class="xsd-color-gray">|</i>
			<span class="xsd-font-size16 marginR21">
				<i id="roomCount" class="xsd-color-primary">   </i><!--共几多个房间，可有可无-->
				间房间
			</span>
			<label class="xsd-input-group xsd-select">
				<i class="iconfont"></i>
				<select id="apartmentSelect" class="xsd-input xsd-padding-l12" type="text" readonly="" placeholder="" data-value="990"><!--循环所有楼层供选择筛选，默认选中第一栋吧-->
				</select>
			</label>
			<b>楼层</b>
			<label class="xsd-input-group xsd-select">
				<select id="floorSelect" class="floor xsd-input xsd-padding-l12" data-value="" type="text" readonly="" value="全部" placeholder="选择楼层">
				</select>
			</label>
			<a class="xsd-pull-right btn xsd-btn-primary apartment xsd-text-center xsd-margin-r16" data-toggle="xsd-modal" data-target="#addHouse">添加公寓</a><!--弹出对话框-->
		</div>
		<div id="separate" class="xsd-pull-left">
			<div>
				<div id="tools" class="xsd-clearfix">
					<div class="xsd-pull-left xsd-margin-r64">
						<a class="xsd-font-size18 iconfont" data-toggle="xsd-drawer" data-target="#houseDetail">顺心园A</a><!--所选的building-->
					</div>
					<div class="xsd-pull-left xsd-margin-r24">
						<span class="xsd-color-gray xsd-font-size12">房间数</span>
						<p><span class="xsd-color-primary xsd-font-size20">75</span><!--总共房间数-->
						</p>
					</div>
					<!--<div class="xsd-pull-left">
						<span class="xsd-color-gray xsd-font-size12">在租数</span>
						<p><span class="xsd-color-yellow xsd-font-size20">0</span>
						</p>
					</div>-->
						<!--<a class="xsd-pull-right btn" data-toggle="xsd-modal" data-target="#rentalHouse">添加托管合同</a>-->
						<a class="xsd-pull-right btn">添加楼层</a><!--弹出对话框-->
						<a class="xsd-pull-right btn">添加房间</a><!--弹出对话框-->
				</div>
				
				<div class="xsd-margin-t22" id="oneFloor"><!--房间详情-->
					<!--楼层-->
					<div class="floorNum">
						<span class="xsd-pull-left xsd-btn-primary floor">1楼</span><!--详情当前楼楼层-->
						<table class="oneFloor">
							<tr>
								<td>
									  <a data-toggle="xsd-modal" data-target="#delFloor">删除</a><!--删除-->
								</td>
							</tr>
						</table>
					</div>
					<!--循环每间房-->
					<div class="xsd-clearfix">
						<div class="xsd-pull-left xsd-margin-r16">
							<a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
								<div class="Details xsd-font-size12">
									<p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0101室</p>
									<!--<p class="xsd-color-gray empty">未出租</p>-->
								</div>
								<div class="roomDetails">
									<div class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">查看</div>
								</div>
							</a>
						</div>
						<div class="xsd-pull-left addRoom">
							<div class="add">
								<a class="btn">
									<span class="iconfont xsd-color-gray"></span>
									<p>添加房间</p><!--添加房间-->
								</a>
							</div>
						</div>


					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<!--添加房间对话框
	<div id="ember1010" class="ember-view">
		<div class="xsd-modal xsd-md-modal" id="addRoom" style="display: block;">
			<div class="xsd-modal-header xsd-margin-b24">
				<span class="xsd-font-size16">添加房间</span><a class="xsd-modal-close iconfont xsd-margin-r12">X</a>
			</div>
			<div class="xsd-modal-body xsd-margin-l36">
				<div class="roomDetails">
					<p>公寓名称:111</p>
					<p>详细地址:111</p>
				</div>

				<div class="xsd-clearfix xsd-margin-b16">

					  <p class="xsd-margin-l32 font-size14">所在楼层
						  <b class="xsd-color-red">*</b>
					  </p>
					<label class="xsd-pull-left xsd-input-group xsd-select">
						<select type="text" name="floor" class="xsd-input font-size14" id="floor_number" readonly="" data-value="" title="所在楼层" validate="required" placeholder="请选择楼层编号">
							<option value="1">1楼</option>
							<option value="2">2楼</option>
						</select>
					</label>
				</div>

				<div class="xsd-clearfix xsd-margin-b16">
					<p class="xsd-margin-l32 font-size14">房间名称
						<b class="xsd-color-red">*</b>
					</p>
					<label class="xsd-pull-left xsd-input-group ">
						<input type="text" name="room" class="xsd-input font-size14" id="floor_roomNumber" title="房间编号" validate="required" placeholder="请输入房间编号">
					</label>
				</div>
			</div>


			<div class="xsd-modal-bottom xsd-clearfix marginDis">
				<div class="xsd-clearfix">
					<a class="xsd-btn xsd-btn-primary xsd-pull-right">确定</a>
					<a class="xsd-btn xsd-btn-gray xsd-pull-right xsd-modal-close">取消</a>
				</div>
			</div>
		</div>
	</div>-->
	<!--遮罩层
	<div id="xsd-modal-mask" style="display: block;"></div>-->
</body>
<script type="text/javascript">
$(function(){
	//请求获取公寓数量和房间数量
	$.post("${basePath}/webservice/getCount",function(result){
		var buildingCount = 0;
		var roomCount = 0;
		if(result.status == "success"){
			buildingCount = result.building[0].count;
			roomCount = result.room[0].count;
		}
		$("#buildingCount").html(buildingCount);
		$("#roomCount").html(roomCount);
	});
	//初始化楼房选择
	$.post("${basePath}/building/getChildren",function(result){
		var $buildingSelect = $("#apartmentSelect").empty();
		var bHtml = '';
		var buildingId = '';
		$.each(result,function(i,item){
			if(i == 0){
				buildingId = item.value;
			}
			bHtml += '<option value="'+item.value+'">'+item.text+'</option>';
		});
		$(bHtml).appendTo($buildingSelect);
		if(buildingId != null || buildingId != ""){
			getFloor(buildingId);
			getRoomDetail(buildingId,null);
		}
	});
	
	$("#apartmentSelect").change(function(){
		getFloor($(this).val());
		getRoomDetail($(this).val(),null);
	});
	$("#floorSelect").change(function(){
		getRoomDetail($("#apartmentSelect").val(),$(this).val());
	});
	function getRoomDetail(buildingId,floorId){
		console.log(buildingId,floorId);
		$.post("${basePath}/floor/getByFloor",{buildingId:buildingId,floorId:floorId},function(result){
			//所有房间信息(需要自己分楼层)
			console.log(result);
		});
	}
	function getFloor(buildingId){
		$.post("${basePath}/floor/getByBuilding",{id:buildingId},function(floorResult){
			if(floorResult.status == "success"){
				var $floorSelect = $("#floorSelect").empty();
				var fHtml = '<option value="" selected="selected">全部</option>';
				$.each(floorResult.data,function(i,item){
					fHtml += '<option value="'+item.id+'">'+item.floorName+'</option>';
				});
				$(fHtml).appendTo($floorSelect);
			}
		});
	}
	//添加公寓要先添加小区
	function addApartment(){
		//参考
		location.href = "${basePath}/system/buildingAdd";
		/*
		data:name parentId remark
		$.post("${basePath}/building/save",data,function(result){
			if(result.status == "success"){
				//保存成功
			}
		});
		*/
	}
	function addFloor(){
		//参考
		location.href = "${basePath}/system/floorAdd";
		/*
		data:buildingId floorName remark
		$.post("${basePath}/floor/save",data,function(result){
			if(result.status == "success"){
				//保存成功
			}
		});
		*/
	}
	function addRoom(){
		//参考
		location.href = "${basePath}/system/roomAdd";
		/*
		data:buildingId floorId roomNumber remark
		$.post("${basePath}/room/save",data,function(result){
			if(result.status == "success"){
				//保存成功
			}
		});
		*/
	}
	function removeRoom(roomId){
		$.post("${basePath}/room/remove",{id:roomId},function(result){
			if(result.status == "success"){
				//删除成功
			}
		})
	}
	function removeFloor(floorId){
		$.post("${basePath}/floor/remove",{id:floorId},function(result){
			if(result.status == "success"){
				//删除成功
			}
		})
	}
	function getRoom(roomId){
		$.post("${basePath}/room/getById",{id:id},function(result){
			if(result.status == "success"){
				//获取成功
				//注意,成功返回的data是数组
			}
		});
	}
});
</script>
</html>