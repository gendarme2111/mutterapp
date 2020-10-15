<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%
	User loginUser = (User) session.getAttribute("loginUser");
%>
<div class="container bg-primary">
	<div class="row d-flex">
		<div class="col-md-3"></div>
		<div class="col-md-6 text-center">
			<i class="far fa-surprise fa-7x"></i>
			<small><%= loginUser.getName() %>さん</small>
		</div>
		<div class="col-md-3 d-flex justify-content-end align-items-end">
			<div class="mb-2">
				<button class="btn btn-secondary px-3" data-toggle="modal" data-target="#modal">つぶやく</button>
				<div class="modal" id="modal" tabindex="-1">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				            <form action="/Main" method="post">
				          <p>つぶやいてください<br>
				            <textarea class="w-100 h-100"  type="text" name="text" required></textarea>
				          </p>
				        </div>
				        <div class="modal-footer">
				          	<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
				          	<input type="submit" class="btn btn-primary" value="つぶやく">
							</form>
				        </div>
				      </div>
				    </div>
			  	</div>
			</div>
			<div class="mb-2">
			<a class="ml-3" href="/Logout"><button class="btn btn-secondary">ログアウト</button></a>
			</div>
		</div>
	</div>
</div>
