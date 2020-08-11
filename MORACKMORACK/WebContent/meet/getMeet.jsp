<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 상세 조회</title>

<jsp:include page="/common/listCdn.jsp" />

<style>
@font-face { font-family: 'yg-jalnan'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }

.form__field {
  width: 300px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;

}

*, *:after, *:before {
  box-sizing: border-box;
}


/*=====================*/
.checkbox {
  position: relative;
  display: inline-block;
}
.checkbox:after, .checkbox:before {
  font-family: FontAwesome;
  font-feature-settings: normal;
  -webkit-font-kerning: auto;
          font-kerning: auto;
  font-language-override: normal;
  font-stretch: normal;
  font-style: normal;
  font-synthesis: weight style;
  font-variant: normal;
  font-weight: normal;
  text-rendering: auto;
}
.checkbox label {
  width: 90px;
  height: 42px;
  background: #ccc;
  position: relative;
  display: inline-block;
  border-radius: 46px;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox label:after {
  content: '';
  position: absolute;
  width: 50px;
  height: 50px;
  border-radius: 100%;
  left: 0;
  top: -5px;
  z-index: 2;
  background: #fff;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox input {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: 5;
  opacity: 0;
  cursor: pointer;
}
.checkbox input:hover + label:after {
  box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.2), 0 3px 8px 0 rgba(0, 0, 0, 0.15);
}
.checkbox input:checked + label:after {
  left: 40px;
}

.model-4 .checkbox label {
  background: #bbb;
  height: 25px;
  width: 75px;
}
.model-4 .checkbox label:after {
  background: #fff;
  top: -8px;
  width: 38px;
  height: 38px;
}
.model-4 .checkbox input:checked + label {
  background: #77C2BB;
}
.model-4 .checkbox input:checked + label:after {
  background: #009688;
  left: 40px;
}


#inviteToMessage{
	 border-top-left-radius: 8px;
 	border-top-right-radius: 8px;
 	border-bottom-left-radius: 8px;
 	border-bottom-right-radius: 8px;
 	margin-right-9px;
  	border : 1px solid #D2691E;
 	background-color:rgba(0,0,0,0);
 	color: #D2691E;
 	margin-right: 400px;
}


#joinMeet{
	 border-top-left-radius: 8px;
 	border-top-right-radius: 8px;
 	border-bottom-left-radius: 8px;
 	border-bottom-right-radius: 8px;
 	margin-right-9px;
  	border : 1px solid #D2691E;
 	background-color:rgba(0,0,0,0);
 	color: #D2691E;
 	padding: 10px 25px;
    margin-right: 400px;
}


button {
  background: #ebc088;
  border: 0;
  box-sizing: border-box;
  margin: 1em;
  padding: 1em ;
  color: #D2691E;
  font-size: 16px;
  font-weight: 500;
  position: relative;
  vertical-align: middle;
}
button::before, button::after {
  box-sizing: inherit;
  content: '';
  position: absolute;
  width: 800%;
  height: 100%;
}

.draw {
  -webkit-transition: color 0.25s;
  transition: color 0.25s;
}
.draw::before, .draw::after {
  border: 2px solid transparent;
  width: 0;
  height: 0;
}
.draw::before {
  top: 0;
  left: 0;
}
.draw::after {
  bottom: 0;
  right: 0;
}
.draw:hover {
  color: #60daaa;
}
.draw:hover::before, .draw:hover::after {
  width: 100%;
  height: 100%;
}
.draw:hover::before {
  border-top-color: #8CAFB9;
  border-right-color: #8CAFB9;
  -webkit-transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
  transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
}
.draw:hover::after {
  border-bottom-color: #60daaa;
  border-left-color: #60daaa;
  -webkit-transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
  transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
}

.meet:hover {
  color: #fbca67;
}
.meet::after {
  top: 0;
  left: 0;
}
.meet:hover::before {
  border-top-color: #fbca67;
  border-right-color: #fbca67;
}
.meet:hover::after {
  border-bottom-color: #fbca67;
  border-left-color: #fbca67;
  -webkit-transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
  transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
}

.buttons {
  isolation: isolate;
}
.grid12-6{
     position:relative;
     padding: 30px 30px 30px 30px;
     margin-top : 30px;
}
.grid12-6 .inner_box{
     position:absolute;
     background:rgba(255,255,255,0.7);
     width: 55%;
     height: 55%;
     top:50%;
     left:50%;
     transform:translate(-50%,-50%);
     padding:35px;
     text-align:center;
}
.grid12-6 .inner_box h2{
     font-family: 'yg-jalnan';
     text-align:center;
     text-size : 50px;
     font-weight:normal;
     color:#777;
}

#mainCart{
	width: 340px;
	height: 62px;
	margin: auto;
	background: #ececec;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	display: block;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12),
		0 1px 2px rgba(0, 0, 0, 0.24);
}

a.add-to-cart {
	width: 216px;
	height: 48px;
	background: #ffab00;
	font-size: 18px;
	line-height: 48px;
	letter-spacing: 2px;
	color: rgb(255, 255, 255);
	text-transform: uppercase;
	-moz-border-radius: 24px;
	-webkit-border-radius: 24px;
	border-radius: 24px;
	text-decoration: none;
	text-align: center;
	left: 24px;
	position: absolute;
	top: 48px;
	display: block;
	box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
}

a.add-to-cart.size {
	width: 28px;
	left: 88px;
	font-size: 0;
	color: #e7bb45;
	letter-spacing: 0;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
}

a.add-to-cart.hover {
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg);
	-webkit-transform-origin: 108px 24px;
	-moz-transform-origin: 108px 24px;
	-o-transform-origin: 108px 24px;
	-ms-transform-origin: 108px 24px;
	transform-origin: 108px 24px;
}

a.cart {
	width: 72px;
	height: 72px;
	-moz-border-radius: 36px;
	-webkit-border-radius: 36px;
	border-radius: 36px;
	font-size: 18px;
	text-align: center;
	color: #616161;
	text-decoration: none;
	position: absolute;
	right: 24px;
	top: 36px;
	display: block;
	background: #535558
		url(http://images.vfl.ru/ii/1484930184/14435803/15757225.png) center no-repeat;
	background-size: 36px;
	box-shadow: 0 3px 6px rgba(97, 97, 97 0.16), 0 3px 6px rgba(97, 97, 97 0.23);
	-moz-box-shadow: 0 3px 6px rgba(97, 97, 97 0.16),
		0 3px 6px rgba(97, 97, 97 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(97, 97, 97 0.16),
		0 3px 6px rgba(97, 97, 97 0.23);
}
a.cart > span {
	width: 24px;
	height: 24px;
	font-size: 16px;
	color: #fff;
	line-height: 24px;
	position: absolute;
	-moz-border-radius: 12px;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	display: block;
	transform: scale(0);
	-o-transform: scale(0);
	-ms-transform: scale(0);
	-moz-transform: scale(0);
	-webkit-transform: scale(0);
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	background: #ffab00;
	box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-moz-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
	-webkit-box-shadow: 0 3px 6px rgba(255, 171, 0, 0.16),
		0 3px 6px rgba(255, 171, 0, 0.23);
}
a.cart > span.counter {
	left: 48px;
	bottom: 48px;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
	transform: scale(1);
	-o-transform: scale(1);
	-ms-transform: scale(1);
	-moz-transform: scale(1);
	-webkit-transform: scale(1);
}

#mainMeetName{
font-family: 'yg-jalnan';
text-size : 50px;
}

#mainHashtag{
font-family: 'MapoGoldenPier'
}

</style>


<script type ="text/javascript">

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
	
	$("#joinMeet").on("click", function(){	
		window.location.href = "/meet/joinMeet?meetId="+meetId;	
	});
	
	$("#inviteToMessage").on("click", function(){			
		window.location.href = "/friend/listFriend/1?isModal=2&meetId="+meetId;
	});
	
	
	$("#inviteToKakao").on("click", function(){
		window.location.href = "#";
	});
	
	
	$("#addOffMeet").on("click", function(){
		window.location.href = "/offmeet/addOffView?meetId="+meetId;
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

</head>

<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header> 

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>



<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetMem" name="meetMem" value="${meetMem}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>
<input type="hidden" id="wishMeet" name="wishMeet" value="${wishMeet}"/>
<input type="hidden" id="wishCount" name="wishCount" value="${wishCount}"/>
<input type="hidden" id="isModal" name="isModal" value="${isModal}"/>

<aside >
<section>


<br>
<br>
<!-- <div style="float:right;"> -->
<%-- <c:if test="${empty meetMem}"> --%>
<!-- <button type="button" class="draw meet" id="joinMeet">모임가입</button> -->
<%-- </c:if> --%>
<%-- <c:if test="${!empty meetMem and meetMem.joinCode eq '1'.charAt(0)}"> --%>
<!-- <button type="button" class="draw meet" id="inviteToMessage" >쪽지 초대</button> -->
<%-- </c:if> --%>

<!-- </div> -->
</section>

<section style="float: left; margin-bottom:10px;">
<div class="grid12-6">
<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="1150" height="1000">
<div class="inner_box">
     <h2 id="mainMeetName">${meet.meetName}</h2>
     <br/><br/>
     <h4 id="mainHashtag"><c:forEach var="hashtag" items="${meet.hashtag}">#${hashtag.HASH_NAME} </c:forEach></h4>
    <br/><br/>
     <h4 id="mainHashtag">${meet.category}</h4>
     <br/><br/>
     <h4 id="mainHashtag">${meet.meetLoc}</h4>
     <br/><br/>
     <h4 id="mainHashtag">${meet.sIntro}</h4>
     <br/><br/>
     <h4 id="mainHashtag">${meet.memNum} / ${meet.maxNum}</h4>
     <!-- <button>See More</button> -->
</div>

</div>
</section>


<!-- 모달 영역 -->
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
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" width="250" height="250" alt="MORACK MORACK" class="img-circle"/> 
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
    		${friend.myFriend.profileImg} <a id="invMeet${status.count}"> ${friend.myFriend.userId} </a> <input type="hidden"  value="${friend.myFriend.userId}"/><input type="hidden" value="${friend.myFriend.nickName}"/>
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

</aside>
</form>

</body>
</html>