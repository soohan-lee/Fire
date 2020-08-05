<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
	body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 320px;
	}
	.modal-login .modal-content {
		border-radius: 1px;
		border: none;
	}
	.modal-login .modal-header {
		position: relative;
		justify-content: center;
		background: #f2f2f2;
	}
	.modal-login .modal-body {
		padding: 30px;
	}
	.modal-login .modal-footer {
		background: #f2f2f2;
	}
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
	.modal-login label {
		font-weight: normal;
		font-size: 13px;
	}
	.modal-login .form-control, .modal-login .btn {
		min-height: 38px;
		border-radius: 2px; 
	}
	.modal-login .hint-text {
		text-align: center;
	}
	.modal-login .close {
		position: absolute;
		top: 15px;
		right: 15px;
	}
	.modal-login .checkbox-inline {
		margin-top: 12px;
	}
	.modal-login input[type="checkbox"] {
		position: relative;
		top: 1px;
	}
	.modal-login .btn {
		min-width: 100px;
		background: #3498db;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #248bd0;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
	
	#businessLogin {
		font-family: "Helvetica Neue", Helvetica,Arial,sans-serif;
		font-size: 14px;
		line-height: 1.4285;
		color: #333;
	}
</style>
</head>

<body>

	<!-- Button HTML (to Trigger Modal) -->
	<a href="#myModal" class="trigger-btn" data-toggle="modal" id="businessLogin">�α���</a>
	<br><br><br><br><br><br><br><br>

	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<form action="/business/login" method="post">
					<div class="modal-header">				
						<h4 class="modal-title">Login</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">				
						<div class="form-group">
							<label>Username</label>
							<input type="text" id="businessId" name="businessId" class="form-control" required="required">
						</div>
						<div class="form-group">
							<div class="clearfix">
								<label>Password</label>
								<a href="#" class="float-right text-muted"><small>Forgot?</small></a>
							</div>
							
							<input type="password" id="businessPass" name="businessPass" class="form-control" required="required">
						</div>
					</div>
					<div class="modal-footer justify-content-between">
						<label class="form-check-label"><input type="checkbox"> Remember me</label>
						<input type="submit" class="btn btn-primary" value="Login">
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>