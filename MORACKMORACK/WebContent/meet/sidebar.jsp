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
</style>


<ul class="nav nav-pills">
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
  <li class="sidebar-li" role="presentation"><i class="fas fa-home"></i><p class="glyphicon glyphicon-triangle-bottom"> Home</p></li>
  <c:if test="${!empty meetMem && meetMem.joinCode eq '1'.charAt(0)}">
  <li class="sidebar-li" role="presentation"><i class="fas fa-user"></i><p class="glyphicon glyphicon-triangle-bottom"> 모임 회원</p></li>
  <li class="sidebar-li" role="presentation"><i class="fas fa-comments"></i><p class="glyphicon glyphicon-triangle-bottom">모임 커뮤니티</p></li>
  <li class="sidebar-li" role="presentation"><i class="fas fa-heart"></i><p class="glyphicon glyphicon-triangle-bottom"> 오프라인 모임 목록 </p></li>
  </c:if>
  <c:if test="${!empty meetMem && meetMem.meetRole eq '0'.charAt(0)}">
  <li class="sidebar-li" role="presentation"><i class="fas fa-flag"></i><p class="glyphicon glyphicon-triangle-bottom">오프라인 모임 생성  </p></li>
  <li class="sidebar-li" role="presentation"><i class="fas fa-users"></i><p class="glyphicon glyphicon-triangle-bottom">가입 신청 회원</p></li>
  </c:if>
</ul>

<script type="text/javascript">
$("p:contains('Home')").on("click", function() {
    $(self.location).attr("href", "/meet/getMeet/${meetId}");
});

$("p:contains('모임 회원')").on("click", function() {
    $(self.location).attr("href", "/meet/listMeetMem/${meetId}");
});

$("p:contains('모임 커뮤니티')").on("click", function() {
    $(self.location).attr("href", "/community/getPostList?meetId=${meetId}");
});

$("p:contains('오프라인 모임 목록')").on("click", function() {
    $(self.location).attr("href", "/offmeet/getOffList?meetId=${meetId}");
});

$("p:contains('가입 신청 회원')").on("click", function() {
    $(self.location).attr("href", "/meet/listJoinMeetUser/${meetId}");
});


$("p:contains('오프라인 모임 생성')").on("click", function() {
    $(self.location).attr("href", "/offmeet/addOffView?meetId=${meetId}");
});




</script>