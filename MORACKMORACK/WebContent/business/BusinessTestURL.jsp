<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȭ�� �����׽�Ʈ</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>

</style>

</head>
<body>

	<!-- Button HTML (to Trigger Modal) -->
	<jsp:include page="/business/loginBusiness2.jsp"/>
	<br><br><br><br><br><br><br><br>



	<a href="/business/addBusinessMenu.jsp">��ü �޴� ���</a>
	<br>
	
	<a href="/business/listBusinessMenu">��ü �޴� ���</a>
	<br>

	
	
	
	
	
	<a href="/business/listReserveAbleTime">��ü ���� ���� �ð� ���</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	
	<a href="/business/addBusiness">���� ��û(��üȸ������)</a>
	<br>
	
	<a href="/business/loginBusiness">��ü �α���</a>
	<br>
	
	<a href="/business/updateBusiness">��ü ���� ����</a>
	<br>
	
	<a href="/business/listBusiness?businessId=bus01">��ü ���� ����</a>
	<br><br><br><br><br><br><br><br>
	
	
	
	
	<jsp:include page="/business/getReserveBusiness.jsp"/>
	<br><br><br><br><br><br><br><br>
	

</body>
</html>