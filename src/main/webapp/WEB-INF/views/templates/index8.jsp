<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/js.jsp" %>
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/templates/index8.css">
<title>GF2活动页面</title>
</head>
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
						<a class="xsd-font-size18 iconfont" data-toggle="xsd-drawer" data-target="#houseDetail" id="buildingName"></a><!--所选的building-->
					</div>
					<div class="xsd-pull-left xsd-margin-r24">
						<span class="xsd-color-gray xsd-font-size12">房间数</span>
						<p><span id="roomTotal" class="xsd-color-primary xsd-font-size20">0</span><!--总共房间数-->
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
				<div id="roomListDiv">
					<div class="xsd-margin-t22 floor-div"><!--房间详情-->
						<!--楼层-->
						<div class="floorNum">
							<span class="xsd-pull-left xsd-btn-primary floor">1楼</span><!--详情当前楼楼层-->
							<table class="floor-operation">
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
					<div class="xsd-margin-t22 floor-div"><!--房间详情-->
						<!--楼层-->
						<div class="floorNum">
							<span class="xsd-pull-left xsd-btn-primary floor">1楼</span><!--详情当前楼楼层-->
							<table class="floor-operation">
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
		var buildingName = '';
		$.each(result,function(i,item){
			if(i == 0){
				buildingId = item.value;
				buildingName = item.text;
			}
			bHtml += '<option value="'+item.value+'">'+item.text+'</option>';
		});
		$(bHtml).appendTo($buildingSelect);
		if(buildingId != null || buildingId != ""){
			getFloor(buildingId);
			getRoomDetail(buildingId,null);
			setCurrentBuilding(buildingName,"全部")
		}
	});
	
	$("#apartmentSelect").change(function(){
		getFloor($(this).val());
		getRoomDetail($(this).val(),null);
		setCurrentBuilding($("#apartmentSelect").find("option:selected").text(),"全部")
	});
	$("#floorSelect").change(function(){
		getRoomDetail($("#apartmentSelect").val(),$(this).val());
		setCurrentBuilding($("#apartmentSelect").find("option:selected").text(),$("#floorSelect").find("option:selected").text());
	});
	function setCurrentBuilding(buildingName,floorName){
		$("#buildingName").html(buildingName+ " | " +floorName);
	}
	function getRoomDetail(buildingId,floorId){
		console.log(buildingId,floorId);
		$.post("${basePath}/floor/getByFloor2",{buildingId:buildingId,floorId:floorId},function(result){
			//所有房间信息(需要自己分楼层)
			console.log(result);
			if(result.status == "success"){
				//统计房间数量
				$("#roomTotal").html(result.data.length);
				//数据造型
				var json = [];
				for(var i = 0 ;i <result.data.length;i++){
					var floorData = {
						name:'',
						buildingId:'',
						data:[]
					};
					floorData.name = result.data[i].floorName;
					floorData.buildingId = result.data[i].id.split(",")[0];
					floorData.data.push(result.data[i]);
					for(var j = (i+1) ; j < result.data.length;j++,i++){
						if(result.data[i].floorName == result.data[j].floorName){
							floorData.data.push(result.data[j]);
						}else{
							break;
						}
					}
					json.push(floorData);
				}
				var $roomList = $("#roomListDiv").empty();
				$.each(json,function(i,floor){
					var html = '<div class="xsd-margin-t22 floor-div"><div class="floorNum"><span class="xsd-pull-left xsd-btn-primary floor">'
					+floor.name+'</span></div><div class="xsd-clearfix">';
					$.each(floor.data,function(j,room){
						var rent = {};
						if(room.depositTotal <= 0 && room.gateTotal <=0){
							rent.colorClazz = "xsd-color-green";
							rent.text = "未出租";
						}else{
							rent.colorClazz = "xsd-color-red";
							rent.text = "出租中";
						}
						html += '<div class="xsd-pull-left xsd-margin-r16 room-module"><a id="'+room.id+'" class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">'
						+'<div class="Details xsd-font-size12"><p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;'+room.roomNumber+'</p>'
						+'<p class="'+rent.colorClazz+' empty">'+rent.text+'</p></div>'
						+'<div class="roomDetails"><div class="xsd-pull-left meterReading xsd-text-center" data-toggle="xsd-modal" data-target="#rentalRoom">查看</div></div></a></div>';
					});
					html += '<div class="xsd-pull-left addRoom"><div class="add"><a class="btn" onclick="addRoom(\''+floor.buildingId+'\',\''+floor.name+'\')"><span class="iconfont xsd-color-gray"></span>'
					+'<p>添加房间</p></a></div></div></div></div>';
					$(html).appendTo($roomList).data("data",floor);
				});
				
			}
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
	//每间房的点击事件
	$("#roomListDiv").on("click",".room-module>a",function(){
		console.log($(this).prop("id"));//房间的id
	});
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
function addRoom(buildingId,floorName){
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
	console.log(buildingId,floorName);
}
</script>
</html>