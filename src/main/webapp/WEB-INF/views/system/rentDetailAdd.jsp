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
	<form class="form-edit">
		<table>
			<tbody>
				<tr>
					<td>楼房名称:</td>
					<td><input type="text" name="building"/></td>
				</tr>
				<tr>
					<td>楼层</td>
					<td><input type="text" name="floor"/></td>
				</tr>
				<tr>
					<td>房间号</td>
					<td><input type="text" name="room"/></td>
				</tr>
				<tr>
					<td>房租</td>
					<td><input type="number" name="rent"/></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
<script type="text/javascript">
$(function(){
	//$.fn.editable.defaults.mode = 'popup';
});
</script>
</html>