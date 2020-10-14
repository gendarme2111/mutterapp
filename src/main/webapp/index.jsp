<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.ct{width:400px; margin: 0 auto;}
form{background-color:#eaeaea; padding:30px 50px;}
form dl dt{width:100px; padding:10px 0; float:left; clear:both;}
form dl dd{padding:10px 0;}
.input{margin:0 auto; text-align:center;}
p{text-align:center;}
</style>
<meta charset="UTF-8">
<title>ユーザー登録画面</title>
</head>
<body>
<%	if(request.getAttribute("nameErr")!=null||request.getAttribute("passErr")!=null||request.getAttribute("registerErr")!=null){ %>
<p><span style="color:red;text-align:center;"><%= request.getAttribute("nameErr") %></span></p>
<p><span style="color:red;text-align:center;"><%= request.getAttribute("passErr") %></span></p>
<p><span style="color:red;text-align:center;"><%= request.getAttribute("registerErr") %></span></p>
	<div class="ct">
		<form action="/Register" method="post">
			<dl>
				<dt>ユーザー名:</dt>
					<dd><input type="text" name="name" placeholder="半角英数字で入力"></dd>
				<dt>パスワード:</dt>
					<dd><input type="password" name="pass" placeholder="半角英数字で入力"></dd>
			</dl>
		<div class="input"><input type="submit" value="送信" ></div>
		</form>
	</div>
		<%}else{ %>
	<div class="ct">
		<p>※ユーザー登録をお願いします※</p>
		<form action="/Register" method="post">
			<dl>
				<dt>ログインID:</dt>
					<dd><input type="text" name="name" placeholder="半角英数字で入力"></dd>
				<dt>パスワード:</dt>
					<dd><input type="password" name="pass" placeholder="半角英数字で入力"></dd>
			</dl>
		<div class="input"><input type="submit" value="送信" ></div>
		</form>
		</div>
		<%} %>
</body>
</html>