<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>제휴 업체 목록</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<jsp:include page="/common/listCdn.jsp" />
<script src="/resources/js/main.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />	
<link rel="stylesheet" href="../resources/css/main.css" />



<script type="text/javascript">


$(function() {
	$("a[href='#']:contains('예약하기')").bind("click", function(event) {
			event.preventDefault();
 			 var businessId = $(this).find($("input[name='businessId']")).val();
 			 window.location.href = "/business/getBusiness?businessId="+businessId;

 		})
		
 	});


	$(function() {
		$(".thumbnail").bind("click", function(event) {	
			 var businessId = $(this).find($("input[name='businessId']")).val();
			 window.location.href = "/business/getBusiness?businessId="+businessId;
		})
		
	});
	
	
</script>


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
	
		.businessName{
		text-align :center;
		font-family: 'Nanum Pen Script', cursive;
		 font-size: 2em;
	    }
	    .businessLoc{
	      font-family: 'Nanum Pen Script', cursive;
	 	 font-size: 20px;
	    }
	   
	   .businessTime{
	    font-family: 'Nanum Pen Script', cursive;
	    font-size: 20px;
	   }
	      
	    div.wrapper.style1{
			 background-color: #f9f9f9;
			}
			
</style>
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>



<div id="head">
		
		
			<div class="inner">
				<header>
				<h1>제휴 업체 목록</h1>
				</header>
			</div>

		</div>

			<form action="navigation">
			<!-- Features -->
				<div class="wrapper style1">
					<section id="features" class="container special">
						<div class="continer">
					
													
						
						<div class="row">
						
							<c:forEach var="business" items="${businessList}">
								<article class="4u 12u(mobile) special">
									<div style="background-color: white; height: 490px; padding: 10px 10px 0 10px; position: relative;">
										<a href="#" class="thumbnail">
											<input type="hidden" name="businessId"value="${business.businessId }" />
											<img src="/resources/images/uploadFiles/business/${business.businessImg}" alt="" style="height: 302.36px;"/>
										</a>
										<header style="height: 30px;">
											<h3 class="businessName">${business.businessName}</h3>
										</header>
											<span class="businessLoc" style="float: center;">업체 장소 : ${business.businessLoc}</span>
										<p class ="businessTime">
											운영 시간: ${business.businessStartTime } ~ ${business.businessEndTime }
										</p>
										<a href="#" class="button" style="float: right;">예약하기
										<input type="hidden" name="businessId"value="${business.businessId }" />
										</a>
																						
									</div>
								</article>
							</c:forEach> 
								
						</div>
						
					</section>
					
					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="pageNo" name="pageNo" value="" /> 				
	
				</div>
						
		</form>
		

	</body>
</html>