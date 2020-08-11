<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<jsp:include page ="/toolbar.jsp"/>

<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script type="text/javascript">
function fncAddPost(){
$("form").attr("method","POST").attr("action","/community/addPost").attr("enctype","multipart/form-data").submit();
}
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
 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
 			callbacks:{
 				onImageUpload: function(files, editor, welEditable){
 					console.log(files);
 					
 					for(var i = files.length-1; i>=0; i--){
 						sendFile(files[i],this);
 					}
 				}
 			}
	  });
	});
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
        }
  		e.preventDefault();
		});
	
		$("button.btn.btn-warning").on('click',function(){
// 			alert("12345")
			fncAddPost();
			
		});

});

function sendFile(file,editor){
	//파일 전송을 위한 폼생성
	data = new FormData();
	data.append("file",file);
	$.ajax({ //ajax를 이용 하여 파일 업로드 처리
		data: data,
		type:"POST",
		url:"/community/json/addPost",
		contentType :false,
		processData:false,
		success :function(data){ //처리가 성공할 경우
			//에디터 이미지 출력
			$(editor).summernote('insertImage',data.url);
		}
	});
}

</script>

</head>
<body>

<div class="container">
		
		<form class="form-horizontal">
		
			<div class="form-group">
					<div class="col-sm-12">
					<input type="text" class="form-control" id="title" name="title" placeholder="글제목">
					</div>
			</div>
			
			<div class="form-group">
				<div class="col-xs-7 col-sm-6">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="${user.nickName}(${user.userId})" disabled>
				</div>
				<div class="col-xs-4 col-sm-6">
				<input type="text" class="form-control" id="meetId" name="meetId" placeholder="${meet.meetName}"disabled>
				</div>
			</div>
		
			<div class="form-group">
					<div class="col-sm-12">
					<textarea id="summernote" name="content" id="content"></textarea>
					</div>
			</div>
			
		  </div>
	
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4 text-center">
					<button type="button" class="btn btn-warning">등록</button>
					<input type="hidden" id="userId" name="userId" value="${user.userId}"/>
					<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
				</div>
			</div>
		</form>
	</div>
	</body>
	</html>