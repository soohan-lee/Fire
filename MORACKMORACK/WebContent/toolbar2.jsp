<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<jsp:include page="/common/listCdn.jsp" />
<script src="/resources/js/sockjs.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
@charset "UTF-8";
@font-face { font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff'); font-weight: normal; font-style: normal; }
    
   div.toolbar-wrapper {
 
        font-family: 'NIXGONM-Vb';
        transition: .5s;
    }
    
        div.toolbar-logo {
        position: relative;
        text-align: center;
        transition: .3s;
    }
    
    
#logo{
	font-family: 'TmoneyRoundWindExtraBold';
	font-size : 28px;
}
.navigation {
  height: 80px;
  background: #FAEBD7;
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
  text-decoration: none;
}
.nav-container {
  max-width: 1000px !important;
  margin: 0 auto !important;
}
nav {
  margin: 0 auto;
  font-family: 'Nanum Pen Script', cursive;
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
  font-size : 25px;
  display: block;
  padding: 0 40px;
  line-height: 70px;
  background: #FAEBD7;
  text-align: center;
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
  z-index: 1;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
}
/* Mobile navigation */
.nav-mobile {
	margin: 0 auto;
  display: none;
  position: absolute;
  top: 0;
  right: 0;
  background: #FAEBD7;
  height: 70px;
  width: 70px;
}
@media only screen and (max-width: 798px) {
  .nav-mobile {
    display: #FAEBD7;
  }
  nav {
    width: 100%;
    padding: 70px 0 15px;
  }
  nav ul {
    display: none;
  }
  nav ul li {
    float: none;
  }
  nav ul li a {
    padding: 15px;
    line-height: 20px;
  }
  nav ul li ul li a {
    padding-left: 30px;
  }
  .nav-dropdown {
     position: relative;
     
  }
}
@media screen and (min-width: 799px) {
  ul.nav-list>li  {
  		display: inline-block;
        font-size: 16pt;
        text-align: center;
        position: relative;
  }
}
#nav-toggle {
  position: absolute;
  left: 18px;
  top: 22px;
  cursor: pointer;
  padding: 10px 35px 16px 0px;
}
#nav-toggle span,
#nav-toggle span:before,
#nav-toggle span:after {
  cursor: pointer;
  border-radius: 1px;
  height: 5px;
  width: 35px;
  background: #D2691E;
  position: absolute;
  display: #8cafb9
  content: '';
  transition: all 300ms ease-in-out;
}
#nav-toggle span:before {
  top: -10px;
}
#nav-toggle span:after {
  bottom: -10px;
}
#nav-toggle.active span {
  background-color: #FAEBD7;
}
#nav-toggle.active span:before, #nav-toggle.active span:after {
  top: 0;
}
#nav-toggle.active span:before {
  transform: rotate(45deg);
}
#nav-toggle.active span:after {
  transform: rotate(-45deg);
}
article {
  max-width: 1000px;
  margin: 0 auto;
  padding: 10px;
}
.home {
    background-color: darkorange;
    width: 100px;
    text-align: center;
    font-weight: bold;
    float: right;
}
.home a {
    display: block;
    text-decoration: none;
    color: white;
    padding: 16px 16px;
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

<div class="toolbar-wrapper justify-content-center" >
   <div class="container toolbar ">
<header class="blog-header">
            <div class="nav-scroller  mb-2 toolbar-logo">
                <a href="/index.jsp"><img src="../resources/images/uploadFiles/icon/Morack.png" style="width:200;height: 200px;"></a>
            </div>     
            </header>
           </div>
         </div>
   
<section class="navigation">
  <div class="nav-container">
  
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
            <li>
              <a href="/meet/listMeet?searchType2=2">�ؽ��±� �˻�</a>
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
          <a href="/business/listBusiness">BUSINESS</a>
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
            <li>
              <a href="/user/delUser?userId=${user.userId}">ȸ�� Ż��</a>
            </li>
          </ul>
        </li>
        
         <c:if test="${empty sessionScope.user}">
         <li>
		<a href="/user/login">�α���</a>
         </li>
          
         <li>
          <a href="/user/addUser">ȸ������</a>
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
         
         <!-- ��ü -->
         <c:if test="${!empty sessionScope.business}">
         <li>
          <a href="/business/listBusiness">��ü���</a>
          <ul class="nav-dropdown">
          </ul>
        </li>
        <li>
          <a href="/business/listBusinessMenu">��ü �޴� ���</a>
          <ul class="nav-dropdown">
          </ul>
        </li>
        <li>
          <a href="/business/listReserveAbleTime">��ü ���� ���� �ð� ���</a>
        </li>
        <li>
          <a href="#!">��ü �ı� ��ȸ</a>
        </li>
        <li>
          <a href="/business/listReserveBusiness">���� ��� ��ȸ</a>
        </li>
        
         <c:if test="${empty sessionScope.user && empty sessionScope.business}">
         <li>
		<a href="#!">�α���</a>
          <ul class="nav-dropdown">
            <li>
              <a href="/user/login">ȸ�� �α���</a>
            </li>
            <li>
              <a href="/business/BusinessTestURL.jsp">��ü �α���</a>
              <%-- <jsp:include page="/business/loginBusiness2.jsp"/> --%>
            </li>
          </ul>
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
 
 		  <c:if test="${!empty sessionScope.business}">
			<li>
         		<a href="/business/logout">�α׾ƿ�</a>
         	</li>
          </c:if>
        </c:if>  
          
     </ul>
    </nav>
  </div>
</section>