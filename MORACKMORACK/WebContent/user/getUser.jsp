<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
	
	<!-- cdn부분
	
	 ///////////////////////// Bootstrap, jQuery CDN //////////////////////////
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	Bootstrap Dropdown Hover CSS
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    Bootstrap Dropdown Hover JS
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
   
   <jsp:include page="/common/listCdn.jsp" />
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        div {
			font-family: 'Single Day', cursive;        
        }
        
        /* body {
		  background: #e0e5ec;
		} */
		h1 {
		  position: relative;
		  text-align: center;
		  color: #353535;
		  font-size: 50px;
		  font-family: "Cormorant Garamond", serif;
		}
		
		p {
		  font-family: 'Lato', sans-serif;
		  font-weight: 300;
		  text-align: center;
		  font-size: 18px;
		  color: #676767;
		}
		.frame {
		  width: 90%;
		  margin: 40px auto;
		  text-align: center;
		}
		button {
		  margin: 20px;
		}
		.custom-btn {
		  width: 130px;
		  height: 40px;
		  color: #fff;
		  border-radius: 5px;
		  padding: 10px 25px;
		  font-family: 'Lato', sans-serif;
		  font-weight: 500;
		  background: transparent;
		  cursor: pointer;
		  transition: all 0.3s ease;
		  position: relative;
		  display: inline-block;
		   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
		   7px 7px 20px 0px rgba(0,0,0,.1),
		   4px 4px 5px 0px rgba(0,0,0,.1);
		}
        
        /* 4 */
		.btn-4 {
		  background-color: #4dccc6;
		background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
		  line-height: 42px;
		  padding: 0;
		  border: none;
		}
		.btn-4:hover{
		  background-color: #89d8d3;
		background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
		}
		.btn-4 span {
		  position: relative;
		  display: block;
		  width: 100%;
		  height: 100%;
		}
		.btn-4:before,
		.btn-4:after {
		  position: absolute;
		  content: "";
		  right: 0;
		  top: 0;
		   box-shadow:  4px 4px 6px 0 rgba(255,255,255,.9),
		              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
		    inset -4px -4px 6px 0 rgba(255,255,255,.9),
		    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
		  transition: all 0.3s ease;
		}
		.btn-4:before {
		  height: 0%;
		  width: .1px;
		}
		.btn-4:after {
		  width: 0%;
		  height: .1px;
		}
		.btn-4:hover:before {
		  height: 100%;
		}
		.btn-4:hover:after {
		  width: 100%;
		}
		.btn-4 span:before,
		.btn-4 span:after {
		  position: absolute;
		  content: "";
		  left: 0;
		  bottom: 0;
		  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.9),
		              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
		    inset -4px -4px 6px 0 rgba(255,255,255,.9),
		    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
		  transition: all 0.3s ease;
		}
		.btn-4 span:before {
		  width: .1px;
		  height: 0%;
		}
		.btn-4 span:after {
		  width: 0%;
		  height: .1px;
		}
		.btn-4 span:hover:before {
		  height: 100%;
		}
		.btn-4 span:hover:after {
		  width: 100%;
		}
		
		/* 6 */
		.btn-6 {
		  background: rgb(247,150,192);
		background: radial-gradient(circle, rgba(247,150,192,1) 0%, rgba(118,174,241,1) 100%);
		  line-height: 42px;
		  padding: 0;
		  border: none;
		}
		.btn-6 span {
		  position: relative;
		  display: block;
		  width: 100%;
		  height: 100%;
		}
		.btn-6:before,
		.btn-6:after {
		  position: absolute;
		  content: "";
		  height: 0%;
		  width: 1px;
		 box-shadow:
		   -1px -1px 20px 0px rgba(255,255,255,1),
		   -4px -4px 5px 0px rgba(255,255,255,1),
		   7px 7px 20px 0px rgba(0,0,0,.4),
		   4px 4px 5px 0px rgba(0,0,0,.3);
		}
		.btn-6:before {
		  right: 0;
		  top: 0;
		  transition: all 500ms ease;
		}
		.btn-6:after {
		  left: 0;
		  bottom: 0;
		  transition: all 500ms ease;
		}
		.btn-6:hover{
		  background: transparent;
		  color: #76aef1;
		  box-shadow: none;
		}
		.btn-6:hover:before {
		  transition: all 500ms ease;
		  height: 100%;
		}
		.btn-6:hover:after {
		  transition: all 500ms ease;
		  height: 100%;
		}
		.btn-6 span:before,
		.btn-6 span:after {
		  position: absolute;
		  content: "";
		  box-shadow:
		   -1px -1px 20px 0px rgba(255,255,255,1),
		   -4px -4px 5px 0px rgba(255,255,255,1),
		   7px 7px 20px 0px rgba(0,0,0,.4),
		   4px 4px 5px 0px rgba(0,0,0,.3);
		}
		.btn-6 span:before {
		  left: 0;
		  top: 0;
		  width: 0%;
		  height: .5px;
		  transition: all 500ms ease;
		}
		.btn-6 span:after {
		  right: 0;
		  bottom: 0;
		  width: 0%;
		  height: .5px;
		  transition: all 500ms ease;
		}
		.btn-6 span:hover:before {
		  width: 100%;
		}
		.btn-6 span:hover:after {
		  width: 100%;
		}
        
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button.custom-btn.btn-4" ).on("click" , function() {
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">회원정보조회</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>ID</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>회원명</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이메일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대폰번호</strong></div>
			<div class="col-xs-8 col-md-4">${user.phoneNumber}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성별</strong></div>
			<div class="col-xs-8 col-md-4">${user.gender}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>생년월일</strong></div>
			<div class="col-xs-8 col-md-4"><fmt:formatDate var="resultRegDt" value="${user.birthday}" pattern="yyyy-MM-dd"/>
			${resultRegDt}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주소</strong></div>
			<div class="col-xs-8 col-md-4">${user.address}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="custom-btn btn-4">내정보수정</button>
	  			
	  			<button type="button" class="custom-btn btn-6" onclick="location.href='/index.jsp' ">메인페이지</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>