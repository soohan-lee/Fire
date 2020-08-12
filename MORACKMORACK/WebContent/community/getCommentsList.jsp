<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.morackmorack.mvc.service.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

textarea{

		width:100px;
		height:100px;
		resize:none;

}

</style>


<script type="text/javascript">
$(function() { 
	 fncGetCommentsList();		 
});	
$(function() { 
	$("#addComments").on("click", function(){
		var postNo = parseInt($("input[name='postNo']").val());
		var coContent = $('#coContent').val();
		//alert(postNo + commentContent);
		$.ajax(
		    	{  		 	
		        url : "/community/json/addComments",
		        method : "POST" ,
				dataType : "json" ,
				
				data : JSON.stringify({
					"postNo" : postNo,
					"coContent" : coContent
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
				}	
		    	});
	})	
});

function fncGetCommentsList(){
	
	var postNo = parseInt($("input[name='postNo']").val()); 
	
	//alert(postNo);
	$.ajax(
	    	{
	    		 	
	        url : "/community/json/getCommentsList/"+postNo,
	        method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status) {
						
						var displayValue = "";
						var totalCount = "<h6 style='margin-bottom:-24px'>댓글&nbsp;"+JSONData.totalCount+"</h6>"

						for(i=0; i < JSONData.list.length; i++){
							var date = new Date(Number(JSONData.list[i].regDate));
							displayValue += "<h6>"
								+"<input type='hidden' class='commentNo' name='commentNo' value=" + JSONData.list[i].commentNo + ">"
								
								+"<br>"
								+"<img src='/resources/images/uploadFiles/user/"+JSONData.list[i].user.profileImg+"'  alt='프로필사진' style='height: 55px; width: 55px; float: left; margin-right: 10px; margin-bottom: 10px;'>"
								+"<p style='font-size: 14px; color:DodgerBlue; font-weight: 600; float: left;'>" +JSONData.list[i].user.userId + "&nbsp;&nbsp;&nbsp;</p>"
								+"<p style='font-size: 11px; color:gray; font-weight: 400;'>" + date.getFullYear()+".0"+parseInt(date.getMonth()+1)+"."+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</span>"
								+"<p id= 'none"+ JSONData.list[i].commentNo+"' style='font-size: 15px; padding: 14px 0px; font-weight: 400;'>"
								+ JSONData.list[i].coContent
								+"</p><br>"
								
								+"<div id='update"+ JSONData.list[i].commentNo+"' style='display: none;' class='updateComments'>" 
								+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"	
								+"<textarea class='form-control col-9 col-md-10 mr-1' rows='3' maxlength='500' style='float:left'>"
								+ JSONData.list[i].coContent
								+"</textarea>"
								+"<button class='col-2 col-md-1 btn btn-outline-info' id='updateComments'>등록</button>"
								+"</div>"
								
								+"<div class='commentsUpdateDelete'>"
									+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"			
									+"<p style='float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;'>수정 </p>"
									+"<p style='font-size:13px; color:gray; font-weight: 500;'>삭제</p><br>"
								+"</div>";	
						}
						
			$( "#hh" ).html(displayValue);
			$("#totalCount").html(totalCount);
			}	
	    	});
	
}
$(document).on("click", ".commentsUpdateDelete p:nth-child(2)", function(){
	commentNo = parseInt($(this).parent().find(".commentNo").val());
	$(this).parent().find("p").hide();
	$.ajax(
	    	{
	        url : "/community/json/updateComments/"+commentNo,
	        method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status) {
						
				$("#update"+commentNo+"").show(); 
				$("#none"+commentNo+"").hide(); 
	   
			}	
	});

});

$(document).on("click", ".updateComments button", function(){
	var commentNo = $(this).parent().find(".commentNo").val();
	var coContent = $(this).parent().find("textarea").val();
	
	$("#update"+commentNo+"").hide(); 
	$("#none"+commentNo+"").show(); 
	//alert(commentNo+commentContent);	
	
	$.ajax(
	    	{  		 	
	        url : "/community/json/updateComments",
	        method : "POST" ,
			dataType : "json" ,
			
			data : JSON.stringify({
				"commentNo" : commentNo,
				"coContent" : coContent
			}),
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status) {
				fncGetCommentsList();
			}	
			
	});
});

</script>

</head>
<body>

	<div class="border-bottom mt-2 mb-4 py-4"></div>
	<div class="container">
	<form name="addCommentsView" id="addCommentsView">
		<input type="hidden" id="portNo" name="postNo" value="${community.postNo}"/>
		<img src='../resources/images/uploadFiles/user/${user.profileImg}' style='height: 50px; width: 50px; float: left; margin:10px 10px 10px 0;'>
			<div class="form-row d-file">
					<textarea class="form-control col-9 col-md-10 mr-1"
						id="coContent" name="coContent" style="width:65%; height:100px;" ></textarea>
					<button class="col-2 col-md-1 btn btn-outline-info" id="addComments">등록</button>
				</div>
	</form>
	</div>
</body>

</html>