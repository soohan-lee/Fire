<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>
	<meta charset="EUC-KR">
<jsp:include page="/common/listCdn.jsp" />

<style>
#header{
z-index : 1;
}	
			
 	#head {
		position: relative;
		background-image: url("/resources/images/uploadFiles/business/business.jpg");
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
		
	
		$(".thumbnail").on("click", function() {
			 var businessId = $(this).find($("input[name='businessId']")).val();
			 window.location.href = "/business/getBusiness?businessId="+businessId;
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
					<h1>제휴업체 리스트</h1>
				</header>
			</div>
	
		</div>


</br>
</br>
</br>

<div class="container">


<div style="text-align:center;">
<div class="row" style="display:inline-block">
	
	<c:forEach var="business" items="${businessList}">
  		<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<input type="hidden" name="businessId"value="${business.businessId }" />
     	 <img src="/resources/images/uploadFiles/business/${business.businessImg}" style="width:450px; height:300px;"  onError="this.src='/resources/images/logo.png'" alt="noImage">
     	 <div class="caption">
        <h3></h3>
        <h3><String>${business.businessName}</String></h3>
        </br>
        <p>${business.businessLoc}</p>
      	<p>업체 운영 시간 : ${business.businessStartTime } &nbsp; ~ &nbsp; ${business.businessEndTime }</p>
      	</div>
    	</div>
  </div>  
  </c:forEach>
  
</div>
</div>

</body>
</html>
  
  

