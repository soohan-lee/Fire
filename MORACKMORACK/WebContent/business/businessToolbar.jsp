<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
body {
	background: #ffffff; margin: 50px 0;
}
#menubar {
	width: 100%; height: 62px; background: #4D5F78;
}
#menubar-menus {
	width: 900px; margin: 0 auto; list-style: none; padding: 0; text-align: center; font-size: 0; display: table;
}
#menubar-menus > li {
	padding: 12px 0px; width: 200px; height: 40px; display: table-cell; vertical-align: middle; text-align: center; vertical-align: middle; font-size: 15px; 
}
#menubar-menus > li > a {
	 display: table-cell; vertical-align: middle; width: 200px; height: 40px; text-decoration: none; color: #FFF; 
	position: relative;
}
#menubar-menus li:hover {
	background: #FFF;
}
#menubar-menus > li > div {
	position: absolute; background: #FFF; color: #000; left: 0; width: 100%; top: auto; display: none;
	padding: 50px 0; z-index: 10;
}
</style>


<script>
$(function() {
	$("#menubar-menus li").mouseenter(function(event) {
		$(this).find("div").parent().css("background", "#FFF");
		$(this).find("div").parent().children("a").css("color", "#000").css("size", "15px");
		$(this).find("div").slideDown("slow");
	}).mouseleave(function() {
		$(this).find("div:visible").slideUp(50, function() {
			$(this).parent().css("background", "#4D5F78");
			$(this).parent().children("a").css("color", "#FFF");
		});
	});
});
</script>


<p style="text-align:left;"><a href="/index.jsp">MORACKMORACK</a>
    <span style="float:right;">
	
	<!-- ��ȸ�� -->
    <c:if test="${empty sessionScope.user && empty sessionScope.business}">
    <a href="/user/login">�α���</a>
    <a href="/user/addUser" style="margin-left:10px">ȸ������</a>
    <a href="/business/login" style="margin-left:10px">��ü �α���</a>
    <a href="/business/addBusiness" style="margin-left:10px">��ü ȸ������</a>
    </c:if>
    
    <!-- ȸ�� -->
    <c:if test="${!empty sessionScope.user}">
     <a href="/meet/listWishMeet" style="margin-left:50px">����</a>
     <a href="/user/logout" style="margin-left:10px">�α׾ƿ�</a>
     </c:if>
     
     <!-- ��ü -->
     <c:if test="${!empty sessionScope.business}">
     	<a href="/business/logout" style="margin-left:10px">�α׾ƿ�</a>
     </c:if>
     </span>
</p>


<div id="menubar">
	<ul id="menubar-menus">
		<li>
			<a href="/business/listBusiness">��ü ���</a>		
		</li>
		<li>
			<a href="/business/getBusiness">��ü ���� ��ȸ</a>	
		</li>
		<li>
			<a href="/business/updateBusinessView">��ü ���� ����</a>
		</li>
		<li>
			<a href="#">��ü �ı� ��ȸ</a>
		</li>
		<li>
			<a href="/business/listReserveBusiness">���� ��� ��ȸ</a>		
		</li>
		<li>
			<a href="/business/delBusiness">��ü ����</a>	
		</li>
	</ul>
</div>
