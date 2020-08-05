<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

	$( "button.btn.btn-primary" ).on("click" , function() {
		var offNo = $(this).next().val();
		var meetId = $(this).next().val();
		var memNo = $(this).next().val();
		window.location.href =  "/offmeet/reqOff?offNo=${offMeet.offNo}&meetId=${meet.meetId}&memNo=${meetMem.memNo}";
		}); 
	});
	
</script>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<div class="container">
	
	 <input type="hidden" id="offNo" value="${offMeet.offNo}"/>
	 <input type="hidden" name="meetId" id="meeId" value="${meet.meetId}" />
	 <input type="hidden" name="memNo" value="${meetMem.memNo}" />
	<input type="hidden" name="memNo" value="${message}" />
	<div class="page-header">
	     <h3 class=" text-info">�������θ��� ����</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>�������θ��Ӹ�</strong></div>
		<div class="col-xs-8 col-md-4">${offMeet.offName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�������</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offLoc}</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>���ӳ�¥</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offDate }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>���ӽð�</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offTime }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>������</strong></div> 
		<div class="col-xs-8 col-md-4">	<fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />��</div> 
 	</div> 
 
 	
  <hr/>
  
  
  
  
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�����ο���</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offMem}</div> 
 	</div> 
    
    
  <hr/>
    
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>�ִ��ο���</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offMax}</div> 
 	</div> 


<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >���� ��û</button> 
 		</div> 
	</div>
</div>

</body>
</html>