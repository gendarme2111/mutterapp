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
				<button type="button" class="btn btn-secondary px-3" data-toggle="modal" data-target="#modal">つぶやく</button>
				<div class="modal" id="modal" tabindex="-1">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				      	<div class="modal-header">
				        </div>
				        <div class="modal-body">
				            <form class="needs-validation" novalidate action="/Main" method="post">
                      		<div class="form-group">
				            	<textarea class="form-control pt-5 pb-4" style="text-align:center;" name="text" placeholder="こちらにつぶやいて下さい"required></textarea>
      							<div class="invalid-feedback">何かつぶやいてください</div>
				        	</div>
				        	<div class="modal-footer">
				          		<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
				          		<button type="submit" class="btn btn-primary">つぶやく</button>
                  			</div>
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
<script>
	  (function() {
	    'use strict';
	    window.addEventListener('load', function() {
	      var forms = document.getElementsByClassName('needs-validation');
	      var validation = Array.prototype.filter.call(forms, function(form) {
	        form.addEventListener('submit', function(event) {
	          if (form.checkValidity() === false) {
	            event.preventDefault();
	            event.stopPropagation();
	          }
	          form.classList.add('was-validated');
	        }, false);
	      });
	    }, false);
	  })();
</script>