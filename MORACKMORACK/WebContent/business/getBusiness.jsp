<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header>
<jsp:include page="/toolbar.jsp" />
</header> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>제휴업체 상세 조회</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<script type="text/javascript" src="./fullcalendar-3.9.0/gcal.js"></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

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
	
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<!-- jQuery UI toolTip 사용 CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- jQuery UI toolTip 사용 JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>


.businessMenuCnt{
font-size: 6em;
position: relative;
bottom:50px;
}

#head {
		position: relative;
		background-image: url("/resources/images/uploadFiles/offmeet/offMeet.jpg");
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
		
		color: #fff;
		text-align: center;
		padding: 7.5em 0 2em 0;
		cursor: default;
	
		.inner {
			position: relative;
			z-index: 1;
			margin: 0;
			display: inline-block;
			VERTICAL-ALIGN: MIDDLE; 
		}


		 .p p{
			font-size: 1.25em;

		}

		h1 {
			color: #fff;
			font-size: 3em;
			line-height: 1em;

			a {
				color: inherit;
			}
		}

		hr {
			top: 1.5em;
			margin-bottom: 3em;
			border-bottom-color: rgba(192, 192, 192, 0.35);
			box-shadow: inset 0 1px 0 0 rgba(192, 192, 192, 0.35);

			&:before, &:after {
				background: rgba(192, 192, 192, 0.35);
			}
		}

	
	}

 #addReserve{
 border : 1px solid #D2691E;
 background-color:rgba(0,0,0,0);
 color: #D2691E;
 padding: 10px 25px;
 }

 
  .swal-footer {
 	text-align : center;
 }
 .swal-button
 {
 	background-color: #D2691E;
 }
 
 h3{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
 }
 
#bussinessLoc{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
}

#bussinessPhone{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
}

#bussinessTime{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
}

#menuFee{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
}


#menuCnt{
 font-family: 'Nanum Pen Script', cursive;
 font-size: 40px;
}


#plus{
 font-size: 30px;
}

#minus{
 font-size: 30px;
}
</style>


<script type="text/javascript">
	var selectDate = null;
	$(document).ready(function(){
	
		$('#calendar').fullCalendar({ 
		 
		header: { //헤더부분정의 
		left: 'title', //년도, 월
		center : '',
		right: 'prev,next today',
		},
		dayClick: function(date, allDay, jsEvent, view) { //날짜클릭시 실행되는 함수
			 	
			var yy = date.format("YYYY");
			var mm = date.format("MM");
			var dd = date.format("DD");
			if(selectDate) {
				selectDate.css('background-color', 'white');
				$(this).css('background-color', 'skyblue');
			} else {
				$(this).css('background-color', 'skyblue');
			}	
			selectDate = $(this);
			onchangeDay(yy,mm,dd); //년, 월, 일을 담아 onchangeDay 함수 실행
			}
		});  
	});
 

	function onchangeDay(year,month,j){ //날짜클릭시 실행되는 함수
		
		var reserveDate = year+"-"+month+"-"+j; //"2019-11-04" 형식의  reserveDate
		var businessId = $("#businessId").val();
			
		$.ajax({
			url : "/business/json/showReserveAbleTimeList/"+businessId+"/"+reserveDate,
			type : 'GET', //GET방식으로
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			
			success : function(JSONData, status) {
				
				var listSelectedTime = [];
				
				var displayValue ="<div>";
				selectable: true								
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
								"<input type='button' class = 'addReserve' id='addReserve' name='addReserve' value=' 예 약 하 기 ' style='width:540px; margin-top:20px;'>" +
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
						swal({
							  icon : 'warning',
							  title : "시간이 선택 되지 않았습니다.",
							  text:" ",
							  closeOnClickOutside : false,
							  button: "확인"
						})
						return;
					} else {
						
						$("#listSelectedTime").val(listSelectedTime)
						$("#reserveDate").val(reserveDate)
						
						
						var menuNo = $("#menuNo").val()
						var businessMenuCnt = $("input[name='businessMenuCnt']").val()
	
									
					if(businessMenuCnt == 0){
						swal({
							  icon : 'warning',
							  title : "예약 인원은 반드시 입력하여야 합니다.",
							  text:" ",
							  closeOnClickOutside : false,
							  button: "확인"
						})
						return;
					}
 						$("form").attr("method", "POST").attr("action", "/offmeet/addBusinessPay?listSelectedTime="+listSelectedTime+"&reserveDate="+reserveDate+"&businessId="+businessId+"&menuNo="+menuNo+"&businessMenuCnt="+businessMenuCnt).submit();
					}
					
				})
				
			}
		
		});
	}

	
	function fncBusinessMenuCnt(indexVal, currentVal, countVal) {

		console.log("[fncTicketCount START]")

		var inputVal = $(".businessMenuCnt").eq(indexVal).val();
		var textVal = $("h3[name='priceCount']").eq(indexVal).text();
		console.log("[1] inputVal : " + inputVal)
		console.log("[2] textVal : " + textVal)
		
		
		if (countVal == 'plus') {
			console.log("[Plus]")
			inputVal = $(".businessMenuCnt").eq(indexVal).val(currentVal * 1 + 1);
			textVal = $("h3[name='priceCount']").eq(indexVal).text(currentVal * 1 + 1);
		}

		if (countVal == 'minus' && currentVal >= 1) {
			console.log("[Minus]")
			inputVal = $(".businessMenuCnt").eq(indexVal).val(currentVal * 1 - 1);
			textVal = $("h3[name='priceCount']").eq(indexVal).text(currentVal * 1 - 1);
		} else if (countVal == 'minus' && currentVal <= 0) {
			console.log("[티켓 수량이 0 보다 작음]")
		}
		
	}
	
	
	function makeToast(title) {
		$('#toastMessage').text(title).fadeIn(400).delay(1500).fadeOut(400);
	}
	
	
	$(function() {

		$("#minus").bind("click", function(event) {

			event.preventDefault();

			var indexVal = $("#minus").index(this);
	
			var countVal = 'minus';
			var currentVal = $(".businessMenuCnt").eq(indexVal).val();

			
			if (currentVal <= 0) {
				makeToast("인원수를 확인 하시기 바랍니다.")
			}

			fncBusinessMenuCnt(indexVal, currentVal, countVal);

		});

		$("#plus").bind("click", function(event) {

			event.preventDefault();
	
			var indexVal = $("#plus").index(this);
			var countVal = 'plus';
			var currentVal = $(".businessMenuCnt").eq(indexVal).val();


			fncBusinessMenuCnt(indexVal, currentVal, countVal);
		});

	});


</script>


</head>

<body>

<div id="head">
		
		
			<div class="inner">
				<header>
				<h1>제휴 업체 예약</h1>
				</header>
			</div>

		</div>
	</br>
	</br>
	<div class="container">
		
    
	    <div>
	    	<span style="width:50%; float:left;">
	    		<h3 id="businessName"><string>${business.businessName}</string></h3></br>
	    		<input type="hidden" id="businessId" name="businessId" value="${business.businessId }"/>
				<img src="/resources/images/uploadFiles/business/${business.businessImg}" style : width="400" height="400" >
				<div> </br>
				<h2 id ="bussinessLoc"><span class="fas fa-map-marker-alt"></span>&nbsp;&nbsp; ${business.businessLoc}</h2>
				</div>
				<div>
				<h2 id ="bussinessPhone"><span class="fas fa-phone"></span>&nbsp;&nbsp;  ${business.businessPhone}</h2>
				</div>
				<div>
				<h2  id ="bussinessTime"><span class="far fa-clock"></span>&nbsp;&nbsp; ${business.businessStartTime}  ~  ${business.businessEndTime }</h2>
				</div>
			
				<div>	
				<c:forEach var="menu" items="${menu}">
					<form name='form' class='form-horizontal'>
								<input type="hidden" class="menuNo" id="menuNo" value="${menu.menuNo}">
						  		<h2 id ="menuFee"><span class="far fa-money-bill-alt"></span>&nbsp;&nbsp;<fmt:formatNumber value="${menu.businessMenuFee}" pattern="###,###" />원</h2>
						  		<br><br>
					</form>
			  	</c:forEach>
			  	</div>
			</span>
			
							
			
		  
			<span style="float:right; width:45%;">
	    		<span id="calendar" style="width:100%; height:500px;"></span>
	    		
	    		<div>    	
	    		<div id ="menuCnt" style= "float: center; width:30%;"><strong>예약 인원수</strong></div>
	    		<input type="hidden" class="businessMenuCnt" name="businessMenuCnt" value=0>		
	    		<h3 class="businessMenuCnt" name="priceCount" style= "float: left; width:20%;">0</h3>
				<div>
				<p class="fas fa-plus" id ="plus"></p>
				</div><div>
				<p class="fas fa-minus" id ="minus"></p>		
				</div>
						
  				</div>
  		
	    		<h1 style="text-align:left;"> [ 예약시간 선택 ] </h1>
	    		
	    		<span id="reserveAbleTimeList">
					
	    		</span>
	    	
	    	</span>
	    	
	    </div>

	</div>
	
	
	

</body>

</html>