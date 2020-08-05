<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ȸ�� ��� ��ȸ</title>

<jsp:include page="/common/listCdn.jsp" />
<jsp:useBean id="today" class="java.util.Date"/>

<style>
button {
    width:100px;
    background-color: #FFA69E;
    border: none;
    color:#fff;
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
    background-color: #FFFFFF;
    color:#FFA69E;
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}
</style>

<script type ="text/javascript">
$(function(){

	$("button[id^='sendMessage']").on("click", function(){	
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		
		self.location="/message/sendMessage?userId="+userId+"&meetId="+meetId;
	});
	
	$("button[id^='reqFriend']").on("click", function(){
		
		alert("ģ�� ��û !");
			
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();

		self.location = "/friend/reqFriend?userId="+userId+"&"+"meetId="+meetId;
	});
	
	$("button[id^='notifyUserView']").on("click", function(){
		var userId = $(this).next().val();
		var meetId = $(this).next().next().val();
		self.location = "/notify/notifyUserView?userId="+userId;
	});
	
	$("button[id^='provideStaff']").on("click", function(){		
		var userId = $(this).next().val();
		var meetId  = $(this).next().next().val();
		self.location = "/meet/providePstn/1/"+userId+"/"+meetId;
				
	});
	
	$("button[id^='provideLeader']").on("click", function(){
		var userId = $(this).next().val();
		var meetId  = $(this).next().next().val();
		self.location = "/meet/providePstn/0/"+userId+"/"+meetId;
	});
	
});


</script>

</head>
<body>
<form>

<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>

<section style="float: left; margin-left:100px">
<div style="text-align: center;">
<section id="container" style="text-align: center;">
    <div id="title">
        <h2>���� ȸ�� ���</h2>
    </div>
    <table class="table table-hover">
        <tr>
        	<td></td>
        	<td>�̹���</td>
            <td>�г���</td>
            <td>���� ���� ��¥</td>
            <td>����</td>
            <td>����</td>
            <td>ȸ�� ���� ī�װ�</td>
             <c:if test="${meetMem.meetRole eq '0'.charAt(0)}">
            <td>������Ʈ �̷�</td>
            </c:if>
            <td></td>
        </tr>
        
        <c:forEach var="listMeetMem" items="${listMeetMem}" varStatus="status"> 
            <tr>
            	<td>
            	<c:if test="${listMeetMem.meetRole eq '0'.charAt(0)}">������</c:if>
            	<c:if test="${listMeetMem.meetRole eq '1'.charAt(0)}">������</c:if>
            	<c:if test="${listMeetMem.meetRole eq '2'.charAt(0)}">���ӿ�</c:if>
            	</td>
                <td>${listMeetMem.user.profileImg}</td>
                <td>${listMeetMem.user.nickName}(${listMeetMem.user.userId})</td>
                <td><fmt:formatDate value="${listMeetMem.joinDate}" pattern="yyyy.MM.dd" /></td>
                <td>${listMeetMem.user.gender}</td>             
                <td>${listMeetMem.user.birthday}</td>              
                <td><c:forEach var="category" items="${listMeetMem.user.category}"> ${category} </c:forEach></td>
                 <c:if test="${meetMem.meetRole eq '0'.charAt(0)}">
                <td><c:forEach var="blacklist" items="${listMeetMem.blackList}"> ${blacklist} </c:forEach></td> 
                </c:if>
                <td>
                
                
                <c:if test="${sessionScope.user.userId ne listMeetMem.user.userId}">               
                <c:if test="${listMeetMem.friendFlag eq false}">
                <button type="button" id="reqFriend${status.count}">ģ�� ��û</button>
                <input type="hidden" value="${listMeetMem.user.userId}"/><input type="hidden" value="${listMeetMem.meet.meetId}"/>
                </c:if>
                
                
                <button type="button" id="sendMessage${status.count}">���� ������</button>
                <input type="hidden" id="userIdforMessage" value="${listMeetMem.user.userId}"/>
                <input type="hidden" id="meetIdforMessage" value="${listMeetMem.meet.meetId}"/>
                                             
                <button type="button" id="notifyUserView${status.count}">ȸ�� �Ű�</button>
                <input type="hidden" value="${listMeetMem.user.userId}"/><input type="hidden" value="${listMeetMem.meet.meetId}"/><br/> <br/>
                
                <c:if test="${meetMem.meetRole eq '0'.charAt(0)}">
                <button type="button" id="provideStaff${status.count}">������ �Ӹ�</button>
                <input type="hidden" value="${meetMem.user.userId}"/>
                <input type="hidden" value="${meetMem.meet.meetId}"/>
                <button type="button" id="provideLeader${status.count}">������ ����</button>
                <input type="hidden" value="${meetMem.user.userId}"/>
                <input type="hidden" value="${meetMem.meet.meetId}"/><br/>   
                </c:if>
                </c:if>       
                </td>
            </tr>
            </c:forEach>
        
    </table>
    </section>
    </div>
</section>
</form>
</body>
</html>