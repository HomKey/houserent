<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>房间表</title>
<style type="text/css">
</style>
</head>
<body>
<div class="my-content" >
	<div class="text-center table-title">房间信息表</div>
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
       		url:"${basePath}/room/getData",
       		queryParams:function(params){
       			return params;
       		},
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
       	        field: 'roomNumber',
       	        title: '房号',
       	     	//sortable:true,
       	     	editable:false
       	    },{
       	    	field: 'floorNumber',
       	        title: '楼层号',
       	     	editable:false,
       	     	formatter:function(value,row,index){
       	     		var ids = row.id.split(",");
       	     		if(ids.length>2){
       	     			return ids[1];
       	     		}else{
       	     			return "-";
       	     		}
       	     	}
       	    },{
       	    	field:'buildingName',
       	    	title:'所属楼房',
       	    	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'remark',
       	        title: '备注',
       	     	sortable:true,
       	     	editable:{
       	     		emptytext:"-",
       	     		validate: function(value){
       	     			var id = $(this).attr("data-pk");
       	     			return editValidate("remark",value,id);
       	     		}
       	     	}
       	    }, {
       	        field: 'remove',
       	        title: '操作',
                width: 20,//宽度
                align: "center",//水平
                valign: "middle",//垂直
               	formatter: function (value, row, index) {
               		return "<button class='btn btn-danger btn-xs' onclick='removeRoomById(\""+row.id+"\")'>删除</button>";
               	}
       	    }]
	});
	function editValidate(key,value,id){
		var data = $('#myTable').bootstrapTable('getRowByUniqueId', id);
		data[key] = value;
		data = JsonUtil.format(data);
		data.buildingId = data.id.split(",")[0];
		var result = false;
		$.ajax({
 			url:"${basePath}/room/save",
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
		return result;
	}
});
function removeRoomById(id){
	var f = confirm("是否确定删除?");
	if(f){
		$.ajax({
			url:"${basePath}/room/remove",
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
				alert("删除失败(异常)");
	 		}
	 	});
	}
}
</script>
</html>