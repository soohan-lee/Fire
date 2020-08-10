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
        
        
   	 div.h3  {
            background-color: #D2691E;
            display: inline-block;
        }
        
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
	
     </style>
     
<script type="text/javascript">


$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("#button1").on("click" , function() {
		var meetId = $(this).next().val();
		window.location.href="/meet/getMeet/"+meetId
		});	
	});
$(function() {
	$("#button2").on("click" , function() {
		history.go(-1);
		});

});	




</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<div class="container getOrder" >
		
 	 
 	 			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >������ ����</div>
	</div>	
			<hr/>
			
	<div class="row">
	  <div class="col-xs-4 col-md-2"style="margin-top:10px;" ><strong>������ ID</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:10px;">${user.userId}</div> 
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
		
		
			</br>
			</br>
			</br>
			
		<div class="row">
			<div class="h3">�������� ���� ������ ���� ����</div>
		</div>	
		
			<hr/>
			
			</br>
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:10px;"><strong>���� �����</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:10px;">${pay.bank }</div> 
 	 </div> 

	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ������¹�ȣ</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.accNum}</div> 
 	 </div> 
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������</strong></div> 
		<input type="hidden" name="amount" value= "	${pay.totalAmount}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;"> <fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />��</div> 
 	 </div>
	
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ����</strong></div> 
		<input type="hidden" name="amount" value= "	${pay.payDate}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.payDate}</div> 
 	 </div> 
	
	
	
			</div>
	
	
	</br>
	</br>
	</br>
	
	
		

<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  id ="button1" >���� ��������</button>
		      <input type="hidden" id="meetId" value="${pay.meet.meetId}"/>
			  <button type="button"  id ="button2" >������ ���</button>
		    </div>
		  </div>
		  
</form>

</br>
</br>
</br>
</body>
</html>