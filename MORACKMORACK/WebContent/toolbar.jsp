<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/common/listCdn.jsp" />
<script src="/resources/js/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<style>
@charset "UTF-8";
@font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }

#logo{
	font-family: 'TmoneyRoundWindExtraBold';
	font-size : 28px;
}
			
.navigation {
  height: 70px;
  background: #FAEBD7;
  color: #ffffff;
  border: 1px solid #FAEBD7;
}

li{
 text-align: center;
 background-color: #ffffff;
  z-index : 1;
  opacity: 0.8;
}

.brand {
  position: absolute;
  padding-left: 0px;
  float: left;
  line-height: 70px;
  text-transform: uppercase;
  font-size: 1.4em;
	
}
.brand a,
.brand a:visited {
  color: #D2691E;
  text-decoration: none
}
.nav-container {
  max-width: 1000px !important;
  margin: 0 auto !important;

}
nav {
  float: right;

}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
 
        
}
nav ul li {
  float: left;
  position: relative;

}
nav ul li a,
nav ul li a:visited {
  display: block;
  padding: 0 20px;
  line-height: 70px;
  background: #FAEBD7;
  color: #D2691E;
  text-decoration: none;
}
nav ul li a:hover,
nav ul li a:visited:hover {
  background: #FAEBD7;
  color: #D2691E;
 
}
nav ul li a:not(:only-child):after,
nav ul li a:visited:not(:only-child):after {
  padding-left: 4px;
}
nav ul li ul li {
  min-width: 190px;


}
nav ul li ul li a {
  padding: 14px;
  line-height: 20px;

}
.nav-dropdown {
  position: absolute;
  display: none;

 
}
/* Mobile navigation */
.nav-mobile {
  display: none;
  position: absolute;
  top: 0;
  right: 0;
  background: #FAEBD7;
  height: 70px;
  width: 70px;
}


</style>

<script type ="text/javascript">
var ws;
var userId = "${sessionScope.user.userId}"; //sender
(function($) { // Begin jQuery
	  $(function() { // DOM ready
		    // If a link has a dropdown, add sub menu toggle.
		    $('nav ul li a:not(:only-child)').click(function(e) {
		      $(this).siblings('.nav-dropdown').toggle();
		      // Close one dropdown when selecting another
		      $('.nav-dropdown').not($(this).siblings()).hide();
		      e.stopPropagation();
		    });
		    // Clicking away from dropdown will remove the dropdown class
		    $('html').click(function() {
		      $('.nav-dropdown').hide();
		    });
		    // Toggle open and close nav styles on click
		    $('#nav-toggle').click(function() {
		      $('nav ul').slideToggle();
		    });
		    // Hamburger to X toggle
		    $('#nav-toggle').on('click', function() {
		      this.classList.toggle('active');
		    });
		  }); // end DOM ready
		  
		  connect();
			$("#btnSend").on("click", function(){
				var chat = $("#msgArea").val();
				chat = chat + "\�� : "+ $("#chatMsg").val();
				$("#msgArea").val(chat);
				sendMsg();
				$("#chatMsg").val("");
				
			})
			
		})(jQuery); // end jQuery
		
		function connect(){ 
			
			//������ ��ü �����ϴ� �κ�
			//�ڵ鷯 ���(���� ����, �޼��� ����, ���� ����)
			
			//url ������ ������ ���
			ws = new SockJS("<c:url value="/echo"/>");
			
			ws.onopen = function(){
				console.log('���� ����');
			};
			ws.onmessage = function(e){
				console.log('�޼��� ����');
				var data = e.data;
				alert("���� �޼��� : "+ data);
				addMsg(data);
			};
			ws.onclose = function(){
				console.log('���� ����');
			};
			
		}
		function addMsg(msg){ //���� ä�� �޼����� ��� ���� �޼��� ���ؼ� set
			var chat = $("#msgArea").val();
			chat = chat + "\n ���� : "+ msg;
			$("#msgArea").val(chat);
		}
		function sender(){ //�޼��� ������ ���� ������ id ���
			var msg = {
					type : "senderId", //�޼��� �����ϴ� ������ - ���� ���̵�� �޼��� ����
					sendId : "${sessionScope.user.userId}"
			
			};
			
			ws.send(JSON.stringify(msg));
		}
		function sendMsg(){
			var msg = {
					type : "message", //�޼��� �����ϴ� ������ - ���� ���̵�� �޼��� ����
					sendId : "${sessionScope.user.userId}",
					recvId : $("#targetUser").val(),
					content : $("#chatMsg").val()
			};
			ws.send(JSON.stringify(msg));
		};
		
</script>


<div id="wrapper">
	
<section class="navigation">
  <div class="nav-container">
    <div class="brand">
      <a href="/" id="logo">MORACKMORACK</a>
    </div>
    <nav>
      <div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>
      <ul class="nav-list">
      
      
      	<!-- �Ϲ� ���� / ��ȸ�� -->
      	<c:if test="${empty sessionScope.business}">
     	 <li>
          <a href="#!">MEET</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/meet/listMyMeet">������ ����</a>
            </li>
            <li>
              <a href="/meet/addMeet">���� ����</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">SEARCH</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/meet/listMeet?searchType2=0">���� �˻�</a>
            </li>
            <li>
              <a href="/meet/listMeet?searchType2=1">ī�װ� �˻�</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#!">SOCIAL</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/friend/listFriend/0">ģ��</a>
            </li>
            <li>
              <a href="/message/listRecvMessage">������</a>
            </li>
          </ul>
        </li>
        
        <li>
          <a href="/business/listBusiness"">BUSINESS</a>
        </li>
        
        <li>
          <a href="#!">MY PAGE</a>
          <ul class="nav-dropdown">
          <li>
              <a href="/offmeet/listOffPay">������ ���� ���</a>
            </li>
            <li>
              <a href="/offmeet/listBusinessPay?userId=${user.userId}">���� ��ü ���� ���</a>
            </li>         
            <div class="dropdown-divider" style="border-color:white;"></div>
              <li>
              <a href="/user/getUser?userId=${user.userId}">�� ���� ��ȸ</a>
            </li>
            <li>
              <a href="/user/updateUser?userId=${user.userId}">�� ���� ����</a>
            </li>
          </ul>
        </li>
        
        
         <c:if test="${empty sessionScope.user}">
        <li>
		<a href="/user/login">�α���</a>       
        </li>
          
         <li>
          <a href="#!">ȸ������</a>
           <ul class="nav-dropdown">
            <li>
              <a href="/user/addUser">ȸ������</a>
            </li>
            <li>
              <a href="/business/addBusiness">��ü ȸ������</a>
            </li>
          </ul>
          </li>
          </c:if>
          
           <c:if test="${!empty sessionScope.user}">
           <li>
				<a href="/meet/listWishMeet">���� ����</a>
			</li>
			<li>
         		<a href="/user/logout">�α׾ƿ�</a>
         	</li>
          </c:if>
         </c:if> 
        
        </div>
        
      
          
     </ul>
    </nav>
  </div>
</section>