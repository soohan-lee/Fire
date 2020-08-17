<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
	<title>���� �Խ���</title>
	<meta charset="EUC-KR">
	<jsp:include page="/common/listCdn.jsp"/>

<style>
.image{
  width: 50px;
  height: 50px;
  border-radius: 35%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
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

<script type="text/javascript">
	
	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage);
		var meetId = $(this).next().val();
		
	}
	
	$(function(){
		$("#addPost").on("click",function(){
			
			var meetId= $(this).next().val();
			
			self.location="/community/addPostView?meetId="+meetId;
			
		});
		$("td:nth-child(2)").on("click",function(){
			
			var postNo = $(this).next().val();

			self.location="/community/getPost?postNo="+postNo;
			
		});
		
		$("#search").on("click",function(){
			$("#currentPage").val(currentPage);
			var meetId = $(this).next().val();

			$("form").attr("method","GET").attr("action","/community/getPostList?meetId="+meetId).submit();
		})
	})
</script>
	</head>
	
	<body>

	
	<header>
		<jsp:include page ="/toolbar.jsp"/>
	</header>
	
	<div id="head">
	
		<div class="inner">
			<header>
				<h1>���� ���� �Խ���</h1>
				<input type ="hidden" id="meetId" name="meetId" value="${param.meetId}">
			</header>
		</div>
	</div>
	
<div class ="container" style="margin-top:30px;">
		<input type="hidden" name=meetId value="${meet.meetId}"/>
	<input type="hidden" name=meetMem value="${meetMem}"/>
	<div class ="row">
		<div class="col-md-6 text-left">
			<p class = "text-primary">
				��ü ${resultPage.totalCount} �Ǽ� , ���� ${resultPage.currentPage} ������
			</p>
		</div>
		
		<div class="col-md-6 text-right">
			<form class="form-inline text-right" style="float:right; margin-top:30px;">
			
				<div class="form-group">
					<select class="form-control" name="searchCondition">
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>�� ����</option> 
 						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>�ۼ���</option>  
 					</select>
 				</div>
			
				<div class="form-group">
 					<label class="sr-only" for="searchKeyword">�˻���</label>
 					<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="�˻���"
 								 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
 				</div>
 				
 				<button type="button" name="search" class="btn btn-default" id="search">�˻�</button> 				
 				<button type="button" class="btn btn-default" id="addPost" name="addPost">�۾���</button>
 				<input type="hidden" name=meetId value="${param.meetId}"/>
 				<input type="hidden" id="currentPage" name="currentPage" value=""/>
 	 			</form>
 		</div>
 	</div>
	
	<table class="table table-hover table-striped">
	
		<thead>
		<tr>
			<th align="center">No</th>
			<th align="left">������</th>
			<th align="left">�ۼ���</th>
			<th align="left">�ۼ���</th>
		</tr>
		</thead>
		
		<tbody>
		
		<c:set var="i" value="0"/>
		<c:forEach var="community" items="${list}">
			<c:set var="i" value="${i+1}"/>
			<tr>
			<td align="left" style="font-size:18px">${i}</td>
			<td align="left" style="font-size:18px">${community.title}</td><input type ="hidden" name="postNo" id="postNo" value="${community.postNo}"/>
			<td align="left"style="font-size:15px"><img class="image" src="/resources/images/uploadFiles/user/${community.user.profileImg}"><br/>(${community.user.nickName})</td>
			<td align="left" style="font-size:18px">${community.regDate}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		</div>
		
		<jsp:include page ="/common/pageNavigator_new.jsp"/>
	</body>
	</html>