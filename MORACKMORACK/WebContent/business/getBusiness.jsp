<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���޾�ü �� ��ȸ</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script type="text/javascript" src="./fullcalendar-3.9.0/gcal.js"></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.js"></script> -->
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

	$(document).ready(function(){
	
		$('#calendar').fullCalendar({ 
		 
		header: { //����κ����� 
		left: 'title', //�⵵, ��
		center : '',
		right: 'prev,next today' //����, ������, ���� ��ư
		},
		dayClick: function(date, allDay, jsEvent, view) { //��¥Ŭ���� ����Ǵ� �Լ�
			 	
			var yy = date.format("YYYY");
			var mm = date.format("MM");
			var dd = date.format("DD");
			onchangeDay(yy,mm,dd); //��, ��, ���� ��� onchangeDay �Լ� ����
			}
		});  
	});
 

	function onchangeDay(year,month,j){ //��¥Ŭ���� ����Ǵ� �Լ�
		
		var reserveDate = year+"-"+month+"-"+j; //"2019-11-04" ������  reserveDate
		var businessId = $("#businessId").val();

		$.ajax({
			url : "/business/json/showReserveAbleTimeList/"+businessId+"/"+reserveDate,
			type : 'GET', //GET�������
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			
			success : function(JSONData, status) {
				
				var listSelectedTime = [];
				
				var displayValue ="<div>";
									
									
				for(var i=0 ; i<JSONData.length ; i++) {
					
					displayValue += "<span>" +
									"<form name='form' action='/offmeet/getBusinessPay' method='POST'>" +
									"<span class='selectTime' style='width:80px; height:80px; margin:20px; float:left; border:1px solid black;'>" +
									"<input type='checkbox' style='float:left; margin:10px; margin-top:30px;' id='selected_"+JSONData[i].reserveAbleNo+"' name=selected_'"+JSONData[i].reserveAbleNo+"' value='"+JSONData[i].reserveAbleNo+"'/>" +
									"<input type='hidden' value='"+JSONData[i].reserveAbleNo+"'/>" +
									"<p style='margin-top:8px;'>"+JSONData[i].reserveAbleStartTime+"<br> &nbsp;&nbsp;&nbsp; ~ <br>"+JSONData[i].reserveAbleEndTime+"</p>" +
									"</span>" +
									"</form>" +
									"</span>";
					
				}
				
				displayValue += "</div>" +
								"<div>" +
								"<input type='button' id='addReserve' name='addReserve' value=' �� �� �� �� ' style='width:500px; margin-top:20px;' class='btn btn-primary'>" +
								"</div>";

								
				$("#reserveAbleTimeList").html(displayValue);
				
				
				$(".selectTime").on("click", function() {
					var selectedTimeNo = $( $(this).children()[0] ).val();
					
					for(var i=0 ; i<listSelectedTime.length ; i++) {
						if(listSelectedTime[i]==selectedTimeNo){
							listSelectedTime.splice(i, 1);
						}
					}
					
					listSelectedTime.push(selectedTimeNo);
					console.log(listSelectedTime);
					
				});
				
				$("#addReserve").on("click", function() {
				
					if(listSelectedTime.length==0) {
						alert("�ð��� ���õ��� �ʾҽ��ϴ�.");
					} else {
						alert("���õ� ����ð� ��ȣ : " + listSelectedTime);
						
						$("#listSelectedTime").val(listSelectedTime)
						$("#reserveDate").val(reserveDate)
						var businessMenuCnt = $("#businessMenuCnt").val()
						var menuNo = $("#menuNo").val()
						alert(menuNo)
 						$("form").attr("method", "POST").attr("action", "/offmeet/addBusinessPay?listSelectedTime="+listSelectedTime+"&reserveDate="+reserveDate+"&businessId="+businessId+"&menuNo="+menuNo+"&businessMenuCnt="+businessMenuCnt).submit();
					}
					
				})
				
			}
		
		});
	}


</script>

</head>
<body>


	
	<div class="container">
	
		<div class="page-header">
			<h2 style="padding-top:10px;">����</h2>
	    </div>	
    
	    <div>
	    	<span style="width:50%; float:left;">
	    		<input type="hidden" id="businessId" name="businessId" value="${business.businessId }"/>
				<img src="/resources/images/uploadFiles/business/${business.businessImg}">
				<p id="businessName" style="font-size:30px;">${business.businessName}</p>
				<h3>��ü ��ġ</h3>
				<h5 style="padding-bottom:10px;">${business.businessLoc }</h5>
				<h3>��ü ��ȣ</h3>
				<h5 style="padding-bottom:10px;">${business.businessPhone }</h5>
				<h3>��ü � �ð�</h3>
				<h5 style="padding-bottom:10px;">${business.businessStartTime } &nbsp; ~ &nbsp; ${business.businessEndTime }</h5>
				
				
		
		
		
				
				
				
				<h3>�޴�</h3>
				<c:forEach var="menu" items="${menu}">
					<form name='form' class='form-horizontal'>
						<span class='form-group' style="float:left; padding:15px;">
							<span class='page-header'>
								<input type="hidden" class="menuNo" id="menuNo" value="${menu.menuNo}">
								<p style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;</p>
								<img src="/resources/images/uploadFiles/business/${menu.businessMenuImg}" width="175" height="170">
						  		<div>
						  		�޴� ���� : ${menu.businessMenuFee} 
						  		</div>
						  		<br><br>
						  	</span>
						</span>
					</form>
			  	</c:forEach>
			  	
			</span>
			
			
		  
			<span style="float:right; width:45%;">
	    		<span id="calendar" style="width:100%; height:500px;"></span>
	    		
	    		
	    		<div class="col-xs-6 col-md-6">
	    		<p><strong>���� �ο���</strong></p>
				<input type="number" class="form-control" id="businessMenuCnt" name="businessMenuCnt"  style="height:40px; width:80px">
 				</div>
	  

	  
	    		<br><br>
	    		<br><br>
	    		
	    		<h1 style="text-align:center;"> [ ����ð� ���� ] </h1>
	    		
	    		<span id="reserveAbleTimeList">
					
	    		</span>
	    	</span>
	    	
	    </div>

	</div>
	
	
	

</body>

</html>