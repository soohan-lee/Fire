<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/toolbar.jsp"/>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	$(document).ready(function() {
		$('#summernote').summernote({
			minHeight: 450,
	        maxHeight: 450,
			lang : 'ko-KR',
			focus: true,
			toolbar: [
 			    ['fontname', ['fontname']],
 			    ['fontsize', ['fontsize']],
 			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
 			    ['color', ['forecolor','color']],
 			    ['table', ['table']],
 			    ['para', ['ul', 'ol', 'paragraph']],
 			    ['height', ['height']],
 			    ['insert',['picture','link','video']],
 			    ['view', ['fullscreen', 'help']]
 			  ],
 			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	});
});

$(function (){
	$("button.btn.btn-warning").on("click",function(){
		var meetId = $('input[name=meetId]').val();
		var postNo = $('input[name=postNo]').val();
		var userId = $('input[name=userId]').val();
// 		alert(meetId+"////"+postNo+"\\\\\\"+userId);
		$("form").attr("method","POST").attr("action","/community/updatePost").submit();
	})
})
</script>
</head>
<body>
<!-- <form> -->
<%-- <input type="hidden"  name="postNo" value="${community.postNo}"/> --%>
<%-- <input type="hidden"  name="userId" value="${community.user.userId}"/> --%>
<%-- <input type="hidden"  name="meetId" value="${community.meet.meetId}"/> --%>
<!-- </form> -->
<div class="container">
		
		<form class="form-horizontal">
		
		<input type="hidden"  name="postNo" value="${community.postNo}"/>
<input type="hidden"  name="userId" value="${community.user.userId}"/>
<input type="hidden"  name="meetId" value="${community.meet.meetId}"/>
<%-- 		<input type ="hidden" name="postNo" value="${param.postNo}"> --%>
		
			<div class="form-group">
					<div class="col-sm-12">
					<input type="text" class="form-control" id="title" name="title" value="${community.title}" >
					</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-7 col-sm-6">
				<input type="text" class="form-control" id="userId" name="userId" value="${community.user.userId }" disabled>
				</div>
				<div class="col-xs-4 col-sm-6">
				<input type="text" class="form-control" id="meetId" name="meetId" value="${community.meet.meetName }"disabled>
				</div>
			</div>
		
			<div class="form-group">
					<div class="col-sm-12">
					<textarea id="summernote" name="content" id="content" value="${community.content}">${community.content}</textarea>
					</div>
			</div>
			
		  </div>
	
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" name="update" class="btn btn-warning">수정</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>