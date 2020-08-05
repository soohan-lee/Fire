<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�߽� ���� �� ��ȸ</title>

<jsp:include page="/common/listCdn.jsp" />


<style>
@font-face { font-family: 'MapoGoldenPier'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff'); font-weight: normal; font-style: normal; }
button {
    width:100px;
    background-color: #E7D5BD;
    border: none;
    color:#E7D5BD;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;

}
button:hover {
    background-color: #ffffff;
     border: 2px #E7D5BD;
    color:#000000;
}

strong{
font-family: 'MapoGoldenPier'; 
}
</style>


<script type ="text/javascript">

$(function (){
	
	$("#ok").on("click", function(){
		window.history.back();
	})
	
	$("#delMessage").on("click", function(){
		var messageNo = $(this).next().val();
		
		window.location.href = "/message/delMessage/"+messageNo;
	})
	
	$("#joinMeet").on("click", function(){
		var meetId = $(this).next().val();
		
		window.location.href = "/meet/getMeet/"+meetId;
	})
})

</script>

</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>
<div style="padding:40px; background-color:#E7D5BD; height:1300px; width:800px; margin-left:300px; margin-top:150px; padding:10px; text-align:center">
<div style="padding:30px; background-color:#ffffff; opacity:0.8; height:90%; width:90%;display: inline-block; margin-top:10px">
<c:if test="${message.messageFlag eq '0'.charAt(0)}">
<h2><strong>���� ����</strong> ${message.title}</h2> <br/><br/><br/>

<c:if test="${! empty message.meetId}">
<strong>���Ӹ�</strong> ${message.meetName} <br/><br/><br/>
</c:if>

<strong>���� ���</strong>  ${message.sender.userId} <br/>
<strong>�г���</strong>  ${message.sender.nickName} <br/><br/>

<strong>�޴� ���</strong> ${message.receiver.userId}  <br/>
<strong>�г���</strong> ${message.receiver.nickName} <br/><br/>


<strong>���� ���� ��¥</strong><br/>
<fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /><br/><br/>


<strong>���� ����</strong><br/>
${message.content} <br/><br/>

<button type="button" id="delMessage">����</button>
<input type="hidden" value = "${message.messageNo}"/>
<button type="button" id="ok">Ȯ��</button>
</c:if>


<c:if test="${message.messageFlag eq '1'.charAt(0)}">
<h2><strong>���� �ʴ�</strong><br/> 
${message.title}</h2> <br/><br/>

<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACKMORACK" class="img-circle" width="250px" height="250px">
<br/><br/>

<strong>���Ӹ�</strong><br/>
 ${meet.meetName} <br/><br/>
 
<strong>���ӻ�����</strong><br/>
<fmt:formatDate value="${meet.regDate}" pattern="yyyy.MM.dd" /><br/><br/>

<strong>�ֿ� Ȱ�� ��ġ</strong><br/>
${meet.meetLoc} <br/><br/>

<strong>���� ī�װ�</strong><br/>
${meet.category} <br/><br/>

<strong>���� ����</strong><br/>
<c:if test="${meet.meetType eq '0'.charAt(0)}">2�θ���</c:if><c:if test="${meet.meetType eq '1'.charAt(0)}">�ټ��θ���</c:if><br/><br/>

<strong>���� ���� �ʿ� ����</strong><br/>
<c:if test="${meet.meetAppr eq true}">���� �ʿ�</c:if><c:if test="${meet.meetAppr eq false}">���� ���ʿ�</c:if><br/><br/>

<strong>���� ���� �Ұ�</strong><br/>
${meet.sIntro} <br/><br/><br/>


<strong>�ʴ� ��¥</strong><br/> 
<fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /><br/><br/>

<strong>�ʴ� ����</strong><br/>
${message.content} <br/><br/>

<div style="margin-top:15px; margin-left:15px; margin-right:15px; padding:15px ">
<button type="button" id="ok">���</button>
<button type="button" id="joinMeet">����</button> 
<input type="hidden" value = "${meet.meetId}"/>
</div>
</c:if>
</div>
</div>
</aside>

</body>
</html>