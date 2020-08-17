<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">

<jsp:include page="/common/listCdn.jsp" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	
	<style>	

    	.addOkOff{
         font-family: 'Nanum Pen Script', cursive;
         font-size : 40px;
    	}
        
        div {
         font-family: 'Nanum Pen Script', cursive;
         font-size : 20px;
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
		var meetId = $(this).next().val();
		window.location.href="/meet/getMeet/"+meetId

	});
});	

</script>
</head>

<body>


<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container">
	

	 
	 
	<div class="page-header">
	     <h3 class="addOkOff">오프라인모임 생성 완료</h3>
	     
	</div>
	

	
    <div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>오프라인모임명</strong></div>
		<div class="col-xs-8 col-md-4">${offMeet.offName}</div>
	</div>
	
	
 <hr/>
 	
 	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>모임장소</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offLoc}</div> 
	</div> 
	
	
	
 <hr/>	
	
	<div class="row"> 
 		<div class="col-xs-4 col-md-2 "><strong>모임날짜</strong></div> 
 		<div class="col-xs-8 col-md-4">${offMeet.offDate }</div> 
 	</div> 
 
 <hr/>
	
	<div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>모임시간</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offTime }</div> 
 	</div> 


  <hr/>

    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>참여비</strong></div> 
		<div class="col-xs-8 col-md-4"><fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />원</div> 
 	</div> 
 	
    
  <hr/>
    
    <div class="row"> 
	  	<div class="col-xs-4 col-md-2 "><strong>최대인원수</strong></div> 
		<div class="col-xs-8 col-md-4">${offMeet.offMax}명</div> 
 	</div> 


<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
	 		<button type="button"  id ="button1" >확인</button>
		      <input type="hidden" id="meetId" value="${offMeet.meet.meetId}"/>
 		</div> 
	</div>
</div>

</body>
</html>