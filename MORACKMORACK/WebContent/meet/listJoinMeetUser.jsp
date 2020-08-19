<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 회원 목록 조회</title>

<jsp:include page="/common/listCdn.jsp" />
<jsp:useBean id="today" class="java.util.Date"/>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">


<style>
	    #user2{
	    font-family: 'Nanum Pen Script', cursive;
	    font-size: 20pt;
	    
	   }
		#user{
		  font-family: 'Nanum Pen Script', cursive;
		  font-size: 20pt;
		}

    	 div.h3  {
            display: inline-block;
        }
        
        
        table  {
            font-size: 10pt;
        }
        
        
button {
    width:100px;
    background-color: #FFA69E;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;

}
button:hover {
    background-color: #FFFFFF;
    color:#FFA69E;
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}

.image{
  width: 65px;
  height: 65px;
  border-radius: 50%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
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
$(function (){
	
	
	$("button[id^=okJoinMeetUser]").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/1?meetId="+meetId).submit();
		
	})
	
	$("button[id^=refuseJoinMeetUser]").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		$("form").attr("method", "POST").attr("action", "/meet/mangJoinMeetUser/"+userId+"/0?meetId="+meetId).submit();
		
	})
})


</script>

</head>
<body>

<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<header>
<jsp:include page="/toolbar.jsp" />
</header>



<div id="head">
		
		
			<div class="inner">
				<header>
				<h1>가입 신청 회원 목록</h1>
				</header>
			</div>

		</div>
		<section style="float: left; margin-top:100px;">
		<jsp:include page="/meet/sidebar.jsp" />
		</section>
<br>
<br>
<br>
<br>
<form>
<div class="container" >

				<table class="table">
					  <thead>
					    <tr id="user">
					    <th scope="col">프로필</th>
						<th scope="col">닉네임</th>
			    		<th scope="col">성별</th>	
			    		<th scope="col">생년월일</th>	
					    <th scope="col">가입 소개</th>
					    <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
       
       		 <c:forEach var="joinMeetUser" items="${listJoinMeetUser}" varStatus="status"> 
              <tr  id="user2">
					    <th scope="row"><img class="image" src="/resources/images/uploadFiles/user/${joinMeetUser.user.profileImg}" onError="this.src='/resources/images/uploadFiles/Morack.png'"></th>
			     		  <td>${joinMeetUser.user.nickName}</td>
					      <td><c:if test="${joinMeetUser.user.gender eq '남'}">남자</c:if><c:if test="${joinMeetUser.user.gender eq '여'}">여자</c:if></td>
					      <td><fmt:formatDate value="${joinMeetUser.user.birthday}" pattern="yyyy-MM-dd"/></td>
					      <td>${joinMeetUser.intro}</td>
					 	   <td><button type="button" id="okJoinMeetUser">가입 승인</button>
					  	  <input type="hidden" value="${joinMeetUser.user.userId}"/>
             			  <input type="hidden" value="${joinMeetUser.meet.meetId}"/>
					 	  <button type="button" id="refuseJoinMeetUser">가입 거절</button>
              			  <input type="hidden" value="${joinMeetUser.user.userId}"/>
                		  <input type="hidden" value="${joinMeetUser.meet.meetId}"/>
                		  </td>
					    </tr>
	
                       
            </c:forEach>
 			 </tbody>
		</table>
    </div>

</form>
</body>
</html>