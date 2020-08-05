<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="/common/listCdn.jsp"/>
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/toolbar.jsp"/>

<form>
<input type="hidden" id="postNo" name="postNo" value="${community.postNo}"/>
<input type="hidden" id="userId" name="userId" value="${community.user.userId}"/>
</form>
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
		<button type="button" class="btn btn-outline-info">수정하기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-info">삭제하기</button>
		<button type="button" class="btn btn-info" style="float: right;">목록으로</button>
		</article>
</html>

</body>
</html>