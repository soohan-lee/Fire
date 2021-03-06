<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />

	<style>
	
 
      div.h3  {
            background-color: #D2691E;
            display: inline-block;
        }
        
        
        
        table  {
            font-size: 10pt;
        }
   
     #button1{
	 border-top-left-radius: 8px;
 	border-top-right-radius: 8px;
 	border-bottom-left-radius: 8px;
 	border-bottom-right-radius: 8px;
 	margin-right-9px;
  	border : 1px solid #D2691E;
 	background-color:rgba(0,0,0,0);
 	color: #D2691E;
 	padding: 10px 25px;
 	}
 	
    </style>
    <script type="text/javascript">
    $(function() {
    	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    	$("#button1").on("click" , function() {
    		var businessId = $(this).next().val();
    		 window.location.href = "/business/getBusiness?businessId="+businessId;
    
    	});
    	
    });	

    </script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<form>

<div class="container getOrder" >
<br/>

	<div >
	  <h3 align="center">${pay.user.userName}님 예약이 정상적으로 완료되었습니다.</h3>
	</div>
	
			<div class="row">
                    <div class="h3">예약 내역</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">업체명</th>
					      <th scope="col">업체 전화번호</th>
					      <th scope="col">예약 날짜</th>
					      <th scope="col">예약 시작 시간</th>
					      <th scope="col">예약 끝 시간</th>
					      <th scope="col">예약 인원</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${pay.business.businessName}</th>
					       <td>${pay.business.businessPhone}</td>
			     		   <td>${pay.reserveDate}</td>
					      <td>${pay.reserveStartTime}</td>
					      <td>${pay.reserveEndTime}</td>
 					      <td>${pay.reserveMemNum}명</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3">결제 완료 내역</div>
		</div>	
			<hr/>
	<div class="row">
	 	<div class="col-xs-4 col-md-2 "><strong>총 결제 금액</strong></div> 
		<div class="col-xs-8 col-md-4"><fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />원</div> 
 	 </div> 
 	  
 	  
				  
	<br/>			

	<div class="row">
	
	<div class="h3">예약자 내역</div>
	</div>	
			<hr/>
	<div class="row">
	  <div class="col-xs-4 col-md-2" ><strong>구매자</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.user.userName}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>구매자 연락처</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.user.phoneNumber}</div> 
 	 </div> 			
		
	
			</div>
		<hr/>
	
	   <div class="row"> 
 		<div class="col-md-12 text-center"> 
 		   <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="button"  id ="button1">확인</button>
		     	<input type="hidden" name="businessId"value="${pay.business.businessId }" />
 			</div> 
			</div>
			
</div>
			
	</form>

</body>
</html>
