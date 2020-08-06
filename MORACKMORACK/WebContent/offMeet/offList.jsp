<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
	<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


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
 	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
 }
 
  .swal-button : over
 {
 	background-color: #D2691E;
 }
 
</style>

<script type="text/javascript">

var message = '${message}';

$(function() {
 if(message != null){
	if(message == "1"){
		swal({
			  icon : 'info',
			  title : "이미 참여한 오프라인 모임입니다.",
			  text:" ",
			  closeOnClickOutside : false,
			  button: "확인"
		})
	  return;
	}
}
});

	$(function() {
		
	
		$(".thumbnail").on("click", function() {
			 var offNo = $(this).find($("input[name='offNo']")).val();
			 var meetId = $(this).find($("input[name='meetId']")).val();
			 window.location.href = "/offmeet/getInfoOff?offNo="+offNo+"&meetId="+meetId;
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
					<h1>오프라인 모임 리스트</h1>
				</header>
			</div>
		
	
		</div>


</br>
</br>
</br>
<div class="container">

<input type ="hidden" id="message" name="message" value="${message}"/>



<div style="text-align:center;">
<div class="row" style="display:inline-block">
	
  
  <c:forEach var="offMeet" items="${list}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	 <input type="hidden" name="meetId" value="${meet.meetId}"/>
    	<input type="hidden" name="offNo"value="${offMeet.offNo }" />
		<img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" style="width:450px; height:300px;"  onError="this.src='/resources/images/uploadFiles/Morack.png'" alt="noImage">
     	 <div class="caption">
        <h3></h3>
        <h3><String>${offMeet.offName}</String></h3>
        <p>참여인원  : ${offMeet.offMem}/${offMeet.offMax}</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>
  
  

