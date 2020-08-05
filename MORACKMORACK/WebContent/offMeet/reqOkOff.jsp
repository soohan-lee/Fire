<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

<jsp:include page="/common/listCdn.jsp" />

	

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">


$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		var meetId = $(this).next().val();
		window.location.href="/meet/getMeet/"+meetId
	
	});
	
	$("#list").click(function (){
		window.location.href = "/offmeet/listOffPay";
	})
	
});	



</script>
</head>

<body>
<form>
<input type="hidden" name="offNo" value="${offMeet.offNo}" />

<div class="container">
	<div class="page-header">
	     <h3 class=" text-info">�������θ��� ���� ��û �Ϸ�</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>���� ��û�� ��</strong></div>
		<div class="col-xs-8 col-md-4">${user.userName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�������</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.payMethod == '0' ? "������ü" : pay.payMethod == '1' ? "ī�����" : "�������Ա�" }</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>���Ӹ�</strong></div> 
 		<div class="col-xs-8 col-md-4">${pay.meet.meetName }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�Ա�����</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.meet.bank }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�Աݰ������</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.meet.accNum}</div> 
 	</div> 
 	
 	
  <hr/>
  
  
  
  
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>������</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.totalAmount}</div> 
 	</div> 
    
    

<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		         <a class="btn btn-primary btn" href="#" role="button">Ȯ &nbsp;��</a>
		      <input type="hidden" id="meetId" value="${pay.meet.meetId}"/> 
		      <button type="button" class="btn btn-primary btn" id="list" >������ ���</button>
 		</div> 
	</div>
</div>
</form>
</body>
</html>