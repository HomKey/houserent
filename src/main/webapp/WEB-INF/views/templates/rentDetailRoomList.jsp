<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/head.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<title>租金表2</title>
<style type="text/css">
</style>
</head>
<body>
<div class="my-content" >
	<div class="text-center table-title">租金信息表<span id="roomDetail"></span></div>
	<div id="tableDiv" class="col-md-12">
		<table id="myTable">
		</table>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	if("${param.building}" != null && "${param.building}" != "" ){
		$("#roomDetail").html("("+"${param.building}"+")");
	}
	$.fn.editable.defaults.mode = 'popup';
	function tableHeight() {
		var height = $(window).height() - 60;
        return height;
    }
	var resultData = {};
		$('#myTable').bootstrapTable({
       		//toolbar: '#toolbar',
       		url:"${basePath}/rent/getDataByRoom",
       		queryParams:function(params){
       			params.roomId = "${param.id}";
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
       	        field: 'roomName',
       	        title: '房号',
       	     	//sortable:true,
       	     	editable:false
       	    },{
       	    	field: 'floor',
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
       	    	field:'rentDate',
       	    	title:'日期',
       	    	sortable:true,
       	    	editable:false,//垂直
               	formatter: function (value, row, index) {
               		return DateUtil.format("yyyy-MM",new Date(row.rentDate.time));
               	}
       	    },{
       	        field: 'rent',
       	        title: '租金',
       	     	sortable:true,
       	    	editable:false
       	    }, {
       	        field: 'water',
       	        title: '水费',
	       	    sortable:true,
       	    	editable:false
       	    }, {
       	        field: 'electricity',
       	        title: '电费',
       	     	sortable:true,
       	     	defaultValue:0,
       	    	editable:false
       	    }, {
       	        field: 'incidental',
       	        title: '杂费',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'deposit',
       	        title: '押金',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'gate',
       	        title: '门押',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'electricityPay',
       	        title: '缴电费',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'waterPay',
       	        title: '缴水费',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'incidentalPay',
       	        title: '其它支出',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'depositPay',
       	        title: '退押金',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'gatePay',
       	        title: '退门押',
       	     	sortable:true,
       	    	editable:false
       	    },{
       	        field: 'checkIn',
       	        title: '入住时间',
       	     	sortable:true,
       	    	editable:false
       	    }]
	});
});
</script>
</html>