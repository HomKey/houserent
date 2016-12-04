<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
<title>新增房间</title>
</head>
<body>

<section class="content-header">
  <h1>新增房间</h1>
  <!-- 
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Forms</a></li>
    <li class="active">General Elements</li>
  </ol>
   -->
</section>

<section class="content">
	<form id="roomForm" class="form-horizontal">
	<input id="id" name="id" hidden="true"/>
	  <div class="box-body">
	    <div class="form-group">
	      <label for="buildingId" class="col-sm-1 control-label">楼房名称:</label>
	      <div class="col-sm-4">
            <select class="form-control" id="buildingId" name="buildingId">
            </select>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="floorId" class="col-sm-1 control-label">楼层号:</label>
	      <div class="col-sm-4">
			<select class="form-control" id="floorId" name="floorId">
			</select>
	      </div>
	   		<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="roomNumber" class="col-sm-1 control-label">房间号:</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="roomNumber" name="roomNumber" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="remark" class="col-sm-1 control-label">备注:</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="remark" name="remark" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	  </div>
	  <div class="box-footer">
	    	<div class="col-sm-1"></div>
	    	<div class="col-sm-4">
	    	<button type="button" id="saveRoom" class="btn btn-info">保存</button>
	    	</div>
	    	<div class="col-sm-7"></div>
	  </div>
	</form>
</section>
</body>
<script type="text/javascript">
$(function(){
	$.post("${basePath}/building/getChildren",function(result){
		var $buildingSelect = $("#buildingId").empty();
		var bHtml = '';
		var buildingId = '';
		$.each(result,function(i,item){
			if(i == 0){
				buildingId = item.value;
			}
			bHtml += '<option value="'+item.value+'">'+item.text+'</option>';
		});
		$(bHtml).appendTo($buildingSelect);
		if(buildingId != null && buildingId != ""){
			$.post("${basePath}/floor/getByBuilding",{id:buildingId},function(floorResult){
				if(floorResult.status == "success"){
					var $floorSelect = $("#floorId").empty();
					var fHtml = '';
					$.each(floorResult.data,function(i,item){
						fHtml += '<option value="'+item.id+'">'+item.floorName+'</option>';
					});
					$(fHtml).appendTo($floorSelect);
				}
			});
		}
	});

	$("#buildingId").change(function(){
		$.post("${basePath}/floor/getByBuilding",{id:$(this).val()},function(floorResult){
			if(floorResult.status == "success"){
				var $floorSelect = $("#floorId").empty();
				var fHtml = '';
				$.each(floorResult.data,function(i,item){
					fHtml += '<option value="'+item.id+'">'+item.floorName+'</option>';
				});
				$(fHtml).appendTo($floorSelect);
			}
		});
	});
	$("#saveRoom").click(function(){
		$("#id").val($("#floorId").val()+","+$("#roomNumber").val());
		$.post("${basePath}/room/save?"+$("#roomForm").serialize(),function(result){
			if(result.status == "success"){
				alert("保存成功");
				setTimeout(function(){
					location.href = "${basePath}/system/roomList";
				},1000);
			}
		});
	});
});
</script>
</html>