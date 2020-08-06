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

	
	
#header{
z-index : 1;
}	
			
 	#head {
		position: relative;
		background-image: url("/resources/images/uploadFiles/offmeet/offMeet.jpg");
		background-size: cover;
		background-position: center center;
		background-attachment: fixed;
		color: #fff;
		text-align: center;
		padding: 7.5em 0 2em 0;
		cursor: default;
	


		.inner {
			position: relative;
			z-index: 1;
			margin: 0;
			display: inline-block;
			VERTICAL-ALIGN: MIDDLE; 
		}


		 . p {
			font-size: 1.25em;
		}

		h1 {
			color: #fff;
			font-size: 3em;
			line-height: 1em;

			a {
				color: inherit;
			}
		}

		hr {
			top: 1.5em;
			margin-bottom: 3em;
			border-bottom-color: rgba(192, 192, 192, 0.35);
			box-shadow: inset 0 1px 0 0 rgba(192, 192, 192, 0.35);

			&:before, &:after {
				background: rgba(192, 192, 192, 0.35);
			}
		}

	
	}

	
  .swal-footer {
 	text-align : center;
 }
 .swal-button
 {
 	background-color: #D2691E;
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
 
  #button3{
 border-top-left-radius: 5px;
 border-top-right-radius: 5px;
 border-bottom-left-radius: 5px;
 border-bottom-right-radius: 5px;
 margin-right-9px;
 border : 1px solid #D2691E;
 background-color:rgba(0,0,0,0);
 color: #D2691E;
 padding: 8px 15px;
 }
 
 
 #button3 : hover{
  color:white; background-color: #D2691E;
 }
 
 
 
 button[type=button]:first-child {
     margin-right: 20px;
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
 
 #search{
  border-top-left-radius: 5px;
 border-top-right-radius: 5px;
 border-bottom-left-radius: 5px;
 border-bottom-right-radius: 5px;
 margin-right-9px;
 border : 1px solid #D2691E;
 background-color:rgba(0,0,0,0);
 color: #D2691E;
 padding: 8px 15px;
 
 }
 
 	#main {
		margin-bottom: 0;
	}

		#main section:first-of-type {
			padding-top: 2em;
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



<div id="head">
		
		
			<div class="inner">
				<header>
				<h1>오프라인 모임 정보</h1>
				</header>
			</div>

		</div>


</br>
</br>
</br>
<div class="container">




<form class="form-horizontal" enctype="multipart/form-data">
<input type="hidden" id="offNo" value="${offMeet.offNo}"/>
	 <input type="hidden" name="meetId" id="meeId" value="${meet.meetId}" />
	 <input type="hidden" name="memNo" value="${meetMem.memNo}" />
	<input type="hidden" name="memNo" value="${message}" />



<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
			<a href="#" class="thumbnail" id="offMeetImgThum" style="height:360px; width:350px">
			<img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:350px; height:350px;"  onError="this.src='/resources/images/uploadFiles/Morack.png'" alt="noImage">
			<div id="offMeetImgPrev"></div>
			</a>	

  </div> 
  </div>


<div class="form-group">
<div class="col-xs-4 col-md-3 ">
<div style = "margin: 15px; font-size: 1.3em;"><p><strong>오프라인 모임명</strong></p></div>
<div style =" margin: 20px;">${offMeet.offName}</div>
</div>

<div class="col-xs-4 col-md-3 ">
 <div style = "margin: 15px; font-size: 1.3em;"><p><strong>모임장소</strong></p></div> 
 <div style = " margin: 20px;">${offMeet.offLoc}</div> 
</div>  
  
<div class="col-xs-4 col-md-3 ">
 <div style = "margin: 20px; font-size: 1.3em;";><p><strong>모임날짜</strong></p></div> 
 <div style = " margin: 20px;">${offMeet.offDate}</div> 
</div>  
  
	
<div class="col-xs-4 col-md-3 ">
 <div style = "margin: 20px; font-size: 1.3em;"><p><strong>모임시간</strong></p></div> 
 <div style = " margin: 20px;";>${offMeet.offTime}</div> 
</div>  
  
<div class="col-xs-4 col-md-3 ">
<div style = "margin: 20px; font-size: 1.3em;"><p><strong>모임 최대 인원</strong></p></div> 
 <div style = " margin: 20px;">${offMeet.offMax}명</div> 
 </div>
  
  
<div class="col-xs-8 col-md-3 ">
<div style = "margin: 20px; font-size: 1.3em;"><p><strong>참여비</strong></p></div> 
 <div style = " margin: 20px;"><fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />원</div>
 </div>
  	
	  
 	</div>

<br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >참여 신청</button> 
 		</div> 
	</div>
</div>

</body>
</html>