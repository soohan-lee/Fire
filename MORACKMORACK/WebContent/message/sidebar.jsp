<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/common/listCdn.jsp" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>

.sidebar-li{
  position: relative;
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

.sidebar-image{
  width: 54px;
  height: 54px;
  margin: 16px;
  border-radius: 50%;
  -webkit-transition: all 0.2s ease-in-out;
  -o-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

A:link {text-decoration:none; color:#000000;}
A:visited {text-decoration:none; color:#000000;}
A:active {text-decoration:none; color:#000000;}
A:hover {text-decoration:none; color:#000000;}

#send{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

#sendlist{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}


#receiveList{
font-size: 25px;
font-family: 'Nanum Pen Script', cursive;
}

</style>

<ul class="nav nav-pills" style="float:left; margin-bottom:70px">
  <li class="sidebar-li" role="presentation" id ="send"><i class="far fa-envelope"></i>&nbsp;&nbsp;쪽지 보내기</i></li>
  <li class="sidebar-li" role="presentation" id ="sendlist"><i class="far fa-paper-plane"></i>&nbsp;&nbsp;보낸 쪽지함</i></li>
  <li class="sidebar-li" role="presentation" id="receiveList"><i class="far fa-address-book"></i>&nbsp;&nbsp;받은 쪽지함</li>
</ul>
<script type="text/javascript">
$(function(){
	$("#send").on("click", function() {
	    $(self.location).attr("href", "/message/sendMessage");
	});
	
	$("#sendlist").on("click", function() {
	    $(self.location).attr("href", "/message/listSendMessage");
	});
	
	$("#receiveList").on("click", function() {
	    $(self.location).attr("href", "/message/listRecvMessage");
	});
	
})
</script>
