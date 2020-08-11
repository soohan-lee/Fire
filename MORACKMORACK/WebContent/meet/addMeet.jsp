<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>모임 생성</title>

<jsp:include page="/common/listCdn.jsp" />


<style>
.selectbox {

    position: relative;
    width: 200px;  /* 너비설정 */
    border: 1px solid #999;  /* 테두리 설정 */
    z-index: 1;
}

/* 가상 선택자를 활용 화살표 대체 */
.selectbox:before {
    content: "";
    position: absolute;
    top: 50%;
    right: 15px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #333;
}

.selectbox label {
    position: absolute;
    top: 1px;  /* 위치정렬 */
    left: 5px;  /* 위치정렬 */
    padding: .8em .5em;  /* select의 여백 크기 만큼 */
    color: #999;
    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
}

.selectbox select {
    width: 100%;
    height: auto;  /* 높이 초기화 */
    line-height: normal;  /* line-height 초기화 */
    font-family: inherit;  /* 폰트 상속 */
    padding: .8em .5em;  /* 여백과 높이 결정 */
    border: 0;
    opacity: 0;  /* 숨기기 */
    filter:alpha(opacity=0);  /* IE8 숨기기 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
    
.selectbox {
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}


</style>


<script type ="text/javascript">

$(function(){
	
	 $("input[type='file']").change(function(e){//div 내용 비워주기
	      $('#meetImgPrev').empty();

	      var files = e.target.files;
	      var arr =Array.prototype.slice.call(files);
	      
	      //업로드 가능 파일인지 체크
	      for(var i=0;i<files.length;i++){
	        if(!checkExtension(files[i].name,files[i].size)){
	          return false;
	        }
	      }
	      
	      preview(arr);
	      
	      
	    });//file change
	    
	    function checkExtension(fileName,fileSize){

	      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	      var maxSize = 20971520;  //20MB
	      
	      if(fileSize >= maxSize){
	        alert('파일 사이즈 초과');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      
	      if(regex.test(fileName)){
	        alert('업로드 불가능한 파일이 있습니다.');
	        $("input[type='file']").val("");  //파일 초기화
	        return false;
	      }
	      return true;
	    }
	    
	    function preview(arr){
	      arr.forEach(function(f){
	        
	        //파일명이 길면 파일명...으로 처리
	        var fileName = f.name;
	        if(fileName.length > 10){
	          fileName = fileName.substring(0,7)+"...";
	        }
	        
	        //div에 이미지 추가
	        var str = '<div style="display: inline-flex; padding: 10px;">';
	        
	        
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
	          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
	            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=480px height=280px />';
	            str += '</li></div>';
	            $(str).appendTo('#meetImgPrev');
	          } 
	          reader.readAsDataURL(f);
	        }else{
	          str += '<img src="/resources/images/uploadFiles/fileImg.png" title="'+f.name+'" width=100 height=100 />';
	          $(str).appendTo('#meetImgPrev');
	        }
	      });//arr.forEach
	    }
	
	var selectTarget = $('.selectbox select');

    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });
	    
	selectTarget.on({
	    'focus' : function () {
	        $(this).parent().addClass('focus');
	    },
	    'blur' : function () {
	        $(this).parent().removeClass('focus');
	    }
	})
	
	$("#meetType").on("change", function(){
		var meetType = $("#meetType").val();
		
		if(meetType == 0){
			$("#max").val(2);
			$("#max").attr("readonly",true);
			$('input:radio[name="meetAppr"]').removeAttr('checked');
			$("input:radio[name='meetAppr']:input[value='0']").attr("checked", true);
			$("#meetAppr:not(:checked)").attr('disabled', true);
		}else{
			$("#max").attr("readonly",false);
			$("#max").focus();
			$("#meetAppr:not(:checked)").attr('disabled', false);
		}
	})
	
	$("#meetImgThum").on("click", function(e){
		document.all.meetImg.click();
		
		var aa = $(this).next.id();
	}) 
	
	$("#lImgThum").on("click", function(e){						
		document.all.lImg1.click();
	})
	
	$("#addMeet").on("click", function(){
		
		var maxNum = $("#max").val();
		var sido = $("#sido").val();
		var gugun = $("#gugun").val();
		
		$("#meetLoc").val(sido+' '+gugun);
	
		$("form").attr("method", "POST").attr("action", "/meet/addMeet/"+maxNum).submit();
	})
	

	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	 

	 // 시/도 선택 박스 초기화

	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	 
	 $("#hash").on("keyup ", function(){
		 var hash = $("#hash").val();
		 
		 if(hash.length == 2){
		 if(hash.substr(0,1) == '#'){
		 hash = hash.substr(1);
		$.ajax({
			url:'/meet/json/getHashtag',
			method:'POST',
			dataType:'text',
			data:JSON.stringify({"hash" : hash}),
			contentType:'application/json; charset=utf-8',
			success:function(listHash){	
	              
				 var hashSplit = listHash.split(",");
				 if(hashSplit.length != 0){
			      for ( var i in hashSplit ) {
			    	  var hashtag = hashSplit[i];
			    	  if(hashtag != null && hashtag!= ''){
			    	  if(i == 0){
			    		  hashtag = hashtag.replace('[{"HASH_NAME":"', '')
			    	  }else if(i == hashSplit.length-1){
			    		  hashtag = hashtag.replace('"}]', '')
			    	  }
			    	  hashtag = hashtag.replace('{"HASH_NAME":"', '').replace('"}]', '').replace('"}', '').replace('[]', '')
						console.log(hashtag);
			    	  
			    	  var getHash = $("#getHash").val();
			    	  		    	
			    	/* $("#list").append("<li>"+hashtag+"</li>"); */
			      }
				 }
		 }
												
				
				
			

		}
	 }) 
		 }
		 }
	 }) 

	});
</script>
</head>
<body>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<div class="container" style="margin-top:50px">
<form class="form-horizontal" enctype="multipart/form-data">
	
   	 	
<div class="col-xs-6 col-md-6">
  		
	<div class="form-group">
		<label for="meetImg">모임 대표 이미지 선택</label>
			<a href="#" class="thumbnail" id="meetImgThum" style="height:300px; width:500px">
			<input multiple="multiple" type="file" name="file" id="meetImg" style="display: none;" multiple/>  
			<div id="meetImgPrev"></div>
			</a>
  
  
  <p style="margin-top:20px"><strong>모임 간략 소개</strong></p>
	<input type="text" id="sIntro" name="sIntro" class="form-control" style="height:100px; width:500px"/><br/>
  
  
	<div>
		<p style="text-align:left;">
		<label for="exampleInputFile" style="text-align:left">모임 상세 소개 입력</label>   
		<span style="float:right;">
	</div>
	
	
		<textarea form="inform"  style="height:200px; width:500px"  wrap="soft" id="lIntro" name="lIntro" class="form-control"></textarea>
		
	</div>
</div>
    	
<div class="col-xs-6 col-md-6">

	<p><strong>모임명</strong></p>
	<input type="text" class="form-control" id="meetName" name="meetName" placeholder="모임명" style="height:50px; width:300px" />

	<p style="margin-top:20px"><strong>은행 선택</strong></p>
	<div class="selectbox">
		<label for="select">은행</label>
		<select id="bank" name="bank">
		<option value="">은행</option>
		<option value="기업">기업은행</option>
		<option value="농협">농협은행</option>
		<option value="국민">국민은행</option>
		<option value="우리">우리은행</option>
		<option value="SC제일">SC제일은행</option>
		<option value="한국씨티">한국씨티은행</option>
		<option value="신한">신한은행</option>
		</select>
	</div>
   		 
	<p style="margin-top:20px"><strong>카테고리 선택</strong></p>
	<div class="selectbox">
    	<label for="select">카테고리</label>
		<select id="category" name="category">	
		<option value="">카테고리</option>
		<c:forEach var="category" items="${category}">
		<option value="${category.categoryName}">${category.categoryName}</option>
		</c:forEach>
		</select>
	</div>
		
		
    <p style="margin-top:20px"><strong>모임 유형 선택</strong></p>
    <div class="selectbox">
    	<label for="select">모임 유형</label>
		<select id="meetType" name="meetType">
		<option value="">모임 유형</option>
       	 <option value="0">2인 모임</option>
      	 <option value="1">다수인 모임</option>
      	 </select>
	</div>
      	 
	<p style="margin-top:20px"><strong>모임 정원</strong></p>
	<input type="number" id="max" name="max" class="form-control" style="height:30px; width:80px"/>
      	  
    <p style="margin-top:20px"><strong>가입 승인 필요 여부</strong></p>
    <label class="radio-inline">
		<input type="radio" id="meetAppr" name="meetAppr" value="1" />필요 <br><br/>
		<input type="radio" id="meetAppr" name="meetAppr" value="0" />불필요<br/><br/>
	</label>
      	  
	<p style="margin-top:20px"><strong>주요 활동 위치 선택</strong></p>
    <select name="sido" id="sido"></select>
	<select name="gugun" id="gugun"></select>

	<input type="hidden" name="meetLoc" id="meetLoc" value=""/>
     	        	  

	</ol>
 </div>    
  	  
</form>
</div>

<div class="text-center" style="margin-top:30px">
	<input class="btn btn-default" type="button" id="addMeet" name="addMeet" value="모임 생성">
</div>
</body>
</html>