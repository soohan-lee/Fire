<%@ page language="java"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*" %>

<html>

<head>
    <title>구매 목록조회</title>
    <meta charset="EUC-KR">

<jsp:include page="/common/listCdn.jsp" />

   
    <style>
    

		
		.page p {
			height:100px;
			line-height:100px;
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

    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
    <script type="text/javascript">

        function fncGetUserList(currentPage) {
            $("#currentPage").val(currentPage)
            $("form").attr("method", "POST").attr("action", "/offmeet/listBusinessPay").submit();
        }

        $(function() {
            $("button.btn.btn-default").on("click", function() {
                fncGetUserList(1);
            });
        });
        
        $(function() {
        	$(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
        		window.location.href ="/offmeet/getBusinessPay?payNo="+$(this).attr("value")
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
					<h1>제휴 업체 결제 리스트</h1>
				</header>
			</div>
		
	
		</div>       
    
    </br>
    </br>               
 <div class="container">
   
   	<form> 	
       
<div class="row">
<div class="col-md-6 text-left">
<p style = "font-size : 20px;">
전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
</p>
</div>
</br>
</br>
        <table class="table table-hover" id="offMeet">
            <thead>
                <tr>
                	<th scope="col">예약번호</th>
                	<th scope="col">업체명</th>
                    <th scope="col">예약 날짜</th>
                    <th scope="col">예약 시작 시간</th>
                    <th scope="col">예약 끝 시간</th>
                    <th scope="col">예약 인원</th>
                    <th scope="col">총 금액</th>
                </tr>
            </thead>

            <tbody>
					
                 <c:set var="i" value="0" /> 
                <c:forEach var="pay" items="${list}"> 
                    <c:set var="i" value="${i+1}" /> 
                        
               
                  <tr class="ct_list_pop">
			     <input type="hidden" name="offNo" id="offNo" value="${pay.payNo}" />
  				  		<td>${pay.payNo}</td>
                    	<td value ="${pay.payNo}">${pay.businessName}</td>                
                        <td>${pay.reserveDate}</td>
                        <td>${pay.reserveStartTime}</td>
                        <td>${pay.reserveEndTime}</td>   
                        <td>${pay.reserveMemNum}명</td>   
                         <td>            
                         <fmt:formatNumber value="${pay.totalAmount}" pattern="###,###" />원</td>     
                     </tr> 
                 </c:forEach>
            </tbody>
        </table>
          <input type="hidden" id="currentPage" name="currentPage" value=""/>
    </form>
    
    </div>
   		 <div class="">
			<p><jsp:include page="../common/pageNavigator_new.jsp"></jsp:include></p>		
		</div>
</body>

</html>
