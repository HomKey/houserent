<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/js.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/templates/index8.css">
<title>出租屋数据管理系统</title>
</head>
<style>
#separate .floor-div .allDetails {
    height: 78px;
}
.list td{border:1px solid #333;padding:5px 0}
</style>
<body>
	<div class="xsd-clearfix">
		<div id="addTop">
			<span class="xsd-font-size16">共<i id="buildingCount" class="xsd-color-primary"> 0 </i>幢公寓<!--共几多栋公寓，可有可无-->
			</span>
			<i class="xsd-color-gray">|</i>
			<span class="xsd-font-size16 marginR21">
				<i id="roomCount" class="xsd-color-primary"> 0  </i><!--共几多个房间，可有可无-->
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
			
		</div>
		<div id="separate" class="xsd-pull-left">
			<div>
				<div id="tools" class="xsd-clearfix">
					<div class="xsd-pull-left xsd-margin-r64">
						<a class="xsd-font-size18 iconfont" data-toggle="xsd-drawer" data-target="#houseDetail" id="buildingName"></a><!--所选的building-->
					</div>
					<div class="xsd-pull-left xsd-margin-r24">
						<span class="xsd-color-gray xsd-font-size12">房间数</span>
						<span id="roomTotal" class="xsd-color-primary xsd-font-size20">0</span><!--总共房间数-->
					</div>
					<div class="xsd-pull-left">
						<span class="xsd-color-gray xsd-font-size12">在租数</span>
						<span id="inRent" class="xsd-color-yellow xsd-font-size20">0</span>
					</div>
					<div class="xsd-pull-left">
						<span class="xsd-color-gray xsd-font-size12">空房数</span>
						<span id="outRent" class="xsd-color-green xsd-font-size20">0</span>
					</div>
					<!--<a class="xsd-pull-right btn" data-toggle="xsd-modal" data-target="#rentalHouse">添加托管合同</a>-->
					
					
				</div>
				<div id="roomListDiv">
				<!-- 
					<div class="xsd-margin-t22 floor-div">
						<div class="floorNum">
							<span class="xsd-pull-left xsd-btn-primary floor">1楼</span>
							<table class="floor-operation">
								<tr>
									<td>
										  <a data-toggle="xsd-modal" data-target="#delFloor">删除</a>
									</td>
								</tr>
							</table>
						</div>
						<div class="xsd-clearfix">
							<div class="xsd-pull-left xsd-margin-r16">
								<a class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">
									<div class="Details xsd-font-size12">
										<p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;0101室</p>
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
										<p>添加房间</p>
									</a>
								</div>
							</div>
						</div>
					</div>
					-->
					</div>
				</div>
			</div>
		</div>
		<div style="padding:40px;">
			<div class="xsd-color-red" style="font-size:18px;">未出租房间列表</div>
			<table class="list" style="width:100%;border-collapse:collapse;border:none;text-align:center;">
				
			</table>
		</div>
	</div>
	
	
	<!--添加房间对话框
	<div id="ember1010" class="ember-view">
		<div class="xsd-modal xsd-md-modal" id="addRoomDiv" style="display: block;">
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
		$("#buildingCount").html("&nbsp;"+buildingCount+"&nbsp;");
		$("#roomCount").html("&nbsp;"+roomCount+"&nbsp;");
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
				var inRent = 0;
				noRent = [];
				$.each(json,function(i,floor){
					var html = "";
					var thisRent = 0;
					$.each(floor.data,function(j,room){
						var rent = {};
						if(room.depositTotal <= 0 && room.gateTotal <=0){
							rent.colorClazz = "xsd-color-gray";
							rent.text = room.depositTotal?room.depositTotal:"未统计";
							noRent.push(room.roomNumber);
						}else{
							rent.colorClazz = "xsd-color-red";
							rent.text = room.depositTotal;
							inRent++;
							thisRent++;
						}
						html += '<div class="xsd-pull-left xsd-margin-r16 room-module"><a id="'+room.id+'" class="allDetails" data-toggle="xsd-drawer" data-target="#roomDetail">'
						+'<div class="Details xsd-font-size12"><p class="xsd-font-size12 xsd-margin-b6">房间:&nbsp;'+room.roomNumber+'</p>'
						+'<p class="'+rent.colorClazz+' empty">'+rent.text+'</p></div>'
						+'</a></div>';
					});
					html = '<div class="xsd-margin-t22 floor-div"><div class="floorNum"><span class="xsd-pull-left floor floor-top">'
					+ floor.name + '</span><span class="xsd-pull-left floor floor-bottom">'
					+ thisRent + '/' + floor.data.length + '</span></div><div class="xsd-clearfix">'
					+ html + '</div></div>';
					$(html).appendTo($roomList).data("data",floor);
				});
				//显示在租数
				$("#inRent").html(inRent);
				$("#outRent").html(result.data.length - inRent);
				getNoRnetList()
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
	function getNoRnetList(){
		var content = "";
		for(var i = 0;i<=noRent.length-1;i++){
			if(i==0 || i%10==0){
				content+="<tr>";
			}else if(i!=0 && i%10==0){
				content+="</tr>";
			}
			content += "<td>"+noRent[i]+"</td>";
		}
		$(".list").empty().append(content);
	}
	
	
});

</script>
</html>