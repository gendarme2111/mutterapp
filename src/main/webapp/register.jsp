<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
</head>
<body>
	<%	if(request.getAttribute("nameErr")!=null||request.getAttribute("passErr")!=null||request.getAttribute("registerErr")!=null){ %>
	<p class="text-center mt-5">ユーザー登録をお願いします</p>
	<div class="border mx-auto w-25 bg-primary">
		<form action="/registerapp/Register" method="post">
			<div class="form-group mt-4 ml-4 mr-4">
				ユーザー名<input class="form-control mt-2 " type="text" name="name" placeholder="半角英数字で入力">
				<small class="text-danger"><%= request.getAttribute("registerErr") %></small>
				<small class="text-danger"><%= request.getAttribute("nameErr") %></small><br>
				パスワード<input class="form-control mt-2" type="password" name="pass" placeholder="半角英数字で入力">
				<small class="text-danger"><%= request.getAttribute("passErr") %></small><br>
				<div class="text-center"><br>
					<button class="btn btn-secondary" type="submit">登録</button>
				</div>
			</div>
		</form>
	</div>
	<%}else{ %>
	<p class="text-center mt-5">ユーザー登録をお願いします</p>
	<div class="border mx-auto w-25 bg-primary">
		<form action="/registerapp/Register" method="post">
			<div class="form-group mt-4 ml-4 mr-4">
				ユーザー名<input class="form-control mt-2 " type="text" name="name" placeholder="半角英数字で入力">
				パスワード<input class="form-control mt-2" type="password" name="pass" placeholder="半角英数字で入力">
				<div class="text-center"><br>
					<button class="btn btn-secondary" type="submit">登録</button>
				</div>
			</div>
		</form>
	</div>
	<%} %>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>