<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>찜 목록</title>


<jsp:include page="/common/listCdn.jsp" />
<script src="/resources/js/main.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/main.css" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>
			
			

		.memNum{
		text-align :center;
		font-family: 'Nanum Pen Script', cursive;
		 font-size: 2em;
		position: relative;
	    }
	    .meetName{
	     text-align :center;
	     font-family: 'Nanum Pen Script', cursive;
	     font-size: 2em;
	     position: relative;
	    }
	     #meet{
	     text-align :center;
	     font-size: 1em;
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
</style>
<script type ="text/javascript">

$(function(){
 $(document).on('click', '#meetName', function(){		
		var meetId = $(this).next().val();
		window.location.href ="/meet/getMeet/"+meetId;
	});
	
});


$(function(){
	 $(document).on('click', '#getMeet', function(){		
			var meetId = $(this).next().val();
			window.location.href ="/meet/getMeet/"+meetId;
		});
		
	});



		$(function(){
  			 $(document).on('click', '#delWish', function(){		
  				var meetId = $(this).val();
  		
				$.ajax({
					url : "../../meet/json/delWishMeet/" + meetId + "",
					type: "GET",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					success : function(data){
						var message = data.result
						window.location.reload();	
					}
				})
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
					<h1>찜한 모임 리스트</h1>
				</header>
			</div>
		
	
		</div>


	<form action="navigation">
			<div class="wrapper style1">
				<section id="features" class="container special">
					<div class="continer">
			
						<div class="row">
						
							<c:forEach var="wishMeet" items="${listWishMeet}">
								<article class="4u 12u special" >
									<div style="background-color: white; height: 490px; padding: 10px 10px 10px 10px;">
										<a class="thumbnail">
										 <input type="hidden" name="meetId"  value="${wishMeet.meet.meetId}"/>	
										<img src="/resources/images/uploadFiles/meet/${wishMeet.meet.meetImg}" id ="getMeet" alt="" style="height: 302.36px;"/>
										<input type="hidden" name="meetId"  value="${wishMeet.meet.meetId}"/>
										</a>
										<header style="height: 30px;">
											<h3 class="meetName" id ="meetName" value="${wishMeet.meet.meetId}">${wishMeet.meet.meetName}</h3>
											<input type="hidden" name="meetId"  value="${wishMeet.meet.meetId}"/>
										</header>
										<p class ="memNum">
											${wishMeet.meet.memNum}/${wishMeet.meet.maxNum}
										<div id="meet">
     									<button type="button" id ="delWish"  value="${wishMeet.meet.meetId}"><img src="/resources/images/uploadFiles/heart.png" width="10px" height="10px"/> 찜 리스트에서 지우기</button> 
										</div>
										</p>													
									</div>
								</article>
							</c:forEach> 
								
						</div>
						
					</section>
							
	
				</div>
						
		</form>
		

	</body>
</html>