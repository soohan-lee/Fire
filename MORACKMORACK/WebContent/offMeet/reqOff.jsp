<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>�������� ���� ���� ��û</title>



<jsp:include page="/common/listCdn.jsp" />
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
			
 body > div.container{
           padding-top : 50px;
 }
 .swal-footer {
 	text-align : center;
 }
 .swal-button
 {
 	background-color: #D2691E;
 }
 
 .swal-button-active {
    background: #D2691E;
}


    div.h3  {
            background-color: #D2691E;
            display: inline-block;
        }
        
</style> 

<script type="text/javascript">

var amount ='${offMeet.amount}';

function fncreqOk() {
	
	var meetMemName = '${user.userName}';
	var offName = '${offMeet.offName}';
	var pay = $("select[name='payMethod']").val();
	var amount ='${offMeet.amount}';
	var offMem ='${offMeet.offMem}';
	var offMax ='${offMeet.offMax}';
	
	
	if (pay == '0') {
		pay = 'trans';
	} else if (pay =='1') {
		pay = 'card';
	} else if (pay =='2') {
		pay = 'vbank';
	}
	
		IMP.init('imp45686118'); 
	
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : pay,
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : offName,
		    amount : amount,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : meetMemName,
		}, function(rsp) {
		    if ( rsp.success ) {
		    	var sendData = JSON.stringify({
                	"impUid" : rsp.imp_uid,
                    "merchantUid" : rsp.merchant_uid,
		 			"amount" : rsp.paid_amount,
		 			"payMethod" : rsp.pay_method
		    	})
		 			jQuery.ajax({
		 				url:'/offmeet/json/addOffPay',
		 				type : 'POST',
		 				dataType : 'json',
		 				contentType : 'application/json',
		 				data :sendData	
		 		}).done(function(data,status) {
		    	
		    		 if ( status === 'success') {
		    			var msg = '������ �Ϸ�Ǿ����ϴ�.';
		    			msg += '\n����ID : ' + data.imp_uid;
		    			msg += '\n���� �ŷ�ID : ' + data.merchant_uid;
		    			msg += '\���� �ݾ� : ' + data.paid_amount;
		    			msg += '\n�ŷ���� : ' + data.pay_method;
		    			alert(msg);
		    		 }
		   
		    	});
		    } else {
		        var msg = '������ �����Ͽ����ϴ�.';
		        window.location.reload(true);
		        return;
		    }
 		    $("form").attr("method" , "POST").attr("action" , "/offmeet/addOffPay?offNo=${offMeet.offNo}&memNo=${meetMem.memNo}").submit();
		});
		
}

$(function() {

	if(parseInt(amount) == 0){
		swal({
			icon : 'info',
			title :"�������� ������ 0���Դϴ�. ���� ���� ���� �����մϴ�.",
			text:" ",
			closeOnClickOutside : false,
			button: "Ȯ��"
		}) .then(function(){
		$("form").attr("method" , "POST").attr("action" , "/offmeet/addOffPay?offNo=${offMeet.offNo}&memNo=${meetMem.memNo}").submit();
		});
	} else{
	$( "#button1" ).on("click" , function() {
		fncreqOk();
	});
	}	
});	

$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
			
$( function() {
    $("#dlvyDate").datepicker({
    	dateFormat: 'yy-mm-dd'
  });  
});		

$(function() {
$( "#button2" ).on("click" , function() {
	window.location.href =  "/offmeet/getOffList?meetId=${offMeet.meet.meetId}";
	});	
});	

</script>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<div class="container getOrder" >
<br/>
<form class="form-horizontal">
	<input type="hidden" name="offNo" value="${offMeet.offNo}" />
	<input type="hidden" name="meetId" value="${offMeet.meet.meetId}" />
	<input type="hidden" name="meetMem" value="${meetMem.memNo}" />
	
			<div class="row">
                    <div class="h3">�������� ���� ����</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">�������� ���� ��</th>
					      <th scope="col">�������� ���� ���</th>
					      <th scope="col">�������� ���� ��¥</th>
					      <th scope="col">�������� ���� �ð�</th>
					      <th scope="col">���� �ο� ��</th>
					      <th scope="col">�ִ� �ο� ��</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${offMeet.offName}</th>
			     		  <td>${offMeet.offLoc}</td>
					      <td>${offMeet.offDate}</td>
					      <td>${offMeet.offTime}</td>
					  	  <td>${offMeet.offMem}��</td>
 					     <td>${offMeet.offMax}��</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3" style="margin-top:80px;" >�������� ���� ������ ���� </div>
		</div>	
			<hr/>
	
	
	
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:10px;"><strong>���� �����</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${meet.bank}</div> 
 	 </div> 

	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ������¹�ȣ</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${meet.accNum}</div> 
 	 </div> 
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������</strong></div> 
			<input type="hidden" name="amount" value= "	${offMeet.amount}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;"><fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />��</div>
 	 </div> 
 	 
 	 
 	<div class="row">
 			<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ���</strong></div>
 			<div class="col-xs-8 col-md-4" style="margin-top:20px;">
 				<select name="payMethod" class="form-control"> 
 					<option value="0" selected="selected">������ü</option> 
					<option value="1">�ſ�ī��</option> 
					<option value="2">�������</option> 
 				</select> 
 			</div> 
 		</div> 
 		
				  
	<br/>			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >������ ����</div>
	</div>	
			<hr/>
			
	<div class="row">
	  <div class="col-xs-4 col-md-2"style="margin-top:10px;" ><strong>������ ID</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.userId}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������ �̸�</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.userName}</div> 
 	</div> 
 	
 		<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������ �г���</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.nickName}</div> 
 	 </div> 			
 	 
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������ ����</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.gender} </div> 
 	 </div> 			
		
	
	
			</div>
		<hr/>
	
			
			<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  id ="button1" >������ ����</button>
			  <button type="button"  id ="button2" >��&nbsp;��</button>
		    </div>
		  </div>
		</form>		

</body>
</html>
