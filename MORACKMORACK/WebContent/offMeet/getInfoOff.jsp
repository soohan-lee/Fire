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



<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
			<a href="#" class="thumbnail" id="offMeetImgThum" style=" width:430px; height:310px;">
			<img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:430px; height:300px;"  onError="this.src='/resources/images/uploadFiles/Morack.png'" alt="noImage">
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


	
	<br/>
 <br/>
	
<div class="row"> 
 		<div class="col-md-12 text-center"> 
 		 	  <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >참여 신청</button> 
 		</div> 
	</div>
</div>

</br>

</body>
</html>