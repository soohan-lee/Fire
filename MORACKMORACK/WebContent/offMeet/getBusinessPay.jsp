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
    	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
    	$("#button1").on("click" , function() {
    		var userId = $(this).next().val();
    		window.location.href="/offmeet/listBusinessPay?userId=${user.userId}"
    
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

	
			<div class="row">
                    <div class="h3">���� ����</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">��ü��</th>
					      <th scope="col">���� ��¥</th>
					      <th scope="col">���� ���� �ð�</th>
					      <th scope="col">���� �� �ð�</th>
					      <th scope="col">���� �ο�</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${pay.businessName}</th>
			     		  <td>${pay.reserveDate}</td>
					      <td>${pay.reserveStartTime}</td>
					      <td>${pay.reserveEndTime}</td>
 					      <td>${pay.reserveMemNum}��</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3" style="margin-top:80px;" >���� �Ϸ� ����</div>
		</div>	
			<hr/>
	<div class="row">
	 	<div class="col-xs-4 col-md-2 "><strong>�� ���� �ݾ�</strong></div> 
		<div class="col-xs-8 col-md-4"><fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />��</div> 
 	 </div> 
 	  

	
	 <div class="row"> 
	  	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������¥</strong></div> 
 		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.payDate}</div> 
	</div> 
	
				  
	<br/>			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >������ ����</div>
	</div>	
			<hr/>
	<div class="row">
	  <div class="col-xs-4 col-md-2" ><strong>������</strong></div> 
		<div class="col-xs-8 col-md-4">${pay.user.userName}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������ ����ó</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.user.phoneNumber}</div> 
 	 </div> 			
		
	
			</div>
		<hr/>
	
	   <div class="row"> 
 		<div class="col-md-12 text-center"> 
 		   <div class="col-sm-offset-4  col-sm-4 text-center">
		   <button type="button"  id ="button1" >Ȯ��</button>
		     <input type="hidden" id="userId" value="${pay.user.userId}"/>
 		</div> 
	</div>
			
</div>
			
	</form>

</body>
</html>
