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

<div id="head">

	<div class="inner">
		<header>
			<h1>������</h1>
		</header>
	</div>
	
	</div>
	
<section style="float: left; margin-top:95px;">
<jsp:include page="/message/sidebar.jsp" />
</section>

<aside>
<div style="padding:40px; background-color:#E7D5BD; width:800px; margin-left:300px; margin-top:95px; padding:10px; text-align:center">
<div style="padding:30px; background-color:#ffffff;  opacity:0.8; height:90%; width:90%;display: inline-block; margin-top:10px">
<c:if test="${message.messageFlag eq '0'.charAt(0)}">
<h2><strong>���� ���� : </strong>&nbsp;&nbsp;${message.title}</h2>

<div style="text-align:left;">
<c:if test="${! empty message.meetId}">
<strong >���Ӹ�</strong> ${message.meetName} <br/><br/><br/>
</c:if>
</div>


<h4 style="text-align:right;"><strong>���� ���� ��¥</strong></h4>
<p style="text-align:right;"><fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /> </p>

<div>
<h4 style="text-align:left;"><strong>���� ��� ID :</strong>&nbsp;${message.sender.userId}&nbsp;&nbsp;<strong>���� ��� �г��� : </strong>&nbsp;${message.sender.nickName}</h4>
<h4 style="text-align:left;"><strong>�޴� ��� ID :</strong>&nbsp;${message.receiver.userId}&nbsp;&nbsp;<strong>�޴� ��� �г��� : </strong>&nbsp;${message.receiver.nickName}</h4> <br/>
</div>
</br>

<h4><strong>���� ����</strong><br/><br/>
${message.content} </h4><br/><br/>


<button type="button" id="delMessage">����</button>
<input type="hidden" value = "${message.messageNo}"/>
<button type="button" id="ok">Ȯ��</button>
</c:if>


<c:if test="${message.messageFlag eq '1'.charAt(0)}">
<h2><strong>���� �ʴ�</strong><br/> 
${message.title}</h2> <br/>

<img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACKMORACK" class="img-circle" width="200px" height="200px">
<br/>

<h3><strong>���Ӹ�</strong></h3>
 ${meet.meetName}<br/>
 
<h3><strong>���ӻ�����</strong></h3>
<fmt:formatDate value="${meet.regDate}" pattern="yyyy.MM.dd" /><br/>

<h3><strong>�ֿ� Ȱ�� ��ġ</strong></h3>
${meet.meetLoc} <br/>

<h3><strong>���� ī�װ�</strong></h3>
${meet.category} <br/>

<h3><strong>���� ����</strong></h3>
<c:if test="${meet.meetType eq '0'.charAt(0)}">2�θ���</c:if><c:if test="${meet.meetType eq '1'.charAt(0)}">�ټ��θ���</c:if><br/>

<h3><strong>���� ���� �ʿ� ����</strong></h3>
<c:if test="${meet.meetAppr eq true}">���� �ʿ�</c:if><c:if test="${meet.meetAppr eq false}">���� ���ʿ�</c:if><br/>

<h3><strong>���� ���� �Ұ�</strong></h3>
${meet.sIntro} <br/>


<h3><strong>�ʴ� ��¥</strong></h3>
<fmt:formatDate value="${message.sendDate}" pattern="yyyy.MM.dd" /><br/>

<h3><strong>�ʴ� ����</strong></h3>
${message.content} <br/>

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