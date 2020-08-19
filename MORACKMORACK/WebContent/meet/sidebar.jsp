<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/common/listCdn.jsp" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
@import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css")
@font-face { font-family: 'BBTreeGB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/BBTreeGB.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face {
src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot');  src: url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.woff') format('woff'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('https://netdna.bootstrapcdn.com/bootstrap/3.0.0/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
}
.sidebar-image{
  width: 70px;
  height: 70px;
  margin: 16px;
  border-radius: 50%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}
.sidebar-li{
  cursor: pointer;
  user-select: none;
  display: block;
  height: 80px;
  line-height: 48px;
  padding: 0;
  padding-left: 16px;
  padding-right: 46px;
  text-decoration: none;
  clear: both;
  font-weight: 500;
  overflow: hidden;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  position: absolute;
  right: 16px;
  top: 0px;
  background-color: #fff !important;
  text-align : left;
  font-color:#000000;
  font-size:15px;
}
#sideNickName{
    font-size : 25px;
    font-family: 'Nanum Pen Script', cursive;
	font-color: '#D2691E'
	
	
}
.glyphicon{
		font-size: 20px;
     font-family: 'Nanum Pen Script', cursive;
     margin-left : 5px;
}
.fas fa-home{
margin-left : 5px;
}

#home{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}
#meetMem2{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#community{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#listOffMeet{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#listJoinMeetUser{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#addOffMeet{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}
#inviteToMessage{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#joinMeet{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#addWishMeet{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}
</style>


<ul class="nav nav-pills">

<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetMem" name="meetMem" value="${meetMem}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
<input type="hidden" id="wishMeet" name="wishMeet" value="${wishMeet}"/>
<input type="hidden" id="wishCount" name="wishCount" value="${wishCount}"/>
<input type="hidden" id="isModal" name="isModal" value="${isModal}"/>

	<li>
	<c:if test="${empty sessionScope.user}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/meet/notUser.jpg">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and !empty user.profileImg}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/user/${user.profileImg}">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '남'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/man.png">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '여'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/woman.png">
       	</c:if>
       	<strong id="sideNickName">
	<c:if test="${empty sessionScope.user}">비회원</c:if> <c:if test="${!empty sessionScope.user}">${user.nickName}</c:if>
		</strong>
	</li>
  <li class="sidebar-li" role="presentation" id="home"><i class="fas fa-home"></i>&nbsp;&nbsp;Home</li>
  <c:if test="${!empty meetMem && meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id ="meetMem2"><i class="fas fa-user"></i>&nbsp;&nbsp;모임 회원</li>
   <li class="sidebar-li" role="presentation" id ="community"><i class="fas fa-comments"></i>&nbsp;&nbsp;모임 커뮤니티</li>
  <li class="sidebar-li" role="presentation" id="listOffMeet"><i class="fas fa-heart"></i>&nbsp;&nbsp;오프라인 모임 목록 </li>
  </c:if>
  <c:if test="${!empty meetMem && meetMem.meetRole eq '0'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id="addOffMeet"><i class="fas fa-flag"></i>&nbsp;&nbsp;오프라인 모임 생성</li>
  <li class="sidebar-li" role="presentation" id="listJoinMeetUser"><i class="fas fa-users"></i>&nbsp;&nbsp;가입 신청 회원</li>
  
  </c:if>
  
  <c:if test="${!empty meetMem and meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id="inviteToMessage"><i class="fas fa-envelope"></i>&nbsp;&nbsp;쪽지 초대</li>
  </c:if>
  
  <c:if test="${empty meetMem}">
	<li class="sidebar-li" role="presentation" id="joinMeet"><i class="fas fa-handshake"></i>&nbsp;&nbsp;모임가입</li>
	<li class="sidebar-li" role="presentation" id="addWishMeet"><i class="fas fa-shopping-basket"></i>&nbsp;&nbsp;찜하기</li>
  </c:if> 
</ul>

<%-- <c:if test="${empty meetMem}"> --%>
<!-- <button type="button" class="draw meet" id="joinMeet">모임가입</button> -->
<%-- </c:if> --%>
<%-- <c:if test="${!empty meetMem and meetMem.joinCode eq '1'.charAt(0)}"> --%>
<!-- <button type="button" class="draw meet" id="inviteToMessage" >쪽지 초대</button> -->
<%-- </c:if> --%>


<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">모임 가입 신청</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-12">
    	<div class="col-xs-6 col-md-5" style="margin-top:20px">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="200" height="200" alt="MORACK MORACK" class="img-circle"/> 
 		 </div>
 		 <div class="col-xs-6 col-md-7" style="margin-top:30px">
  		<strong>모임명</strong>
		${meet.meetName} <br/><br/>
		<strong>모임유형</strong>
    	<c:if test="${meet.meetType eq '0'.charAt(0)}">2인모임</c:if><c:if test="${meet.meetType eq '1'.charAt(0)}">다수인모임</c:if> <br/><br/>
    	<strong>카테고리</strong> 
    	${meet.category}<br/><br/>
		${meet.lIntro} <br/>
		<strong>한줄 자기소개</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="자기소개 입력" value=""/>
	</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="inputIntro">가입</button>
</div>
</div>
</div>
</div>
</div>

<!-- 모달 영역 -->
<div id="modalBox2" class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">초대할 친구 리스트</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-12">
    		<c:forEach var="friend" items="${listFriend}" varStatus="status">
    		<img class="sidebar-image" src="/resources/images/uploadFiles/user/${friend.myFriend.profileImg}"> <a id="invMeet${status.count}"><font size="5">${friend.myFriend.nickName}</font>(${friend.myFriend.userId})</a> <input type="hidden"  value="${friend.myFriend.userId}"/><input type="hidden" value="${friend.myFriend.nickName}"/>
			<br/><br/>

			</c:forEach>
</div>
<div class="modal-footer">
</div>
</div>
</div>
</div>
</div>

<!-- <input type="hidden" id="invUserId" name="invUserId" value=""/>
<input type="hidden" id="invUserNickName" name="invUserNickName" value=""/> -->

<!-- 모달 영역 -->
<div id="modalBox3" class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">모임 초대</h4>
</div>
<div class="modal-body">	
			<input type="hidden" id="invUserId" name="invUserId" value=""/>
			<input type="hidden" id="invUserNickName" name="invUserNickName" value=""/>
			
			<div class="col-xs-6 col-md-12">	
 			
    		<div class="col-xs-6 col-md-6">	
    		<strong>모임명</strong> <br/>
    		${meet.meetName} <br/><br/>
    		
    		<strong>모임생성일</strong><br/>
    		 <fmt:formatDate value="${meet.regDate}" pattern="yyyy.MM.dd" /> <br/><br/>
    		 
    		 <strong>주요 활동 위치</strong><br/>
    		 ${meet.meetLoc} <br/><br/>
    		
    		<strong>카테고리</strong><br/>
    		 ${meet.category} <br/><br/>
    		   		   		 
    		<strong>모임 유형 </strong><br/>
    		<c:if test="${meet.meetType eq '0'.charAt(0)}">2인 모임</c:if>
    		<c:if test="${meet.meetType eq '1'.charAt(0)}">다수인 모임</c:if>
    		 <br/> <br/>
    		 
    		<strong>가입 승인 필요 여부 </strong><br/>
    		<c:if test="${meet.meetAppr eq true}">승인 필요</c:if>
    		<c:if test="${meet.meetAppr eq false}">승인 불필요</c:if>
    		 <br/><br/>
    		 
    		<strong>모임 간략 소개</strong><br/>
    		 ${meet.sIntro} <br/><br/>
    		
    		<strong>초대 문구</strong> 
    		<input type="text" id="invMessage" name="invMessage" class="form__field" placeholder="초대문구 입력" value=""/>
    		</div>
    		
    		<div class="col-xs-6 col-md-6">	
			<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACKMORACK" class="img-circle" width="150px" height="150px" style="margin:20px; margin-right:0px;">
    		</div>
    		</div>
			
			
    		
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            <button type="button" class="btn btn-primary" id="inputInvMessage">초대</button>
</div>
</div>
</div>
</div>




<script type="text/javascript">
$(function(){
	var meetId = $("#meetId").val();
	var joinMessage = $("#joinMessage").val();
	var isModal = $('#isModal').val();
	
	if(joinMessage == '1'){
		$('#modalBox').modal('show');
		console.log("click open");
	}else if(joinMessage == '0'){
		alert("모임 인원 초과")
	}else if(joinMessage == '3'){
		alert("가입 가능한 모임은 5개")
	}else if(isModal == '2'){		
		$('#modalBox2').modal('show');
	}
$("#home").on("click", function() {
    $(self.location).attr("href", "/meet/getMeet/${meetId}");
});
$("#meetMem2").on("click", function() {
    $(self.location).attr("href", "/meet/listMeetMem/${meetId}");
});
$("#community").on("click", function() {
    $(self.location).attr("href", "/community/getPostList?meetId=${meetId}");
});
$("#listOffMeet").on("click", function() {
    $(self.location).attr("href", "/offmeet/getOffList?meetId=${meetId}");
});
$("#listJoinMeetUser").on("click", function() {
    $(self.location).attr("href", "/meet/listJoinMeetUser/${meetId}");
});
$("#addOffMeet").on("click", function() {
    $(self.location).attr("href", "/offmeet/addOffView?meetId=${meetId}");
});
$("#inviteToMessage").on("click", function(){		
  $(self.location).attr("href", "/friend/listFriend/1?isModal=2&meetId=${meetId}");
});
$("#joinMeet").on("click", function(){	
	window.location.href = "/meet/joinMeet?meetId="+meetId;	
});
$("a[id^='invMeet']").on("click", function(){
	var userId = $(this).next().val();
	var nickName = $(this).next().next().val();
	
	$("#invUserId").val(userId);
	$("#invUserNickName").val(nickName);
	
	$('#modalBox3').modal('show');
	
});
$('#myModal,#myModal2').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
  var modal = $(this)
  modal.find('.modal-title').text('Title : ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
});
$("#inputIntro").on("click", function(){
	var intro = $("#intro").val();
	$("form").attr("method", "POST").attr("action", "/meet/joinMeet").submit();
});
$("#inputInvMessage").on("click", function(){
	var invMessage = $("#invMessage").val();
	$("form").attr("method", "POST").attr("action", "/message/invMeet").submit();
});
})
</script>