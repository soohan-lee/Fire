<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>

<jsp:include page="/common/listCdn.jsp" />

<style>

</style>

<script type ="text/javascript">
$(function(){
	

$('#carousel-example-generic').carousel({
	// �����Ƶ� �ڵ� ��ȯ ���� �ð�
	// false�� �ڵ� ��ȯ���� �ʴ´�.
	interval: 1000,
	// hover�� �����ϸ� ���콺�� ������� �ڵ� ��ȯ�� �����.
	pause: "hover",
	// ��ȯ ����, true�� 1 -> 2���� �ٽ� 1�� ���ư��� �ݺ�
	wrap: true,
	// Ű���� �̺�Ʈ ���� ����(?)
	keyboard : true
	});
	
});

</script>

 <style>
h2 {
 margin: 20px;
} 
</style>

</head>
<body>

<header>
<c:if test="${ ! empty sessionScope.business }">
<jsp:include page="/business/businessToolbar.jsp" />
</c:if>
<c:if test="${ empty sessionScope.business }">
<jsp:include page="/toolbar2.jsp" />
</c:if>
</header>

<article>

<!-- carousel -->
<div style="width: 300px;margin: 100px;">
<div id="carousel-example-generic" class="carousel slide" >
<ol class="carousel-indicators">
<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
<li data-target="#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
<li data-target="#carousel-example-generic" data-slide-to="4"></li>
</ol>

<div class="carousel-inner" role="listbox">
<c:set var="i" value="1"/>
<c:forEach var="meet" items="${listMeetMain}">
<c:if test="${i == 1}">
<div class="item active">
</c:if>
<c:if test="${i != 1}">
<div class="item">
</c:if>
<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" style="width:100%">
</div>
<c:set var="i" value="${i+1}"/>
</c:forEach>
</div>


<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
</a>

<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
</a>
</div>
</div>


<c:forEach var="meet" items="${listMeetRank}">
eees
<div class="row" style="margin-top:180px"> <!-- ���� ���� -->
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="IMAGE">
    </a>
  </div>
  
 <!--  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-4">
    <a href="#" class="thumbnail">
      <img src="..." alt="IMAGE">
    </a>
  </div>
  -->
</div> 
</c:forEach>  

<div class="row" style="margin-top:180px"> <!-- ��ü ��õ -->
  <div class="col-xs-6 col-md-3"> 
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
  
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="..." alt="...">
    </a>
  </div>
</div> 
<script id="embeddedChatbot" data-botId="B2k983" src="https://www.closer.ai/js/webchat.min.js"> </script>
</article>
</body>
</html>