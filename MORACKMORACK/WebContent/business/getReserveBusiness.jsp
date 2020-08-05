<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">

</script>

</head>
<body>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPoll-1">Launch modal</button> -->
<i class="glyphicon glyphicon-ok" data-toggle="modal" data-target="#modalPoll-1"></i>
	<!-- Modal: modalPoll -->
	<div class="modal fade right" id="modalPoll-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	  aria-hidden="true" data-backdrop="false">
	  <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
	    <div class="modal-content">
	      <!--Header-->
	      <div class="modal-header">
	        <p class="heading lead">���� �� ��ȸ
	        </p>
	
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true" class="white-text">��</span>
	        </button>
	      </div>
	
	      <!--Body-->
	      <div class="modal-body">
	        <div class="text-center">
	          <i class="far fa-file-alt fa-4x mb-3 animated rotateIn"></i>
	          <p>
	            <strong>�����ȣ : ${pay.payNo }</strong>
	          </p>
	            <strong>���������� Ȯ���ϼ��� :-D</strong>
	        </div>
	
	        <hr>
	
	<div class="modal-body">
	
	        <table class="table table-hover">
	          <thead>
	            <tr>
	              <th>Check Option</th>
	              <th>Value</th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td>���� ��ȣ</td>
	              <td>${pay.payNo }</td>
	            </tr>
	            <tr>
	              <td>���Ӹ�</td>
	              <td>${pay.meet.meetName }</td>
	            </tr>
	            <tr>
	              <td>�޴���</td>
	              <td>${menu.businessMenu }</td>
	            </tr>
	            <tr>
	              <td>������/������ ��</td>
	              <td>${pay.user.userName }</td>
	            </tr>
	            <tr>
	              <td>���� �ο�</td>
	              <td>${pay.reserveMemNum }</td>
	            </tr>
	            <tr>
	              <td>���� ����</td>
	              <td>${pay.reserveDate }</td>
	            </tr>
	            <tr>
	              <td>���� �ݾ�</td>
	              <td>${pay.totalAmount }</td>
	            </tr>
	            <tr>
	              <td>���� ����</td>
	              <td>${pay.payDate }</td>
	            </tr>
	          </tbody>
	        </table>
	
	      </div>
	
	
	      </div>
	
	      <!--Footer-->
	      <div class="modal-footer justify-content-center">
	        <a type="button" class="btn btn-outline-primary waves-effect">OK
	          <i class="fa fa-paper-plane ml-1"></i>
	        </a>
	        <a type="button" class="btn btn-outline-primary waves-effect" data-dismiss="modal">Cancel</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal: modalPoll -->

</body>
</html>