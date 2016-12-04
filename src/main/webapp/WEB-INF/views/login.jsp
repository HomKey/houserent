<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/WEB-INF/common/js.jsp" %>
<%@include file="/WEB-INF/common/bootstrap.jsp" %>
<link rel="stylesheet" href="${basePath}/resources/js/dist/css/AdminLTE.min.css">
<title>登录页面</title>
</head>
<body class="hold-transition login-page" style="background: #3c8dbc;">
<div class="login-box">
  <div class="login-logo">
    <a href="javascript:void(0);"><b style="color: #FFF;">房屋租金管理系统</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg" style="font-weight: bold;">密码登录</p>

    <form action="${basePath }/userLogin.do" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="username" placeholder="账号">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="password" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- 
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" value="true"/> 记住我
            </label>
          </div>
        </div>
           -->
       <!--  /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
<!-- 
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div> -->
    <!-- /.social-auth-links 

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>
-->
  </div>
  <!-- /.login-box-body -->
</div>

<!-- iCheck 
<script src="../../plugins/iCheck/icheck.min.js"></script>-->
<script>
/*
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
	  */
</script>
</body>
<!-- 
<body>
<form action="${basePath }/login.do" method="post">
	用户名:<input type="text" name="j_username"/>
	密码:<input type="password" name="j_password"/>
	<input type="submit" value="登录"/>
</form>
</body>
 -->
</html>