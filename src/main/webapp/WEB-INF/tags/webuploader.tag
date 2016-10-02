<!--2016/08/3 卢鸿基  文件上传webuploader标签组件-->

<%@ tag language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/WEB-INF/common/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false" description="id"%>
<%@ attribute name="action" type="java.lang.String" required="false" description="文件上传请求地址"%>
<%@ attribute name="url" type="java.lang.String" required="false" description="文件上传地址"%>
<%@ attribute name="method" type="java.lang.String" required="false" description="POST/GET"%>
<%@ attribute name="fileNumLimit" type="java.lang.String" required="false" description="文件上传数量"%>
<link type="text/css" rel="stylesheet" href="${basePath}/resources/js/webuploader/css/webuploader.css" />
<script type="text/javascript" src="${basePath}/resources/js/webuploader/js/webuploader.js"></script>
<c:if test="${empty id}">
	<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
	<c:set var="id" value="div_${now.time}"></c:set>
</c:if>
<c:if test="${empty method}">
	<c:set var="method" value="POST"></c:set>
</c:if>
<c:if test="${empty action}">
	<c:set var="action" value="${basePath}/upload.do"></c:set>
</c:if>
<c:if test="${empty fileNumLimit}">
	<c:set var="fileNumLimit" value="undefined"></c:set>
</c:if>
<div id="${id }" class="wu-example">
	<form>
	    <div class="btns" style="float:left">
	        <div id="${id}picker">选择文件</div>
	    </div>
	    <table role="presentation" class="table table-striped"><tbody id="${id}Tbody" class="files"></tbody></table>
    </form>
</div>

<script type="text/javascript">
$(function () {
	var $uploadFileTbody = $("#${id}Tbody");
	var uploader = WebUploader.create({
		auto:true,
	    // swf文件路径
	    swf: '${bserURL}/resources/js/webuploader/Uploader.swf',
	    formData :{path:"${url}"},
	    // 文件接收服务端。
	    server: '${action}',
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: {
	    	id:'#${id}picker',
	    	label:"<span class='glyphicon glyphicon-folder-open'></span>"
	    },
	    // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
	    resize: false,
	    fileNumLimit:'${fileNumLimit}'
	});
	// 当有文件被添加进队列的时候
	uploader.on( 'fileQueued', function( file ) {
	    var ext = file.ext;
	    var $tr = $('<tr id="'+file.id+'" class="template-upload fade in"><td><span class="preview"><img></span></td><td>'+
		'<p class="name">' + file.name + '</p><strong class="error text-danger"></strong></td><td><p class="size">'+WebUploader.formatSize(file.size,2)+'</p>'+
		'<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">'+
		'<div class="progress-bar progress-bar-success" style="width:0%;"></div></div>'+
		'</td></tr>').data("file",file);
	    /*
	    <td><button class="btn btn-warning cancel"><i class="glyphicon glyphicon-ban-circle"></i>'+
        '<span>移除</span></button></td>
	    */
	    var $img = $tr.find("img");
        $uploadFileTbody.append($tr);
    	uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
	        $img.attr( 'src', src );
	    }, 80, 80 );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $tr = $( '#'+file.id );
	   	var $percent = $tr.find('.progress .progress-bar');
	    // 避免重复创建
	    if ( !$percent.length ) {
	        $percent = $('<div class="progress progress-striped active">' +
	          '<div class="progress-bar" role="progressbar" style="width: 0%">' +
	          '</div>' +
	        '</div>').appendTo( $tr ).find('.progress-bar');
	    }
	    $tr.find('strong.error').text('上传中');
	    $percent.css( 'width', percentage * 100 + '%' );
	});
	//上传成功
	uploader.on( 'uploadSuccess', function(file,response) {
		response.file = file;
		var $tr = $('#'+file.id);
		$tr.data("data",response);
		if(response.status == "success"){
		    $tr.find('button.cancel').prop("disabled","disabled");
		    $tr.find('strong.error').text('上传成功');
		}else{
		    $tr.find('strong.error').text('上传出错');
		}
	});
	//上传失败
	uploader.on( 'uploadError', function(file,reason) {
	    $( '#'+file.id ).find('strong.error').text('上传出错:'+reason);
	});
	//上传完成
	uploader.on( 'uploadComplete', function( file ) {
	    $( '#'+file.id ).find('.progress').fadeOut();
	});
	//绑定事件
	$uploadFileTbody.on("click",".cancel",function(){//移除上传
		var $tr = $(this).closest("tr");
		var file = $tr.data("file");
		$tr.remove();
		uploader.removeFile( file );
	});
	/*
	$("#${id}ctlBtn").click(function(){
		uploader.upload();
	});
	*/
});
</script>
