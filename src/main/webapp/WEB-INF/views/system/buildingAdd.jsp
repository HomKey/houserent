<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>楼房新增</title>
<style type="text/css">
.form-edit{
    padding: 20px 50px 20px 50px;
}
</style>
</head>
<body>
<div class="my-content" >
	<form id="buildingForm" class="form-edit" >
		<table>
			<tbody>
				<tr>
					<td>楼房名称:</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>所属:</td>
					<td>
						<select id="parentId" name="parentId">
						</select>
					</td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input type="text" name="remark"/></td>
				</tr>
			</tbody>
		</table>
	</form>
	<button id="saveBuilding">保存</button>
</div>
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