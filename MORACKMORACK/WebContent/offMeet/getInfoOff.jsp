<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<jsp:include page="/common/listCdn.jsp" />
	

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
 	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
 }
 
  .swal-button : over
 {
 	background-color: #D2691E;
 }
 
 
     </style>
     
<script type="text/javascript">


$(function() {
	


	$( "#button1" ).on("click" , function() {
		
		
		var offNo = $(this).next().val();
		var meetId = $(this).next().val();
		var memNo = $(this).next().val();
		var offMem ='${offMeet.offMem}';
		var offMax ='${offMeet.offMax}';
		
		
		if(parseInt(offMem) >= parseInt(offMax)){
			swal({
			  icon : 'warning',
			  title : "오프라인 모임 인원이 마감되었습니다.",
			  text:" ",
			  closeOnClickOutside : false,
			  button: "확인"
		})
			return;
		}else{
		window.location.href =  "/offmeet/reqOff?offNo=${offMeet.offNo}&meetId=${meet.meetId}&memNo=${meetMem.memNo}";
		}
		
		}); 

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

<input type ="hidden" id="meetId" name="meetId" value="${offMeet.meet.meetId}"/>

<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
			<a href="#" class="thumbnail" id="offMeetImgThum" style=" width:430px; height:310px;">
			<img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" class="image" style="width:430px; height:300px;"  onError="this.src='/resources/images/uploadFiles/Morack.png'" alt="noImage">
			<div id="offMeetImgPrev"></div>
			</a>
		
		  </div>
 
  </div> 

<div class="form-group">
  

<div class="col-xs-6 col-md-2">
<p style = " font-size:1.5em;"><strong>오프라인 모임명</strong></p>
${offMeet.offName}
</div>


<div class="col-xs-6 col-md-4">
<p style = " font-size:1.5em;"><strong>오프라인 모임장소</strong></p>
${offMeet.offLoc}
</div>

 

<div class="col-xs-6 col-md-2">
<p style = " font-size:1.5em; margin-top: 2em;"><strong>모임 날짜</strong></p>
${offMeet.offDate}
</div>


	
<div class="col-xs-6 col-md-4">
<p style = " font-size:1.5em; margin-top: 2em;"><strong>모임 시간</strong></p>
${offMeet.offTime}
</div>

 

<div class="col-xs-6 col-md-2">
<p style = " font-size:1.5em; margin-top: 2em;"><strong>인원 수</strong></p>
${offMeet.offMem}/${offMeet.offMax}
</div>

 

<div class="col-xs-6 col-md-4">
<p style = " font-size:1.5em; margin-top: 2em;"><strong>참여비</strong></p>
<fmt:formatNumber value="${offMeet.amount}" pattern="###,###" />원
</div>


	
	
<div id ="btn_group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  id ="button1" >참여 신청</button>
			  <button type="button"  id ="button2" >취&nbsp;소</button>
		    </div>
		  </div>
		  
		  
	</div>
</div>

</br>

</body>
</html>