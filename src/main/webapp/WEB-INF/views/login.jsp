<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${basePath}/resources/css/test.css" />
<script type="text/javascript" src="${basePath}/resources/js/jquery-1.11.3.min.js"></script>
<title>登录页面</title>
</head>
<body>
<form action="${basePath }/login.do" method="post">
	用户名:<input type="text" name="j_username"/>
	密码:<input type="password" name="j_password"/>
	<input type="submit" value="登录"/>
</form>
</body>
</html>