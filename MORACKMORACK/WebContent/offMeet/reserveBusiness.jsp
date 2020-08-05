<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ü ����</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<style>


 
 div.h4  {
            font-family: 'NIXGONM-Vb';
            font-weight: bold;
            display: inline-block;
            background-color: #3e7eff;
       }
       

.button {
  background-color: #3e7eff; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}


</style>


<script type ="text/javascript">

$( function () {
	$("#reserveBusiness").on("click",function(){
		

var buyerName = '${pay.user.userName}';
var buyerNumber ='${pay.user.phoneNumber}';
var businessName = '${pay.business.businessName}';
var pay = $(":input:radio[name=payMethod]:checked").val();
var amount ='${pay.totalAmount}';


if (pay == '0') {
	pay = 'vbank';
} else {
	pay = 'card';
} 

	IMP.init('imp45686118'); 

	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : pay,
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
		    $("form").attr("method" , "POST").attr("action" , "/offmeet/payOkBusiness?businessId=${pay.business.businessId}").submit();
		
	    });	
	}); 
}); 

</script>
</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container" style="margin-top:150px">


<h3 class=" text">���޾�ü ����</h3>     
	
<form>
<div class="col-xs-6 col-md-6">
  <input type="hidden" name="meetId" value="${pay.meet.meetId}"/>		
  <input type="hidden" name="offNo" value="${pay.offMeet.offNo}"/>	
	<div class="form-group">
		<a href="#" class="thumbnail" id="businessImg" style="height:300px; width:500px">
		<div id="businessImg"></div>
			</a>
			
	<div>
		<p sstyle="margin-top:20px;">
		<label for="exampleInputFile" style="text-align:left; font-size:2em;">${pay.business.businessName}</label>   
		<span style="float:right;"></span> </br>
	</div>
	
	
	<div>
		<p style="margin-top:20px;">
		<label for="exampleInputFile" style="text-align:left ">��ü ��ġ</label>   
		<span style="float:right;"></span>  </br>
			${pay.business.businessName}
	</div>
	
	
	<div>
		<p style="margin-top:20px;">
		<label for="exampleInputFile" style="text-align:left">��ü ��ȣ</label>   
		<span style="float:right;"></span>  </br>
  			${pay.business.businessPhone}
	</div>
	</div>
</div>	

<div class="col-xs-6 col-md-6">
<div class="h4">������ ����</div>


	<div class="row" style="margin-bottom: 15px" >
		<div class="col-md-3" >�����ڸ�</div>
		<div class="col-md-9">${pay.user.userName}</div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">����ó</div>
	  <div class="col-md-9">${pay.user.phoneNumber}</div>
	</div>			
	
</div>


<div class="col-xs-6 col-md-6">
<div class="h4" style="margin-top:30px">���� ����</div>
	<div class="row" style="margin-bottom: 15px" >
		<div class="col-md-3">���೯¥</div>
		<div class="col-md-9">${pay.reserveDate}
		<input type="hidden" name="reserveDate" value= "${pay.reserveDate}"/>
		</div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px"  >
	  <div class="col-md-3">���� ���� �ð�</div>
	  <div class="col-md-9">${pay.reserveStartTime}
	  	<input type="hidden" name="reserveStartTime" value= "${pay.reserveStartTime}"/>
	  </div>
	</div>		
	
	

	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">���� �� �ð�</div>
	  <div class="col-md-9">${pay.reserveEndTime}
	  <input type="hidden" name="reserveEndTime" value= "${pay.reserveEndTime}"/>
	  </div>
	</div>		
	
	
	<div class="row" style="margin-bottom: 15px" >
	  <div class="col-md-3">���� �ο�</div>
	  <div class="col-md-9">
	   <input type="number" style= "width:50px; height:30px;" class="form-control" id="reserveMemNum" name="reserveMemNum">
	</div>
	</div>		
	
	<div class="h4" style="margin-top:50px">���� ����</div>
    <div class="input-group input-group-sm">
			  <div class="input-group-prepend">
			      	<input type="radio"  checked="checked" id="pay" value="0" name="payMethod" style="margin-top:10px;margin-right:10px;">������ü &nbsp;&nbsp;
 					<input type="radio" name="payMethod" id="card"  value="1" style="margin-top:5px;margin-right:10px;">ī�� ����
			  </div>
			</div>

    <div class="row"> 
	  	 <div class="col-md-3" style="margin-top:80px; font-size:1.5em;">���� �ݾ�</div> 
	  	 <input type="hidden" name="totalAmount" value= "${pay.totalAmount}"/>
	     <div class="col-md-9" style="margin-top:80px; font-size:1.5em;">${pay.totalAmount}</div> 
 	</div> 
 	
 	
 	</div>	
 
 	</form>
	</div>
 	<div class="text-center" style="margin-top:30px; ">
	<input class="button" type="button" id="reserveBusiness" name="reserveBusiness" value="�����ϱ�">
	<input type="hidden" name="businessId" value="${pay.business.businessId}"/> 
	</div>
</body>
</html>