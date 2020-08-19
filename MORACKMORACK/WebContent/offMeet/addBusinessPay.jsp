<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<style>
	
 	#btn_group button:hover
 	{ 
 	color:white; background-color: #D2691E;
 	}		
	
	 #btn_group button{
 	border : 1px solid #D2691E;
 	background-color:rgba(0,0,0,0);
 	color: #D2691E;
 	padding: 10px 25px;
 
 	}
 	
 	#button1{
	 border-top-left-radius: 8px;
 	border-top-right-radius: 8px;
 	border-bottom-left-radius: 8px;
 	border-bottom-right-radius: 8px;
 	margin-right-9px;
 	}
 
 	#button2{
 	border-top-left-radius: 8px;
 	border-top-right-radius: 8px;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
 	margin-right-9px;
	 }
 
       
         div.h3  {
            background-color: #D2691E;
            display: inline-block;
        }
        
        
        table  {
            font-size: 10pt;
        }
   
    </style>
<script type ="text/javascript">

function reserveBusiness() {
		

var buyerName = '${user.userName}';
var buyerNumber ='${user.phoneNumber}';
var businessName = '${business.businessName}';
var reserveDate = '${reserveDate}';
var reserveStartTime = '${reserveStartTime}';
var reserveEndTime ='${reserveEndTime}'; 
var amount = '${menu.businessMenuFee* businessMenuCnt}';
	IMP.init('imp45686118'); 

	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : businessName,
	    amount : amount,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : buyerName,
	    }, function(rsp) {
		    if ( rsp.success ) { 
		        var msg = '������ �Ϸ�Ǿ����ϴ�.';
		        msg += '����ID : ' + rsp.imp_uid;
		        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
		        msg += '���� �ݾ� : ' + rsp.paid_amount;
		        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
	   
	    } else {
	        var msg = '������ �����Ͽ����ϴ�.';
	        window.location.reload(true);
	        return;
	    }
		    $("form").attr("method" , "POST").attr("action" , "/offmeet/payOkBusiness?businessId=${business.businessId}").submit();
		
		});
}


$(function() {
	$( "#button1" ).on("click" , function() {
		reserveBusiness();
	});
	
	$( "#button2" ).on("click" , function() {
		 var businessId = '${business.businessId }'
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

<div class="container" >
<br/>


			<div class="row">
                    <div class="h3">��ü ����</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">��ü��</th>
					      <th scope="col">��ü ��ġ</th>
					      <th scope="col">��ü ��ȣ</th>
					      <th scope="col">��ü � �ð�</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${business.businessName}</th>
			     		  <td>${business.businessLoc}</td>
					      <td>${business.businessPhone}</td>
					      <td>${business.businessStartTime}~${business.businessEndTime}</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3" style="margin-top:80px;" >���� ����</div>
		</div>	
			<hr/>
			
			
	<div class="row">

	 	<div class="col-xs-4 col-md-2 "><strong>���� ��¥</strong></div> 
		<div class="col-xs-8 col-md-4">${reserveDate}</div> 
 	 </div> 
 
 
	 <div class="row"> 
	 <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ���� �ð�</strong></div> 
		<c:set var="i" value="${ i+1 }" />
		<c:forEach var="reserveStartTime" items= "${reserveStartTime}" >
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${reserveStartTime} </div> 
		</c:forEach>
	</div> 
	
	
	  <div class="row"> 
	 <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� �� �ð�</strong></div> 
	  	<c:set var="i" value="${ i+1 }" />
		<c:forEach var="reserveEndTime" items= "${reserveEndTime}" >
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${reserveEndTime}</div> 
	  </c:forEach> 
	</div> 
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� �ο�</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${businessMenuCnt}��</div> 
	</div>  

	
	 <div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>�� �ݾ�</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;"><fmt:formatNumber value="${menu.businessMenuFee* businessMenuCnt}" pattern="###,###" />��</div> 
	</div>  

	
	
	
				  
	<br/>			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >������ ����</div>
	</div>	
			<hr/>
	<div class="row">
	  <div class="col-xs-4 col-md-2" ><strong>������</strong></div> 
		<div class="col-xs-8 col-md-4">${user.userName}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������ ����ó</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.phoneNumber}</div> 
 	 </div> 			
		
	
			</div>
		<hr/>
	
			<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="button" id="button1" > �� &nbsp;��</button>
		    <input type="hidden" id="businessId" value="${business.businessId}"/>
		    <input type="hidden" name="reserveDate" value= "${reserveDate}"/>
		     <input type="hidden" name="reserveStartTime" value= "${reserveStartTime}"/>
		    <input type="hidden" name="reserveEndTime" value= "${reserveEndTime}"/>
			<input type="hidden" name="amount" value="${menu.businessMenuFee* businessMenuCnt}" />
 			<input type="hidden" name="businessMenuCnt" value= "${businessMenuCnt}"/>	   
 			 <button type="button"  id ="button2" >��&nbsp;��</button>

		    </div>
		  </div>
			
</div>
			
	</form>

</body>
</html>
