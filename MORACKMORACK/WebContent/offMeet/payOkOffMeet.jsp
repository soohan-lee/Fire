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
    	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
	  <h3 align="center">${user.userName}님 오프라인 모임 참여가 정상적으로 완료되었습니다.</h3>
	</div>
	
				<div class="row">
                    <div class="h3">오프라인 모임 정보</div>
            </div>
				<br/>
				<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">오프라인 모임명</th>
					      <th scope="col">오프라인 모임 장소</th>
					      <th scope="col">오프라인 모임 날짜</th>
					      <th scope="col">오프라인 모임 시간</th>
					      <th scope="col">최대 인원 수</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">${offMeet.offName}</th>
					       <td>${offMeet.offLoc}</td>
			     		   <td>${offMeet.offDate}</td>
					      <td>${offMeet.offTime}</td>
 					      <td>${offMeet.offMax}명</td>
					    </tr>
					  </tbody>
				</table>
		
		<br/>
		
		<div class="row">
			<div class="h3">오프라인 모임 참여비 결제 내역</div>
		</div>	
			<hr/>
			
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:10px;"><strong>모임 은행명</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.meet.bank}</div> 
 	 </div> 

	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>모임 가상계좌번호</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${pay.meet.accNum}</div> 
 	 </div> 
			
	<div class="row">
	 	<div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여비</strong></div> 
		<input type="hidden" name="amount" value= "	${offMeet.amount}"/>
		<div class="col-xs-8 col-md-4" style="margin-top:20px;"> <fmt:formatNumber value="${pay.offMeet.amount}" pattern="###,###" />원</div> 
 	 </div> 
 	 
 	 
 	<br/>			

	<div class="row">
	
	<div class="h3" style="margin-top:80px;" >참여자 정보</div>
	</div>	
			<hr/>
			
	<div class="row">
	  <div class="col-xs-4 col-md-2"style="margin-top:10px;" ><strong>참여자 ID</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.userId}</div> 
 	</div> 
 	
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 이름</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.userName}</div> 
 	</div> 
 	
 		<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 닉네임</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.nickName}</div> 
 	 </div> 			
 	 
	<div class="row">
	  <div class="col-xs-4 col-md-2" style="margin-top:20px;"><strong>참여자 성별</strong></div> 
		<div class="col-xs-8 col-md-4" style="margin-top:20px;">${user.gender} </div> 
 	 </div> 			
		
	
	
			</div>
	
	
	</br>
	</br>
	</br>
	
	
	



		<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  id ="button1" >확 &nbsp;인</button>
		       <input type="hidden" id="meetId" value="${pay.meet.meetId}"/> 
			  <button type="button"  id ="button2" >참여비 목록으로 이동</button>
		    </div>
		    </br>
	</br>
	</br>
	</br>

		  </div>


</body>
</html>