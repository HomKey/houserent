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
	<div class="text-center table-title">楼房信息表</div>
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
       	        field: 'name',
       	        title: '名称',
       	     	//sortable:true,
       	     	editable:false,
       	     	editable:{
       	     		emptytext:0,
       	     		validate: function(value) {
	       	     		if (!$.trim(value)) {
	                        return '不能为空';
	                    }
       	     			var id = $(this).attr("data-pk");
       	     			return editBuilding(id,"name",value);
	       	     	}
       	     	}
       	    },{
       	    	field:'level',
       	    	title:'所属',
       	    	sortable:true,
   	     		/*
       	     	editable:{
	       	     	type: "select",              //编辑框的类型。支持text|textarea|select|date|checklist等
	                source: selectData,
	                emptytext:'-',
	                title: "选择所属",           //编辑框的标题
	                disabled: false,           //是否禁用编辑
	                validate: function (value) { //字段验证
	                	if (!$.trim(value)) {
	                        return '不能为空';
	                    }
	                	$.post("${basePath}/building/setParent",{
	                		id:,
	                		parentId,
	                	},function(){
	                		
	                	});
	                	console.log(value);
	                    
	                }
       	     	},
       	    */
       	     	formatter: function (value, row, index) {
               		return row.parentName;
               	}
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
               		var b = false;
               		if(row.longcode == ""){
               			b = true;
               		}
               		return "<button class='btn btn-danger btn-xs' onclick='removeBuildById(\""+row.id+"\",\""+b+"\")'>删除</button>";
               	}
       	    }]
		});
	//});
	function editBuilding(id,key,value){
		$.post("${basePath}/building/edit",{id:id,key:key,value:value},function(result){
			if(result.status == "success" && result.data == "1"){
				
			}else{
				alert("修改失败!");
			}
		})
	}
});
function removeBuildById(id,b){
	if(b){
		alert("请先删除下属楼房!");
	}
	$.ajax({
		url:"${basePath}/building/remove",
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