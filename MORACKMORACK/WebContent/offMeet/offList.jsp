<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
	<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style>




.pic {
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
     border-radius: 20%;
	font-family: 'Nanum Pen Script', cursive;

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d

}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.5);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.02);
    -moz-transform: scale(1.02);
    -o-transform: scale(1.02);
    -ms-transform: scale(1.02);
    transform: scale(1.02)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)

    
}

.pic-title {
    font-size: 1.8em
    font-family: 'Nanum Pen Script', cursive;
}

a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.open-down {
    -webkit-transform: rotateX(-180deg);
    -moz-transform: rotateX(-180deg);
    -o-transform: rotateX(-180deg);
    -ms-transform: rotateX(-180deg);
    transform: rotateX(-180deg);
    top: 0;
    left: 0
}

.pic:hover .open-down {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}


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
		
	
		$(".pic").on("click", function() {
			 var offNo = $(this).find($("input[name='offNo']")).val();
			 var meetId = $(this).find($("input[name='meetId']")).val();
			 window.location.href = "/offmeet/getInfoOff?offNo="+offNo+"&meetId="+meetId;
		});
	});

	


</script>
</head>

<body>	
<form>


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

<div class="container">

<input type ="hidden" id="message" name="message" value="${message}"/>




<div style="text-align:center; margin-top:50px">
<div class="row" style="display:inline-block">

	<c:forEach var="offMeet" items="${list}">
  		<div class="col-sm-6 col-md-4">
            <div class="pic pic-3d" style="padding: 10px 10px 10px 10px;">
               <img src="/resources/images/uploadFiles/offmeet/${offMeet.imageFile}" class="pic-image" style="width:300px; height:300px;"  onError="this.src='/resources/images/uploadFiles/Morack.png'" alt="noImage">
      
                <span class="pic-caption open-down" id="offMeetDetail">
                
               <br/><h1 class="pic-title">${offMeet.offName}</h1><br/><br/>
		        <h4>모임 장소 : ${offMeet.offLoc}</h4>
		        <h4>모임 날짜 : ${offMeet.offDate}</h4>
		        <h4>모임 인원  : ${offMeet.offMem}/${offMeet.offMax}</h4>
            </span>
      	<input type="hidden" name="meetId" value="${meet.meetId}"/>
    	<input type="hidden" name="offNo"value="${offMeet.offNo }" />
            </div>
  </div>  
  </c:forEach>
  
</div>
</div>
</form>
</body>
</html>
  
  

