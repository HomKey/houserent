<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>楼房表</title>
<style type="text/css">
</style>
</head>
<body>
<div class="my-content" >
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
	
		$('#myTable').bootstrapTable({
       		//toolbar: '#toolbar',
       		url:"${basePath}/building/getData",
       		sortable:true,
       		search: true,
       		height:tableHeight(),
       		pagination:true,
            showRefresh: true,
       		paginationVAlign:"bottom",
       		pageSize:25,
       		undefinedText:"-",
       		//sortName:"name",
       		sidePagination:'client',//'client',//设置为服务器端分页
       		idField:"id",
       		uniqueId:"id",
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
       	    	editable:false
       	    },{
       	    	field:'month',
       	    	title:'月份',
       	    	//sortable:true,
       	    	editable:false
       	    },{
       	        field: 'rent',
       	        title: '租金',
       	     	sortable:true,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("rent",value,id,"number");
       	     		}
       	     	}
       	    }, {
       	        field: 'water',
       	        title: '水费',
	       	    sortable:true,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("water",value,id,"number");
       	     		}
       	     	}
       	    }, {
       	        field: 'electricity',
       	        title: '电费',
       	     	sortable:true,
       	     	defaultValue:0,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("electricity",value,id,"number");
       	     		}
       	     	}
       	    }, {
       	        field: 'incidental',
       	        title: '杂费',
       	     	sortable:true,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("incidental",value,id,"number");
       	     		}
       	     	}
       	    }, {
       	        field: 'columnTotal',
       	        title: '小计',
	       	    sortable:true,
	       	 	formatter:function(value,row,index){
	       	 		return (row.rent || 0 ) + (row.water || 0 ) + (row.electricity || 0) + (row.incidental || 0);
	       	 	}
       	    }, {
       	        field: 'checkIn',
       	        title: '入住时间',
       	     	sortable:true,
       	     	editable:{
	       	     	emptytext:"空",
	       	     	validate : function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("checkIn",value,id,"string");
	       	     	}
       	     	}
       	    }, {
       	        field: 'remove',
       	        title: '操作',
                width: 20,//宽度
                align: "center",//水平
                valign: "middle",//垂直
               	formatter: function (value, row, index) {
               		return "<button class='btn btn-danger btn-xs' onclick='removeRentById(\""+row.id+"\")'>删除</button>";
               	}
       	    }]
	});
	function editValidate(key,value,id,type){
		var data = $('#myTable').bootstrapTable('getRowByUniqueId', id);
		data[key] = value;
		data = JsonUtil.format(data);
		var result = false;
		if(!isNaN(value)){
			$.ajax({
	 			url:"${basePath}/rent/save",
	 			type:"post",
	 			data:data,
	 			success:function(result){
	 				if(result.status=="success"){
	 					//return false;
	 				}else{
	 					result = "修改失败";	
	 				}
	  	 		},
	 			error:function(e){
	  	 			//alert("修改失败");
	  	 			result = "修改失败";
	  	 		}
		 	});
		}else{
			switch(type){
			case 'number':
				result = "请输入正确的金额";
				break;
			case 'string':
				result = "请输入指定格式的数据";
				break;
			default:
				result = "输入的数据格式错误";
				break;
			}
		}
		return result;
	}
});
function removeRentById(id){
	$.ajax({
		url:"${basePath}/rent/remove",
		type:"post",
		data:{id:id},
		success:function(result){
 			if(result.status == "success"){
				$('#myTable').bootstrapTable('removeByUniqueId', id);
 			}else{
 				alert("删除失败");
 			}
 		},
		error:function(e){
			console.log(e);
			alert("删除失败(异常)");
 		}
 	});
}
</script>
</html>