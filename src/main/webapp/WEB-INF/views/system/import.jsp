<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>excel导入页面</title>
<style type="text/css">  
.loading{  
    width:160px;  
    height:56px;  
    position: absolute;  
    top:50%;  
    left:50%;  
    line-height:56px;  
    color:#fff;  
    margin-left: -80px;
    padding-left: 60px;
    font-size:15px;  
    background: #000 url(${basePath}/resources/images/loading.gif) no-repeat 10px 50%;  
    z-index:9999;  
}
#xsd-modal-mask {
	display: none;
    z-index: 300;
	top: 0;
    position: fixed;
    height: 100%;
    width: 100%;
    z-index: 100;
    background: #000;
    opacity: 0.5;
}
</style>
</head>
<body>
<div id="xsd-modal-mask">
	<div id="loading" class="loading" >提交中</div>
</div>
<div style="padding: 20px;">
	<form id="uploadForm" style="height:45px;">
		<input type="button" id="exportBtn" class="btn btn-success" value="导入数据" style="display:none;"/>
		<input type="text" name="buildingId" value="${param.buildingId}" style="display:none;"/>
		<input type="file" id="file" name="file"/>
		<input type="button" id="tijiao" class="btn btn-success" value="提交" disabled="true"/>
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
	$("#file").change(function(){
		$("#tijiao").attr("disabled",false); 
	});
	
	//导入
	$("#tijiao").click(function(){
		$("#loading").html("提交中...");
		$("#xsd-modal-mask").show();
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
	    		$("#xsd-modal-mask").hide();
	        	alert("文件有误,请重新选择需要导入的文件");
	        	location.reload();
	        },
			success: function(result){
	    		$("#xsd-modal-mask").hide();
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
			       	    columns: [/*{
			       	    	title: "序号",
	                        field: "index",
	                        width: 20,//宽度
	                        align: "center",//水平
	                        valign: "middle",//垂直
                        	formatter: function (value, row, index) {
                        		return index+1;
                        	}
			       	    },*/{
			       	        field: 'id',
			       	        title: 'Item ID',
			       	     	visible:false
			       	    },{
			       	        field: 'roomName',
			       	        title: '房号',
			       	     	//sortable:true,
			       	     	editable:false
			       	    },{
			       	        field: 'room.id',
			       	        title: '楼层号',
			       	     	editable:false,
			       	     	formatter:function(value,row,index){
			       	     		var ids = value.split(",");
			       	     		if(ids.length>2){
			       	     			return ids[1];
			       	     		}else{
			       	     			return "-";
			       	     		}
			       	     	}
			       	    },{
			       	    	field:'rentDate',
			       	    	title:'日期',
			       	    	//sortable:true,
			       	    	editable:false,//垂直
			               	formatter: function (value, row, index) {
			               		return DateUtil.format("yyyy-MM",new Date(row.rentDate));
			               	}
			       	    },/*{
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
			       	    },*/{
			       	        field: 'rent',
			       	        title: '租金',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"rent",value,"number");
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
			       	     			return editExcel(result.filePath,id,"water",value,"number");
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
			       	     			return editExcel(result.filePath,id,"electricity",value,"number");
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
			       	     			return editExcel(result.filePath,id,"incidental",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'deposit',
			       	        title: '押金',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"deposit",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'gate',
			       	        title: '门押',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"gate",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'electricityPay',
			       	        title: '缴电费',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"electricityPay",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'waterPay',
			       	        title: '缴水费',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"waterPay",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'incidentalPay',
			       	        title: '其它支出',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"incidentalPay",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'depositPay',
			       	        title: '退押金',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"depositPay",value,"number");
				       	     	}
			       	     	}
			       	    },{
			       	        field: 'gatePay',
			       	        title: '退门押',
			       	     	sortable:true,
			       	     	editable:{
			       	     		emptytext:0,
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"gatePay",value,"number");
				       	     	}
			       	     	}
			       	    },/* {
			       	        field: 'columnTotal',
			       	        title: '小计',
				       	    sortable:true,
				       	 	formatter:function(value,row,index){
				       	 		return row.rent+row.water+row.electricity+row.incidental;
				       	 	}
			       	    }, */{
			       	        field: 'checkIn',
			       	        title: '入住时间',
			       	     	sortable:true,
			       	     	editable:{
				       	     	emptytext:"空",
			       	     		validate: function(value) {
			       	     			var id = $(this).attr("data-pk");
			       	     			return editExcel(result.filePath,id,"checkIn",value,"string");
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
				}else{
					alert(result.message);
				}
	      	}
		});
	});
	function editExcel(filePath,id,key,value,type){
		switch(type){
			case 'number':
				if(!isNaN(value)){
					$.post("${basePath}/excel/editExcel",{filePath:filePath,id:id,key:key,value:value},function(result){
						if(result.status == "success"){
							return false;
						}else{
							return "更改失败";
						}
					});
				}else{
					return "请输入正确的金额";
				}
				break;
			case 'string':
				$.post("${basePath}/excel/editExcel",{filePath:filePath,id:id,key:key,value:value},function(result){
					if(result.status == "success"){
						return false;
					}else{
						return "更改失败";
					}
				});
				break;
			default:
				return "输入的数据格式错误";
				break;
		}
	}
	$("#exportBtn").on("click",function(){
		$("#loading").html("导入中...");
		$("#xsd-modal-mask").show();
		$.post("${basePath}/excel/export",{filePath:resultData.filePath,buildingId:"${param.buildingId}"},function(result){
			$("#xsd-modal-mask").hide();
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