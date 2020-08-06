<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/listCdn.jsp" />

<meta charset="EUC-KR">
<title>Insert title here</title>

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

<form action="navigation">
			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						
						<article id="main" class="special">
							<header>
								<h2>제휴 업체 목록</h2>				
							</header>
							
						</article>
					
					</div>
					
					
					<div class="container">
					
						<c:forEach var="business" items="${list}">
						<div class="row">

							<!-- Photos -->
								<section class="4u 12u(mobile)">
									<div class="row 25% no-collapse">
										<div class="thumbnail">
    									<input type="hidden" name="businessId"value="${business.businessId }" />
											<a href="#" class="image fit"><img src="/resources/images/uploadFiles/business/${business.businessImg}" alt="" /></a>
										</div>
									</div>
								</section>	
							
							<!-- content -->
								<section class="4u 12u(mobile)">
									<ul class="divided">
										<li>
											<article class="tweet">
												<h3><a href="#">${ business.businessName }</a></h3>
												<span class="businessLoc">&nbsp;</span>
												<h4>업체 장소</h4>
												<p>&nbsp;&nbsp;${ business.businessLoc }</p>
												<h4>업체 운영 시간</h4>
												<p>${business.businessStartTime } &nbsp; ~ &nbsp; ${business.businessEndTime }</p>
											</article>
										</li>
									</ul>
								</section>																		
								
								

						</div>
					<br>
				</c:forEach>
</body>
</html>