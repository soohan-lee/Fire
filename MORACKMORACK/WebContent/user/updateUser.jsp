<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Single+Day&display=swap" rel="stylesheet">
	
	<!-- cdn부분
	
	참조 : http://getbootstrap.com/css/   참조
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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
		/* body {
            padding-top : 50px;
        } */
        
        body > div {
			font-family: 'Single Day', 'Chilanka';        
        }
        
       /*  body {
		  background: #ccffff;
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
		
		/* 9 */
		.btn-9 {
		  border: none;
		  transition: all 0.3s ease;
		  overflow: hidden;
		}
		.btn-9:after {
		  position: absolute;
		  content: " ";
		  z-index: -1;
		  top: 0;
		  left: 0;
		  width: 100%;
		  height: 100%;
		   background-color: #1fd1f9;
		background-image: linear-gradient(315deg, #1fd1f9 0%, #b621fe 74%);
		  transition: all 0.3s ease;
		}
		.btn-9:hover {
		  background: transparent;
		  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
		              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
		    inset -4px -4px 6px 0 rgba(255,255,255,.5),
		    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
		  color: #fff;
		}
		.btn-9:hover:after {
		  -webkit-transform: scale(2) rotate(180deg);
		  transform: scale(2) rotate(180deg);
		  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
		              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
		    inset -4px -4px 6px 0 rgba(255,255,255,.5),
		    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
		}
		
		/* 10 */
		.btn-10 {
		  background: rgb(22,9,240);
		background: linear-gradient(0deg, rgba(22,9,240,1) 0%, rgba(49,110,244,1) 100%);
		  color: #fff;
		  border: none;
		  transition: all 0.3s ease;
		  overflow: hidden;
		}
		.btn-10:after {
		  position: absolute;
		  content: " ";
		  top: 0;
		  left: 0;
		  z-index: -1;
		  width: 100%;
		  height: 100%;
		  transition: all 0.3s ease;
		  -webkit-transform: scale(.1);
		  transform: scale(.1);
		}
		.btn-10:hover {
		  color: #fff;
		  border: none;
		  background: transparent;
		}
		.btn-10:hover:after {
		  background: rgb(0,3,255);
		background: linear-gradient(0deg, rgba(2,126,251,1) 0%,  rgba(0,3,255,1)100%);
		  -webkit-transform: scale(1);
		  transform: scale(1);
		}
		
		/* 13 */
		.btn-13 {
		  background-color: #89d8d3;
		background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
		  border: none;
		  z-index: 1;
		}
		.btn-13:after {
		  position: absolute;
		  content: "";
		  width: 100%;
		  height: 0;
		  bottom: 0;
		  left: 0;
		  z-index: -1;
		  border-radius: 5px;
		   background-color: #4dccc6;
		background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
		  box-shadow:
		   -7px -7px 20px 0px #fff9,
		   -4px -4px 5px 0px #fff9,
		   7px 7px 20px 0px #0002,
		   4px 4px 5px 0px #0001;
		  transition: all 0.3s ease;
		}
		.btn-13:hover {
		  color: #fff;
		}
		.btn-13:hover:after {
		  top: 0;
		  height: 100%;
		}
		.btn-13:active {
		  top: 2px;
		}
        
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.custom-btn.btn-9" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.custom-btn.btn-10").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//=============이메일" 유효성Check  Event 처리 =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	/* alert("이메일 형식이 아닙니다."); */
			    	swal({
						title: "이메일 형식이 아닙니다.",
						text: "",
						icon: "warning"
					});
			     }
			});
			 
		});	
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			var nn=$("input[name='nickName']").val();
			var em=$("input[name='email']").val();
			var pn=$("input[name='phoneNumber']").val();
			var cn=$("input[name='certificationNumber']").val();
			var addr=$("input[id='sample4_roadAddress']").val();
			var daddr=$("input[id='sample4_detailAddress']").val();
			
			var fullAddr=addr +" "+daddr;
			
			$("input[id='sample4_roadAddress']").val(fullAddr);
			
			if(name == null || name.length <1){
				/* alert("회원명은  반드시 입력하셔야 합니다."); */
				swal({
					title: "회원명은 반드시 입력하셔야 합니다.",
					text: "",
					icon: "warning"
				});
				return;
			}
			/////////////////////////////////////////////////
			if(!/^[가-힣]{2,5}$/.test(name)){
				/* alert("회원명에 적합하지 않습니다.") */
				swal({
					title: "회원명에 적합하지 않습니다.",
					text: "",
					icon: "warning"
				});
            return;
        	}
			/////////////////////////////////////////////////
			if(nn == null || nn.length <1){
				/* alert("닉네임은 반드시 입력하셔야 합니다."); */
				swal({
					title: "닉네임은 반드시 입력하셔야 합니다.",
					text: "",
					icon: "warning"
				});
				return;
			}
			///////////////////////////////////////////////////
			if(!/^[a-zA-Z0-9가-힣]{1,10}$/.test(nn)){
				/* alert("닉네임이 너무 길어요 ㅠㅠ") */
				swal({
					title: "닉네임이 너무 길어요 ㅠㅠ",
					text: "",
					icon: "warning"
				});
            return;
        	}
			$.ajax(
					{
						url : "/user/json/checkDuplication2/"+nickName ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							//alert(status)
							//var JSONdata = JSON.stringify(JSONData);
							//alert(JSONdata);
							//alert(JSONData)
							//alert(JSONData.result)
							
						}
					});
			////////////////////////////////////////////////////
			if(em == null || em.length <1){
				/* alert("이메일은 반드시 입력하셔야 합니다."); */
				swal({
					title: "이메일은 반드시 입력하셔야 합니다.",
					text: "",
					icon: "warning"
				});
				return;
			}
			////////////////////////////////////////
			if(!/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(em)){
				/* alert("이메일 형식이 맞지않습니다.") */
				swal({
					title: "이메일 형식이 맞지않습니다.",
					text: "",
					icon: "warning"
				});
            return;
        	}
			////////////////////////////////////////
			if(pn == null || pn.length <1){
				/* alert("휴대폰 번호는 반드시 입력하셔야 합니다."); */
				swal({
					title: "휴대폰 번호는 반드시 입력하셔야 합니다.",
					text: "",
					icon: "warning"
				});
				return;
			}
			////////////////////////////////////////
			if(!/^0[0-9]{2}-?[0-9]{3,4}-?[0-9]{4}$/.test(pn)){
				/* alert("휴대폰 번호 형식이 맞지않습니다.") */
				swal({
					title: "휴대폰 번호 형식이 맞지않습니다.",
					text: "",
					icon: "warning"
				});
            return;
        	}
			////////////////////////////////////////
			/* if(cn == null || cn.length <1){
				alert("인증번호는 반드시 입력하셔야 합니다.");
				swal({
					title: "인증번호는 반드시 입력하셔야 합니다.",
					text: "",
					icon: "warning"
				});
				return;
			} */
			if(addr == null || addr.length <1){
				/* alert("주소를 입력해주세요."); */
				swal({
					title: "주소를 입력해주세요.",
					text: "",
					icon: "warning"
				});
				return;
			}
			if(daddr == null || daddr.length <1){
				/* alert("상세주소를 입력해주세요."); */
				swal({
					title: "상세주소를 입력해주세요.",
					text: "",
					icon: "warning"
				});
				return;
			}
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
		
		$(function() {
			 $("input[name='nickName']").on("keyup" , function() {
											var nickName = $("input[name='nickName']").val().trim()
											//alert(nickName)
											$.ajax(
													{
														url : "/user/json/checkDuplication2/"+nickName ,
														method : "GET" ,
														dataType : "json" ,
														headers : {
															"Accept" : "application/json",
															"Content-Type" : "application/json"
														},
														success : function(JSONData, status){
															//alert(status)
															//var JSONdata = JSON.stringify(JSONData);
															//alert(JSONdata);
															//alert(JSONData)
															//alert(JSONData.result)
															
															var result = "";
															if(JSONData.result == false){
																result = " 중복된 닉네임입니다."
															}else {
																result = " 중복되지 않은 닉네임입니다."
															}
															
															var displayValue = "<h7>"
																+JSONData.nickName
																+result
																+"</h7>";
																
															$("h7").remove();
															$("#helpBlock2").html(displayValue);
															
															
														}
														
													});
			});
		});
	
	</script>
	
</head>

<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

	<!-- ToolBar Start /////////////////////////////////////-->
	<%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">내정보변경</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

		<div class="form-group">
		    <label for="profileImg" class="col-sm-offset-1 col-sm-3 control-label">프로필사진</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="profileImg" name="profileImg" value= {user.profileImg}>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">회원명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경회원명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" placeholder="변경닉네임">
		      	<span id="helpBlock2" class="help-block">
		      	<!-- <strong class="text-danger">입력후 중복체크 필수</strong> -->
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="변경이메일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="phoneNumber" class="col-sm-offset-1 col-sm-3 control-label">휴대폰 번호</label>
		     <div class="col-sm-4">
				<input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" placeholder="변경휴대폰번호 000-000(0)-0000"
					pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" required>		  	
		  	</div>
		  </div>
		  <!-- <div class="col-sm-3">
		      <button type="button" id ="check" class="btn btn-info">인증</button>
		    </div>
		 </div> -->
		 
		 <!-- <div class="form-group">
		    <label for="certificationNumber" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="certificationNumber" name="certificationNumber" placeholder="인증번호">
		    </div>
		  </div> -->
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sample4_roadAddress" name="address"  value="${user.address}" placeholder="변경주소">
		      <span id="guide" style="color:#999;display:none"></span>
				<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="daddress">
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="custom-btn btn-13" onclick="sample4_execDaumPostcode()" value="주소검색">주소검색</button>
		    </div>
		  </div>
		  
		  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample4_roadAddress").value = roadAddr;    

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
 
            }
        }).open();
    }
</script>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="custom-btn btn-9"  >변 &nbsp;경</button>
			  <!-- <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a> -->
			  <button type="button" class="custom-btn btn-10" >취 &nbsp;소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>