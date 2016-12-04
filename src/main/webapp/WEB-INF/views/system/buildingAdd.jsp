<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
<title>添加公寓</title>
</head>
<body>
<section class="content-header">
  <h1>添加公寓</h1>
  <!-- 
  <ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
    <li><a href="#">Forms</a></li>
    <li class="active">General Elements</li>
  </ol>
   -->
</section>

<section class="content">
	<form id="buildingForm" class="form-horizontal">
	  <div class="box-body">
	    <div class="form-group">
	      <label for="parentId" class="col-sm-1 control-label">所属:</label>
	      <div class="col-sm-4">
            <select class="form-control" id="parentId" name="parentId">
            </select>
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
		      <label for="name" class="col-sm-1 control-label">楼房名称:</label>
		      <div class="col-sm-4">
		        <input type="text" class="form-control" id="name" name="name" placeholder="">
		      </div>
	   		<div class="col-sm-7"></div>
	    </div>
	    <div class="form-group">
	      <label for="remark" class="col-sm-1 control-label">备注:</label>
	      <div class="col-sm-4">
	        <input type="text" class="form-control" id="remark" name="remark" placeholder="">
	      </div>
	    	<div class="col-sm-7"></div>
	    </div>
	  </div>
	  <div class="box-footer">
	    	<div class="col-sm-1"></div>
	    	<div class="col-sm-4">
	    	<button type="button" id="saveBuilding" class="btn btn-info">保存</button>
	    	</div>
	    	<div class="col-sm-7"></div>
	  </div>
	</form>

</section>
	
</body>
<script type="text/javascript">
$(function(){
	$.post("${basePath}/building/getParent",function(result){
		var $select = $("#parentId").empty();
		var optHtml = '<option value="" selected="selected">无</option>';
		$.each(result,function(i,item){
			optHtml += '<option value="'+item.value+'">'+item.text+'</option>';
		});
		$(optHtml).appendTo($select);
	});
	$("#saveBuilding").click(function(){
		$.post("${basePath}/building/save?"+$("#buildingForm").serialize(),function(result){
			if(result.status == "success"){
				alert("保存成功");
				setTimeout(function(){
					location.href = "${basePath}/system/buildingList";
				},1000);
			}
		});
	});
	//
});
</script>
</html>