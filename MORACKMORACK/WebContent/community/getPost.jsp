<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.morackmorack.mvc.service.domain.*" %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="/common/listCdn.jsp"/>
	<link rel="stylesheet" href="../resources/css/lll.css" type="text/css">
<title>Insert title here</title>

<script type="text/javascript">

$(function (){
	
	
	$(function(){
		$('button[name=updatePost]').on("click",function(){
			var postNo = $('input[name=postNo]').val();
			var meetId = $('input[name=meetId]').val();

			window.location.href="/community/updatePostView?postNo="+postNo+"&meetId="+meetId;
		})
		$('button[name=deletePost]').on("click",function(){
			var postNo = $('input[name=postNo]').val();
			var meetId = $('input[name=meetId]').val();

			window.location.href="/community/deletePost?postNo="+postNo+"&meetId="+meetId;
		})
		$('button[name=getPostList]').on("click",function(){
			var meetId = $('input[name=meetId]').val();

			window.location.href="/community/getPostList?meetId="+meetId;
		})
	})
})

</script>

</head>
<body>

<jsp:include page="/toolbar.jsp"/>

<form>
<input type="hidden"  name="postNo" value="${community.postNo}"/>
<input type="hidden"  name="userId" value="${community.user.userId}"/>
<input type="hidden"  name="meetId" value="${community.meet.meetId}"/>


<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
               <h4>${community.title}</h4> 
               <img src='../resources/images/uploadFiles/user/${community.user.profileImg}' style='height: 50px; width: 50px; float: left; margin:10px 10px 10px 0;'>
               <span style="margin:6px 0 -18px 0; font-size: 16px; font-weight:bold;">${community.user.nickName}</span>
               <span style="float:left;"> ${community.regDate}</span>
               
               <div style="float:right;">

		<c:if test="${community.user.userId eq sessionScope.user.userId}">
		<button type="button" name="updatePost" class="btn btn-outline-info">수정하기</button>
		<button type="button" name="deletePost" class="btn btn-outline-warning">삭제하기</button>
		</c:if>
		<button type="button" name="getPostList" class="btn btn-outline-warning">목록</button>
		</div>
		<br><br>
		</div>
		
		<div class="txt_board">
           
              
               <p>${community.content}</p>
           </div>
		</section>
	<br><br><br><br><br>


		
		<jsp:include page="/community/getCommentsList.jsp"/>
		<div class="border-bottom mt-2 mb-4 py-4" id="hh"></div>
		</article>

</form>
</body>
</html>