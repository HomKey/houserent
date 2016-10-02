<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>excel导入页面</title>
</head>
<body>
<div class="my-content" >
	<form id="uploadForm" style="height:45px;">
		<input type="button" id="tijiao" class="btn btn-success" value="提交"/>
		<input type="button" id="exportBtn" class="btn btn-success" value="导入数据" style="display:none;"/>
		<input type="text" name="buildingId" value="1" style="display:none;"/>
		<input type="file" name="file"/>
	</form>
	<div id="tableDiv" class="col-md-12">
		<table id="myTable">
		</table>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	$.fn.editable.defaults.mode = 'popup';
	function tableHeight() {
		var height = $(window).height() - 60;
        return height;
    }
	var resultData = {};
	//导入
	$("#tijiao").click(function(){
		var forData = new FormData($( "#uploadForm" )[0]); 
		$.ajax({ 
			url: "${basePath}/excel/getExcelData.do",
			type:"post",
			data : forData,
			dataType:"json",
			cache: false,  
	        processData: false,  
	        contentType: false,
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	        	alert("文件有误,请重新选择需要导入的文件");
	        	location.reload();
	        },
			success: function(result){
				if(result.status == "success"){
					$("#exportBtn").show();
					resultData.filePath = result.filePath;
			       	$('#myTable').bootstrapTable({
			       		toolbar: '#toolbar',
			       		//checkboxHeader:false,
			       		sortable:true,
			       		search: true,
			       		height:tableHeight(),
			       		pagination:true,
			            showRefresh: true,
			       		paginationVAlign:"bottom",
			       		pageSize:25,
			       		undefinedText:"",
			       		//sortName:"name",
			       		idField:"id",
			       		onEditableSave: function (field, row, oldValue, $el) {
			       			
			       		},
			       	    columns: [{
			       	    	title: "序号",
	                        field: "index",
	                        width: 20,//宽度
	                        align: "center",//水平
	                        valign: "middle",//垂直
                        	formatter: function (value, row, index) {
                        		return index+1;
                        	}
			       	    },{
			       	        field: 'id',
			       	        title: 'Item ID',
			       	     	visible:false
			       	    },{
			       	        field: 'roomName',
			       	        title: '房号',
			       	     	//sortable:true,
			       	     	editable:false
			       	    },{
			       	    	field:'year',
			       	    	title:'年份',
			       	    	//sortable:true,
			       	    	editable:false,//垂直
			               	formatter: function (value, row, index) {
			               		return DateUtil.format("yyyy",new Date(row.rentDate));
			               	}
			       	    },{
			       	    	field:'month',
			       	    	title:'月份',
			       	    	//sortable:true,
			       	    	editable:false,//垂直
			               	formatter: function (value, row, index) {
			               		return DateUtil.format("MM",new Date(row.rentDate));
			               	}
			       	    },{
			       	        field: 'rent',
			       	        title: '租金',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"rent",value);
				       	     	}
			       	     	}
			       	    }, {
			       	        field: 'water',
			       	        title: '水费',
				       	    sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"water",value);
				       	     	}
			       	     	}
			       	    }, {
			       	        field: 'electricity',
			       	        title: '电费',
			       	     	sortable:true,
			       	     	defaultValue:0,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"electricity",value);
				       	     	}
			       	     	}
			       	    }, {
			       	        field: 'incidental',
			       	        title: '杂费',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"incidental",value);
				       	     	}
			       	     	}
			       	    }, {
			       	        field: 'columnTotal',
			       	        title: '小计',
				       	    sortable:true,
				       	 	formatter:function(value,row,index){
				       	 		return row.rent+row.water+row.electricity+row.incidental;
				       	 	}
			       	    }, {
			       	        field: 'checkIn',
			       	        title: '入住时间',
			       	     	sortable:true,
			       	     	editable:{
				       	     	emptytext:"空",
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"checkIn",value);
				       	     	}
			       	     	}
			       	    }],
			       	    data: result.rentDetails
			       	    /*,
			       	 	onEditableSave:function(field, row, oldValue, $el){
				       		 return editExcel(result.filePath,row.id,field,row[field]);
				       	}
			       		*/
			       	});
				}
	      	}
		});
	});
	function editExcel(filePath,id,key,value){
		$.post("${basePath}/excel/editExcel",{filePath:filePath,id:id,key:key,value:value},function(result){
			if(result.status == "success"){
				return false;
			}else{
				return "更改失败";
			}
		});
	}
	$("#exportBtn").on("click",function(){
		$.post("${basePath}/excel/export",{filePath:resultData.filePath,buildingId:"1"},function(result){
			if(result.status == "success"){
				alert("导入成功");
			}else{
				if(result.status=="fail" && result.message!=""){
					alert("导入失败:"+result.message);
				}
			}
		}).error(function() {
			alert("请检查文件内容格式后,再重新导入!");
		});
	});
});
</script>
</html>