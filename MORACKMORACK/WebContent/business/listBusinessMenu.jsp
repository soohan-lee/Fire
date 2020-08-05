<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü �޴� ��� ��ȸ</title>


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
	
	$(function() {
	
		// �޴� ��� ȭ������ �̵�
		$("#addBusinessMenu").on("click", function() {
			self.location = "/business/addBusinessMenu.jsp"
		});
		
		// �ش� �޴� ����
		$(".businessMenuImg").on("click", function() {
			var menuNo = $( $(this).parents("div").children()[0] ).val();
			self.location = "/business/getBusinessMenu?menuNo="+menuNo;
		});
		
		// �޴� ���� �� �ٽ� �޴� ����Ʈ ���
		$(".delBusinessMenu").on("click", function() {
			var menuNo = $( $(this).parents("div").children()[0] ).val();
			self.location = "/business/delBusinessMenu?menuNo="+menuNo;
		});
		
		$("#ok").on("click", function() {
			history.go(-1);
		});
	   	   
	});


</script>

</head>

<body>

	<header>
		<jsp:include page="/toolbar.jsp" />
	</header>

	<div class="container">
	
		<div class="page-header text-info">
			<img id="businessImg" style="float:left; height:100px; width:100px; margin:5px" src="/resources/images/uploadFiles/business/${business.businessImg}" alt="@@��ü ��ǥ �̹���@@">
			<h2 style="padding-top:10px;">${business.businessName}</h2>
			<h5>�޴� ���</h5>
	    </div>
	
	
		<div class="row">
			<div style="float:right">
				<button type="button" id="addBusinessMenu" name="addBusinessMenu" class="btn btn-primary">�߰�</button>
				<button type="button" id="ok" name="ok" class="btn btn-primary">Ȯ��</button>
			</div>
		</div>
	
	  
		<c:forEach var="menu" items="${menuList}">
			<form name='form' class='form-horizontal'>
				<div class='form-group'>
					<div class='page-header text-info'>
						<input type="hidden" class="menuNo" value="${menu.menuNo}">
						<input type="hidden" class="businessId" value="${menu.businessId}">
						
						<input type='button' class="delBusinessMenu" value='-' style='margin-top: 80px; float: left;' class="btn">
						<p style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<img class='businessMenuImg' style='float:left; height:200px; width:200px; margin:5px' src='/resources/images/uploadFiles/business/${menu.businessMenuImg}' alt='@@@@@ �޴� �̹��� @@@@@'>
				  		<h2> ${menu.businessMenu} </h2>
				  		<p> </p>
				  		<h3> ${menu.businessMenuFee} </h3>
				  		<br><br>
				  	</div>
				</div>
			</form>
	  	</c:forEach>
	  
	</div>

</body>
</html>