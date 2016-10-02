<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/test.css" />
<script type="text/javascript" src="${basePath}/resources/js/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>crud</h1>
<div>
<p>测试</p>
<button type="button" id="saveUserBtn">保存用户</button>
<button type="button" id="saveRoomBtn">保存房间</button>
<button type="button" id="saveDto">测试dto</button>
<button type="button" id="editExcel">修改excel</button>
<form action="${basePath}/test/saveRoom" method="POST">
	<input name="roomNumber" value="101"/>
	<input name="id" value="101"/>
	<input name="floorNumber" value="101"/>
	<input name="building.id" value="1"/>
	<button type="submit" value="提交">提交</button>
</form>
<button type="button" id="getTotal">测试total</button>

</div>

</body>
<script type="text/javascript">
$(function(){
	$("#saveUserBtn").click(function(){
		$.post("${basePath}/test/saveUser",{name:"name0912",age:"20",birthday:"2016-9-12"},function(result){
			console.log(result);
		});
	});
	var roomData = {
		id:"3",
		roomNumber:"房间号",
		floorNumber:"20",
	}
	$("#saveRoomBtn").click(function(){
		$.ajax( {  
	        type : "post",  
	        url : "${basePath}/test/saveRoom",
	        data:roomData,
	        dataType:"json",
	        success : function(msg) {
				console.log(result);
	        }  
	    });
	});
	var rooms = [{id:"6",roomNumber:"6",buildingId:"1"},{id:"61",roomNumber:"61",buildingId:"1"}]; 
	var details = [{id:"1",buildingId:"1",roomId:"6",year:"2016"},{id:"3",buildingId:"1",roomId:"6",year:"2016"}];
	$("#saveDto").click(function(){
		$.post("${basePath}/webservice/checkImportData",{rooms:rooms},function(result){
			console.log(result);
		})
	});
	$("#editExcel").click(function(){
		$.post("${basePath}/excel/editExcel",{filePath:"C:\\server\\apache-tomcat-7.0.57\\webapps\\houserent\\upload\\2016宿舍A栋.xls",id:"1,A幢1楼,A-101房,2016,1",key:"rent",value:"400"},function(result){
			console.log(result);
		});
	});
});
</script>
</html>