<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>楼层表</title>
<style type="text/css">
</style>
</head>
<body>
<div class="my-content" >
	<div class="text-center table-title">楼层信息表</div>
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
	//$.post("${basePath}/building/getParent",function(selectData){
		$('#myTable').bootstrapTable({
       		//toolbar: '#toolbar',
       		url:"${basePath}/floor/getData",
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
       	        field: 'floorName',
       	        title: '名称',
       	     	//sortable:true,
       	     	editable:false
       	    },{
       	    	field:'buildingName',
       	    	title:'所属楼房',
       	    	sortable:true
       	    },{
       	    	field:'remark',
       	    	title:'备注',
       	    	//sortable:true,
       	     	editable:false,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value) {
	       	     		if (!$.trim(value)) {
	                        return '不能为空';
	                    }
       	     			var id = $(this).attr("data-pk");
       	     			return editBuilding(id,"remark",value);
	       	     	}
       	     	}
       	    }, {
       	        field: 'remove',
       	        title: '操作',
                width: 20,//宽度
                align: "center",//水平
                valign: "middle",//垂直
               	formatter: function (value, row, index) {
               		return "<button class='btn btn-danger btn-xs' onclick='removeFloorById(\""+row.id+"\")'>删除</button>";
               	}
       	    }]
		});
	//});
	function editBuilding(id,key,value){
		$.post("${basePath}/floor/edit",{id:id,key:key,value:value},function(result){
			if(result.status == "success" && result.data == "1"){
				
			}else{
				alert("修改失败!");
			}
		})
	}
});
function removeFloorById(id){
	$.ajax({
		url:"${basePath}/floor/remove",
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
</script>
</html>