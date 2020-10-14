<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<p><%= request.getAttribute("name") %>さん、登録が完了しました</p>
		</div>
	</div>
<div class="link">
		<a href="/Login">ログイン画面へ</a>
</div>
</body>
</html>
