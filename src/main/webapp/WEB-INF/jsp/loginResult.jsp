<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<% User loginUser = (User)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html>
<head>
<style>
.ct{width:400px; margin: 100px auto 0px auto;}
.form{background-color:#eaeaea; padding:30px 50px;}
p{text-align:center;}
.link {	margin: 0 auto;text-align: center;}
</style>
<meta charset="UTF-8">
<title>登録結果表示</title>
</head>
<body>
	<div class="ct">
		<div class="form">
			<p><%= loginUser.getName() %>さん、ログインが完了しました</p>
		</div>
	</div>
<div class="link">
		<a href="">トップへ</a>
</div>
</body>
</html>
