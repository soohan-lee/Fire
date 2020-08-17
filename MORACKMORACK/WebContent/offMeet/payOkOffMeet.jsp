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
    	
    	$("#button2" ).click(function (){
    		window.location.href = "/offmeet/listOffPay";
    	})
    	
    });	



    </script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>


<div class="container getOrder" >
<br/>

	<div >
	  <h3 align="center">${user.userName}�� �������� ���� ������ ���������� �Ϸ�Ǿ����ϴ�.</h3>
	</div>
	
				<div class="row">
                    <div class="h3">�������� ���� ����</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">�������� ���Ӹ�</th>
					      <th scope="col">�������� ���� ���</th>
					      <th scope="col">�������� ���� ��¥</th>
					      <th scope="col">�������� ���� �ð�</th>
					      <th scope="col">�ִ� �ο� ��</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${offMeet.offName}</th>
					       <td>${offMeet.offLoc}</td>
			     		   <td>${offMeet.offDate}</td>
					      <td>${offMeet.offTime}</td>
 					      <td>${offMeet.offMax}��</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3">�������� ���� ������ ���� ����</div>
		</div>	
			<hr/>
			
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:10px;"><strong>���� �����</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.meet.bank}</div> 
 	 </div> 

	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>���� ������¹�ȣ</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.meet.accNum}</div> 
 	 </div> 
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>������</strong></div> 
		<input type="hidden" name="amount" value= "	${offMeet.amount}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;"> <fmt:formatNumber value="${pay.offMeet.amount}" pattern="###,###" />��</div> 
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
	
	
	</br>
	</br>
	</br>
	
	
	



		<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  id ="button1" >Ȯ &nbsp;��</button>
		       <input type="hidden" id="meetId" value="${pay.meet.meetId}"/> 
			  <button type="button"  id ="button2" >������ ������� �̵�</button>
		    </div>
		    </br>
	</br>
	</br>
	</br>

		  </div>


</body>
</html>