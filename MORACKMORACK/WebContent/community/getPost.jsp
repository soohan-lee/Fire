<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="/common/listCdn.jsp"/>
<title>Insert title here</title>

<script type="text/javascript">

$(function (){
	
	
	$(function(){
		$('button[name=updatePost]').on("click",function(){
			var postNo = $('input[name=postNo]').val();
			var meetId = $('input[name=meetId]').val();
// 			alert(postNo+"흐음"+meetId)
			window.location.href="/community/updatePostView?postNo="+postNo+"&meetId="+meetId;
		})
		$('button[name=deletePost]').on("click",function(){
			var postNo = $('input[name=postNo]').val();
			var meetId = $('input[name=meetId]').val();
// 			alert(meetId);
			window.location.href="/community/deletePost?postNo="+postNo+"&meetId="+meetId;
		})
		$('button[name=getPostList]').on("click",function(){
			var meetId = $('input[name=meetId]').val();
// 			alert(meetId);
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
</form>
<div class="container">
<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
               <h2>${community.title}</h2> <h5>${community.user.nickName}(${community.user.userId})</h5>
               <span> ${community.regDate}</span>
           </div>
           

			
           <div class="txt_board">
           	<%--<p><img src="../images/uploadFiles/${post.postImage}"></p>  --%>
              
               <p>${community.content}</p>
           </div>
		</section>
		<br><br><br>
		<c:if test="${community.user.userId eq sessionScope.user.userId}">
		<button type="button" name="updatePost" class="btn btn-outline-info">수정하기</button>
		<button type="button" name="deletePost" class="btn btn-outline-warning">삭제하기</button>
		<button type="button" name="getPostList" class="btn btn-outline-warning">목록</button>
		</c:if>
		</article>
</div>

</body>
</html>