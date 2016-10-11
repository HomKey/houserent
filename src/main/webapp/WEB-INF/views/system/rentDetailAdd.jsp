<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>租金详细新增</title>
<style type="text/css">
.form-edit{
    padding: 20px 50px 20px 50px;
}
</style>
</head>
<body>
<div class="my-content" >
	<form class="form-edit" id="rentDetailForm">
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
					<td>房间号:</td>
					<td>
						<select id="roomId" name="roomId">
						</select>
					</td>
				</tr>
				<tr>
					<td>日期</td>
					<td>
						<input type="date" id="rentDate" name="rentDate"/>
					</td>
				</tr>
				<tr>
					<td>房租:</td>
					<td><input type="number" name="rent"/></td>
				</tr>
				<tr>
					<td>水费:</td>
					<td><input type="number" name="water"/></td>
				</tr>
				<tr>
					<td>电费:</td>
					<td><input type="number" name="electricity"/></td>
				</tr>
				<tr>
					<td>杂费:</td>
					<td><input type="number" name="incidental"/></td>
				</tr>
				<tr>
					<td>押金:</td>
					<td><input type="number" name="deposit"/></td>
				</tr>
				<tr>
					<td>门押:</td>
					<td><input type="number" name="gate"/></td>
				</tr>
				<tr>
					<td>缴电费:</td>
					<td><input type="number" name="electricityPay"/></td>
				</tr>
				<tr>
					<td>缴水费:</td>
					<td><input type="number" name="waterPay"/></td>
				</tr>
				<tr>
					<td>其它支出:</td>
					<td><input type="number" name="incidentalPay"/></td>
				</tr>
				<tr>
					<td>退押金:</td>
					<td><input type="number" name="depositPay"/></td>
				</tr>
				<tr>
					<td>退门押:</td>
					<td><input type="number" name="gatePay"/></td>
				</tr>
				<tr>
					<td>入住时间:</td>
					<td><input type="text" name="checkIn"/></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input type="text" name="remark"/></td>
				</tr>
			</tbody>
		</table>
	</form>
	<button id="saveRent">保存</button>
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
		$.post("${basePath}/room/getByBuilding",{
			id:buildingId
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
	});
	$("#buildingId").change(function(){
		$.post("${basePath}/room/getByBuilding",{
			id:$(this).children('option:selected').val()
		},function(result){
			var $roomSelect = $("#roomId").empty();
			$.each(result.data,function(i,item){
				var optHtml = '<option value="'+item.id+'">'+item.roomNumber+'</option>';
				$(optHtml).appendTo($roomSelect).data("data",item);
			});
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