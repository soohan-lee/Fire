<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȸ�� ��� ��ȸ</title>

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
$(function(){

	$("button[id^='sendMessage']").on("click", function(){	
		var userId = "${sendMessage}";
		var meetId = $(this).next().next().val();
		
		window.location.href ="/message/sendMessage?userId="+userId+"&meetId="+meetId;
	});
	
	$("button[id^='reqFriend']").on("click", function(){
		
		alert("ģ�� ��û !");
			
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();

		window.location.href = "/friend/reqFriend?userId="+userId+"&"+"meetId="+meetId;
	});
	
	$("button[id^='notifyUserView']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		window.location.href = "/notify/notifyUserView?userId="+userId;
	});
	
	
});


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
				<h1>���� ȸ�� ����Ʈ</h1>
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
					    <th scope="col">������</th>
						<th scope="col">�г���</th>
			    		<th scope="col">����</th>	
			    		<th scope="col">�������</th>	
					    <th scope="col">���� ���� ��¥</th>
					    <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
       
       		 <c:forEach var="listMeetMem" items="${listMeetMem}" varStatus="status"> 
              <tr  id="user2">
					    <th scope="row"><img class="image" src="/resources/images/uploadFiles/user/${listMeetMem.user.profileImg}"></th>
			     		  <td>${listMeetMem.user.nickName}</td>
					      <td>${listMeetMem.user.gender}</td>
					      <td><fmt:formatDate value="${listMeetMem.user.birthday}" pattern="yyyy-MM-dd"/></td>
					      <td><fmt:formatDate value="${listMeetMem.joinDate}" pattern="yyyy-MM-dd" /></td>
					 	  <td>
					 	  <button type="button" id="reqFriend">ģ�� ��û</button>
					 	  <input type="hidden" value="${listMeetMem.user.userId}"/>
					 	  <input type="hidden" value="${listMeetMem.meet.meetId}"/> 
					 	  <button type="button" id="sendMessage">���� ������</button  > 
					 	  <input type="hidden" value="${listMeetMem.user.userId}"/>
					 	  <input type="hidden" value="${listMeetMem.meet.meetId}"/> 
					 	  <button type="button" id="notifyUserView">ȸ�� �Ű�</button>  
					 	  <input type="hidden" value="${listMeetMem.user.userId}"/> 				    
						  </td>
					    </tr>
			
                
              
               
            </c:forEach>
 			 </tbody>
		</table>
    </div>

</form>
</body>
</html>