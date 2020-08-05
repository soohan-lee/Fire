<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
	

	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    

	<script type="text/javascript">
	
		$(function() {
			
			$("#addReserveAbleTime").on("click", function() {
				self.location = "/business/delReserveAbleTime";
			});
			
			$("#ok").on("click", function() {
				self.location = "/business/updateBusienss";
			})
		   	   
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
			<h5>���� ���� �ð� ���</h5>
	    </div>
	    
	    
	    <div class="row">
			<div style="float:right">
				<input type="button" id="addReserveAbleTime" name="addReserveAbleTime" class="btn btn-primary" value="���/����"/>
				<input type="button" id="ok" name="ok" class="btn btn-primary" value="Ȯ��"/> 
			</div>
		</div>	
		
		
		<table class="table table-hover table-striped">
      
			<thead>
				<tr>
					<th align="center" style="width:20%">���� ���� �ð�</th>
					<th align="center"> * </th>
				</tr>
			</thead>
       
			<tbody>
			 
				<c:forEach var="reserveAble" items="${reserveAbleTimeList}">
					<tr>
						<td align="left">
							<input type="hidden" id="reserveAbleNo" name="reserveAbleNo" value="${reserveAble.reserveAbleNo}">
						</td>
						<td align="center">
							${reserveAble.reserveAbleStartTime}  ~  ${reserveAble.reserveAbleEndTime}
							<input type="hidden" value="${reserveAble.businessId}">
						</td>
					</tr>
				</c:forEach>
			 
			</tbody>
      
     	 </table>
		
		
	  
 	</div>

	
</body>

</html>