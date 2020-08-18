<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>친구 신청 조회</title>

<jsp:include page="/common/listCdn.jsp" />

<style>
	    #recvFriendList{
/* 	    font-family: 'Nanum Pen Script', cursive; */
	    font-size: 20pt;
	    
	   }
		#friend{
/* 		  font-family: 'Nanum Pen Script', cursive; */
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
	$("#getFriend").on("click", function(){
		var friendNo = $(this).next().next().next().val();
		window.location.href = "/friend/getFriend/"+friendNo;
	})
	
	$("#okFriend").on("click", function(){
		var friendNo = $(this).next().next().val();
		window.location.href = "/friend/mangFriend/"+friendNo+"/1";
	})
	
	$("#denyFriend").on("click", function(){
		var friendNo = $(this).next().val();
		window.location.href = "/friend/mangFriend/"+friendNo+"/0";
	})
})
</script>

</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div id="head">
		
		
			<div class="inner">
				<header>
				<h1>친구 신청 조회 리스트</h1>
				</header>
			</div>

		</div>
	<section style="float: left; margin-top:100px;">
		<jsp:include page="/friend/sidebar.jsp" />
	</section>
<br>
<br>
<br>
<br>
<form>
<div class="container">

		<table class="table">
			<thead>
				<tr id="friend">
				<tr id="user">
				<th scope="col">프로필</th>
				<th scope="col">닉네임(아이디)</th>
				<th scope="col">이름</th>
			    <th scope="col">성별</th>	
			    <th scope="col">신청 날짜</th>	
				<th scope="col"></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="friend" items="${listFriend}">
				<tr id="recvFriendList">
				<th scope="row"><img class="image" src="/resources/images/uploadFiles/user/${friend.reqFriend.profileImg}"></th>
				<td>${friend.reqFriend.nickName}(${friend.reqFriend.userId})</td>
				<td>${friend.reqFriend.userName}</td>
				<td>${friend.reqFriend.gender}</td>
				<td>${friend.reqFriendDate}</td>				
				<td>
<!-- 				<input type="button" id="getFriend" value="상세 조회"> -->
					<input type="button" id="okFriend" value="승인"> 
					<input type="button" id="denyFriend" value="거절">
					<input type="hidden" value="${friend.friendNo}"/>
				</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
				</div>
				</form>
</body>
</html>