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
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '��'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/man.png">
       	</c:if>
       	<c:if test="${!empty sessionScope.user and empty user.profileImg and user.gender eq '��'}">
       	<img class="sidebar-image" src="/resources/images/uploadFiles/woman.png">
       	</c:if>
       	<strong id="sideNickName">
	<c:if test="${empty sessionScope.user}">��ȸ��</c:if> <c:if test="${!empty sessionScope.user}">${user.nickName}</c:if>
		</strong>
	</li>
  <li class="sidebar-li" role="presentation" id="home"><i class="fas fa-home"></i>&nbsp;&nbsp;Home</li>
  <c:if test="${!empty meetMem && meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id ="meetMem2"><i class="fas fa-user"></i>&nbsp;&nbsp;���� ȸ��</li>
   <li class="sidebar-li" role="presentation" id ="community"><i class="fas fa-comments"></i>&nbsp;&nbsp;���� Ŀ�´�Ƽ</li>
  <li class="sidebar-li" role="presentation" id="listOffMeet"><i class="fas fa-heart"></i>&nbsp;&nbsp;�������� ���� ��� </li>
  </c:if>
  <c:if test="${!empty meetMem && meetMem.meetRole eq '0'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id="addOffMeet"><i class="fas fa-flag"></i>&nbsp;&nbsp;�������� ���� ����</li>
  <li class="sidebar-li" role="presentation" id="listJoinMeetUser"><i class="fas fa-users"></i>&nbsp;&nbsp;���� ��û ȸ��</li>
  
  </c:if>
  
  <c:if test="${!empty meetMem and meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation" id="inviteToMessage"><i class="fas fa-envelope"></i>&nbsp;&nbsp;���� �ʴ�</li>
  </c:if>
  
  <c:if test="${empty meetMem}">
	<li class="sidebar-li" role="presentation" id="joinMeet"><i class="fas fa-handshake"></i>&nbsp;&nbsp;���Ӱ���</li>
	<li class="sidebar-li" role="presentation" id="addWishMeet"><i class="fas fa-shopping-basket"></i>&nbsp;&nbsp;���ϱ�</li>
  </c:if> 
</ul>

<%-- <c:if test="${empty meetMem}"> --%>
<!-- <button type="button" class="draw meet" id="joinMeet">���Ӱ���</button> -->
<%-- </c:if> --%>
<%-- <c:if test="${!empty meetMem and meetMem.joinCode eq '1'.charAt(0)}"> --%>
<!-- <button type="button" class="draw meet" id="inviteToMessage" >���� �ʴ�</button> -->
<%-- </c:if> --%>


<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
<h4 class="modal-title" id="myModalLabel">���� ���� ��û</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-12">
    	<div class="col-xs-6 col-md-5" style="margin-top:20px">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="250" height="250" alt="MORACK MORACK" class="img-circle"/> 
 		 </div>
 		 <div class="col-xs-6 col-md-7" style="margin-top:30px">
  		<strong>���Ӹ�</strong>
		${meet.meetName} <br/><br/>
		<strong>��������</strong>
    	<c:if test="${meet.meetType eq '0'.charAt(0)}">2�θ���</c:if><c:if test="${meet.meetType eq '1'.charAt(0)}">�ټ��θ���</c:if> <br/><br/>
    	<strong>ī�װ�</strong> 
    	${meet.category}<br/><br/>
		${meet.lIntro} <br/>
		<strong>���� �ڱ�Ұ�</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="�ڱ�Ұ� �Է�" value=""/>
	</div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
            <button type="button" class="btn btn-primary" id="inputIntro">����</button>
</div>
</div>
</div>
</div>
</div>

<!-- ��� ���� -->
<div id="modalBox2" class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
<h4 class="modal-title" id="myModalLabel">�ʴ��� ģ�� ����Ʈ</h4>
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

<!-- ��� ���� -->
<div id="modalBox3" class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
<h4 class="modal-title" id="myModalLabel">���� �ʴ�</h4>
</div>
<div class="modal-body">	
			<input type="hidden" id="invUserId" name="invUserId" value=""/>
			<input type="hidden" id="invUserNickName" name="invUserNickName" value=""/>
			
			<div class="col-xs-6 col-md-12">	
 			
    		<div class="col-xs-6 col-md-6">	
    		<strong>���Ӹ�</strong> <br/>
    		${meet.meetName} <br/><br/>
    		
    		<strong>���ӻ�����</strong><br/>
    		 <fmt:formatDate value="${meet.regDate}" pattern="yyyy.MM.dd" /> <br/><br/>
    		 
    		 <strong>�ֿ� Ȱ�� ��ġ</strong><br/>
    		 ${meet.meetLoc} <br/><br/>
    		
    		<strong>ī�װ�</strong><br/>
    		 ${meet.category} <br/><br/>
    		   		   		 
    		<strong>���� ���� </strong><br/>
    		<c:if test="${meet.meetType eq '0'.charAt(0)}">2�� ����</c:if>
    		<c:if test="${meet.meetType eq '1'.charAt(0)}">�ټ��� ����</c:if>
    		 <br/> <br/>
    		 
    		<strong>���� ���� �ʿ� ���� </strong><br/>
    		<c:if test="${meet.meetAppr eq true}">���� �ʿ�</c:if>
    		<c:if test="${meet.meetAppr eq false}">���� ���ʿ�</c:if>
    		 <br/><br/>
    		 
    		<strong>���� ���� �Ұ�</strong><br/>
    		 ${meet.sIntro} <br/><br/>
    		
    		<strong>�ʴ� ����</strong> 
    		<input type="text" id="invMessage" name="invMessage" class="form__field" placeholder="�ʴ빮�� �Է�" value=""/>
    		</div>
    		
    		<div class="col-xs-6 col-md-6">	
			<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACKMORACK" class="img-circle" width="150px" height="150px" style="margin:20px; margin-right:0px;">
    		</div>
    		</div>
			
			
    		
</div>
<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">���</button>
            <button type="button" class="btn btn-primary" id="inputInvMessage">�ʴ�</button>
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
		alert("���� �ο� �ʰ�")
	}else if(joinMessage == '3'){
		alert("���� ������ ������ 5��")
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
	window.location.href = "/friend/listFriend/1?isModal=2&meetId="+meetId;
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
$('#myModal,#myModal2').on('show.bs.modal', function (event) { // myModal �����찡 �����Ҷ� �Ʒ��� �ɼ��� ����
  var button = $(event.relatedTarget) // ��� �����츦 �����ϴ� ��ư
  var titleTxt = button.data('title') // ��ư���� data-title ���� titleTxt ������ ����
  var modal = $(this)
  modal.find('.modal-title').text('Title : ' + titleTxt) // ��������쿡�� .modal-title�� ã�� titleTxt ���� ġȯ
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