<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>楼层新增</title>
<style type="text/css">
.form-edit{
    padding: 20px 50px 20px 50px;
}
</style>
</head>
<body>
<div class="my-content" >
	<form class="form-edit" id="floorForm">
		<table>
			<tbody>
				<tr>
					<td><input id="id" name="id" hidden="true"/></td>
				</tr>
				<tr>
					<td>楼房名称:</td>
					<td>
						<select id="buildingId" name="buildingId">
						</select>
					</td>
				</tr>
				<tr>
					<td>楼层号:</td>
					<td><input id="floorName" type="text" name="floorName"/>
					</td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input type="text" name="remark"/></td>
				</tr>
			</tbody>
		</table>
	</form>
	<button id="saveFloor">保存</button>
</div>
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
	});
	$("#saveFloor").click(function(){
		$("#id").val($("#buildingId").val()+","+$("#floorName").val());
		$.post("${basePath}/floor/save?"+$("#floorForm").serialize(),function(result){
			if(result.status == "success"){
				alert("保存成功");
				setTimeout(function(){
					location.href = "${basePath}/system/floorList";
				},1000);
			}
		});
	});
});
</script>
</html>