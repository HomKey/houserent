<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
<title>新增租金详细</title>
</head>
<body>


<section class="content-header">
  <h1>新增租金详细</h1>
  <!-- 
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Forms</a></li>
    <li class="active">General Elements</li>
  </ol>
   -->
</section>

<section class="content">
	<form id="rentDetailForm" class="form-horizontal">
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
		      <label for="roomId" class="col-sm-1 control-label">房间号:</label>
		      <div class="col-sm-4">
		        <select class="form-control" id="roomId" name="roomId">
            	</select>
		      </div>
	   		<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="rentDate" class="col-sm-1 control-label">日期:</label>
	      <div class="col-sm-4">
	        <input type="date" class="form-control" id="rentDate" name="rentDate" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="rent" class="col-sm-1 control-label">租金:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="rent" name="rent" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="water" class="col-sm-1 control-label">水费:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="water" name="water" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="electricity" class="col-sm-1 control-label">电费:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="electricity" name="electricity" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="incidental" class="col-sm-1 control-label">杂费:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="incidental" name="incidental" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="deposit" class="col-sm-1 control-label">押金:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="deposit" name="deposit" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="gate" class="col-sm-1 control-label">门押:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="gate" name="gate" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="electricityPay" class="col-sm-1 control-label">缴电费:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="electricityPay" name="electricityPay" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="waterPay" class="col-sm-1 control-label">缴水费:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="waterPay" name="waterPay" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="incidentalPay" class="col-sm-1 control-label">其它支出:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="incidentalPay" name="incidentalPay" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="depositPay" class="col-sm-1 control-label">退押金:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="depositPay" name="depositPay" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="gatePay" class="col-sm-1 control-label">退门押:</label>
	      <div class="col-sm-4">
	        <input type="number" class="form-control" id="gatePay" name="gatePay" placeholder=""/>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="checkIn" class="col-sm-1 control-label">入住时间:</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="checkIn" name="checkIn" placeholder=""/>
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
	    	<button type="button" id="saveRent" class="btn btn-info">保存</button>
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
		var floorId = '';
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
						if(i == 0){
							floorId = item.id;
						}
						fHtml += '<option value="'+item.id+'">'+item.floorName+'</option>';
					});
					$(fHtml).appendTo($floorSelect);
					if(floorId != null && floorId != ""){
						$.post("${basePath}/room/getByFloor",{
							id:floorId
						},function(result){
							if(result.status == "success" ){
								if(result.data.length > 0){
									var $roomSelect = $("#roomId").empty();
									$.each(result.data,function(i,item){
										var rHtml = '<option value="'+item.id+'">'+item.roomNumber+'</option>';
										$(rHtml).appendTo($roomSelect).data("data",item);
									});
								}
							}
						});
					}
				}
			});
		}
	});
	$("#buildingId").change(function(){
		$.post("${basePath}/floor/getByBuilding",{id:$(this).children('option:selected').val()},function(floorResult){
			var floorId = '';
			if(floorResult.status == "success"){
				var $floorSelect = $("#floorId").empty();
				var fHtml = '';
				$.each(floorResult.data,function(i,item){
					if(i == 0){
						floorId = item.id;
					}
					fHtml += '<option value="'+item.id+'">'+item.floorName+'</option>';
				});
				$(fHtml).appendTo($floorSelect);
				var $roomSelect = $("#roomId").empty();
				if(floorId != null && floorId != ""){
					$.post("${basePath}/room/getByFloor",{
						id:floorId
					},function(result){
						if(result.status == "success" ){
							if(result.data.length > 0){
								$.each(result.data,function(i,item){
									var rHtml = '<option value="'+item.id+'">'+item.roomNumber+'</option>';
									$(rHtml).appendTo($roomSelect).data("data",item);
								});
							}
						}
					});
				}
			}
		});
	});
	$("#floorId").change(function(){
		$.post("${basePath}/room/getByFloor",{
			id:$(this).children('option:selected').val()
		},function(result){
			var $roomSelect = $("#roomId").empty();
			if(result.status == "success" ){
				if(result.data.length > 0){
					$.each(result.data,function(i,item){
						var rHtml = '<option value="'+item.id+'">'+item.roomNumber+'</option>';
						$(rHtml).appendTo($roomSelect).data("data",item);
					});
				}
			}
		});
	});
	$("#saveRent").click(function(){
		if($("#rentDate") == null || $("#rentDate") == ""){
			alert("请选择日期!");
			return;
		}
		if($("#roomId").val() == null){
			var f = confirm("当前所选楼房暂无房间号,是否添加房间?");
			if(f){
				location.href = "${basePath}/system/roomAdd";
			}else{
				return;
			}
		}else{
			$("#id").val($("#roomId").val() + DateUtil.format(",yyyy,MM",new Date($("#rentDate").val())));
			$.post("${basePath}/rent/save?"+$("#rentDetailForm").serialize(),function(result){
				if(result.status == "success"){
					alert("保存成功");
					setTimeout(function(){
						location.href = "${basePath}/system/rentDetailList";
					},1000);
				}
			});
		}
	});
});
</script>
</html>