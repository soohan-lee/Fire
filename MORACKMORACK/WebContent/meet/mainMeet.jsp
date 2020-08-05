<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �� ��ȸ</title>

<jsp:include page="/common/listCdn.jsp" />

<style>
.form__field {
  width: 300px;
  background: #fff;
  color: #a3a3a3;
  font: inherit;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.1);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}

*, *:after, *:before {
  box-sizing: border-box;
}


/*=====================*/
.checkbox {
  position: relative;
  display: inline-block;
}
.checkbox:after, .checkbox:before {
  font-family: FontAwesome;
  font-feature-settings: normal;
  -webkit-font-kerning: auto;
          font-kerning: auto;
  font-language-override: normal;
  font-stretch: normal;
  font-style: normal;
  font-synthesis: weight style;
  font-variant: normal;
  font-weight: normal;
  text-rendering: auto;
}
.checkbox label {
  width: 90px;
  height: 42px;
  background: #ccc;
  position: relative;
  display: inline-block;
  border-radius: 46px;
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox label:after {
  content: '';
  position: absolute;
  width: 50px;
  height: 50px;
  border-radius: 100%;
  left: 0;
  top: -5px;
  z-index: 2;
  background: #fff;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
  -webkit-transition: 0.4s;
  transition: 0.4s;
}
.checkbox input {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: 5;
  opacity: 0;
  cursor: pointer;
}
.checkbox input:hover + label:after {
  box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.2), 0 3px 8px 0 rgba(0, 0, 0, 0.15);
}
.checkbox input:checked + label:after {
  left: 40px;
}

.model-4 .checkbox label {
  background: #bbb;
  height: 25px;
  width: 75px;
}
.model-4 .checkbox label:after {
  background: #fff;
  top: -8px;
  width: 38px;
  height: 38px;
}
.model-4 .checkbox input:checked + label {
  background: #77C2BB;
}
.model-4 .checkbox input:checked + label:after {
  background: #009688;
  left: 40px;
}

button {
  background: none;
  border: 0;
  box-sizing: border-box;
  margin: 1em;
  padding: 1em 2em;
  box-shadow: inset 0 0 0 2px #f45e61;
  color: #8CAFB9;
  font-size: inherit;
  font-weight: 700;
  position: relative;
  vertical-align: middle;
}
button::before, button::after {
  box-sizing: inherit;
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
}

.draw {
  -webkit-transition: color 0.25s;
  transition: color 0.25s;
}
.draw::before, .draw::after {
  border: 2px solid transparent;
  width: 0;
  height: 0;
}
.draw::before {
  top: 0;
  left: 0;
}
.draw::after {
  bottom: 0;
  right: 0;
}
.draw:hover {
  color: #60daaa;
}
.draw:hover::before, .draw:hover::after {
  width: 100%;
  height: 100%;
}
.draw:hover::before {
  border-top-color: #8CAFB9;
  border-right-color: #8CAFB9;
  -webkit-transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
  transition: width 0.25s ease-out, height 0.25s ease-out 0.25s;
}
.draw:hover::after {
  border-bottom-color: #60daaa;
  border-left-color: #60daaa;
  -webkit-transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
  transition: border-color 0s ease-out 0.5s, width 0.25s ease-out 0.5s, height 0.25s ease-out 0.75s;
}

.meet:hover {
  color: #fbca67;
}
.meet::after {
  top: 0;
  left: 0;
}
.meet:hover::before {
  border-top-color: #fbca67;
  border-right-color: #fbca67;
}
.meet:hover::after {
  border-bottom-color: #fbca67;
  border-left-color: #fbca67;
  -webkit-transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
  transition: height 0.25s ease-out, width 0.25s ease-out 0.25s;
}

.buttons {
  isolation: isolate;
}

</style>


<script type ="text/javascript">

$(function (){
	var meetId = $("#meetId").val();
	var joinMessage = $("#joinMessage").val();
	
	if(joinMessage == '1'){
		$('#modalBox').modal('show');
		console.log("click open");
	}else if(joinMessage == '0'){
		alert("���� �ο� �ʰ�")
	}else if(joinMessage == '3'){
		alert("���� ������ ������ 5��")
	}
	
	
	$("#joinMeet").on("click", function(){	
		self.location("/meet/joinMeet?meetId="+meetId)		
	});
	
	$("#addWishMeet").on("click", function(){		
		self.location("/meet/addWishMeet?meetId="+meetId)		
		alert("��!") //�� ���â �����
	});
	
	$("#addOffMeet").on("click", function(){		
		self.location("/offmeet/addOffView?meetId="+meetId)		
	})
	
	
	$("#inputIntro").on("click", function(){
			var intro = $("#intro").val();
			$("form").attr("method", "POST").attr("action", "/meet/joinMeet").submit();
	});
	

	$('#myModal').on('show.bs.modal', function (event) { // myModal �����찡 �����Ҷ� �Ʒ��� �ɼ��� ����
	  var button = $(event.relatedTarget) // ��� �����츦 �����ϴ� ��ư
	  var titleTxt = button.data('title') // ��ư���� data-title ���� titleTxt ������ ����
	  var modal = $(this)
	  modal.find('.modal-title').text('Title : ' + titleTxt) // ��������쿡�� .modal-title�� ã�� titleTxt ���� ġȯ
	});
	
	$("#addOffMeet").on("click", function(){
		self.location("/offmeet/addOffView?meetId="+meetId);
	});
})

</script>

</head>

<body>
<form>

<header>
<jsp:include page="/toolbar.jsp" />
</header>

<section style="float: left; margin-top:100px;">
<jsp:include page="/meet/sidebar.jsp" />
</section>



<input type="hidden" id="joinMessage" value="${joinMessage}"/>
<input type="hidden" id="meetId" name="meetId" value="${meet.meetId}"/>


<section style="float: right; margin-left:100px">

<section class="model-4">
  <div class="model-4 checkbox">
    <input type="checkbox" id="addWishMeet"/>
    <label></label>
  </div>
</section>


<button type="button" class="draw meet" id="joinMeet">���Ӱ���</button>
<button type="button" class="draw meet">���� �ʴ�</button>
<button type="button" class="draw meet">īī���� �ʴ�</button>
<button type="button" class="draw meet" id="addOffMeet">�������� ���� ����</button>




<!-- ��� ���� -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">��</span></button>
<h4 class="modal-title" id="myModalLabel">���� ���� ��û</h4>
</div>
<div class="modal-body">
    	<div class="col-xs-6 col-md-5">
    		<a href="#" class="thumbnail">
     		 <img src="/resources/images/uploadFiles/meet/${meet.meetImg}" alt="MORACK MORACK"/> 
    		</a>
 		 </div>
  		<strong>���Ӹ�</strong>
		${meet.meetName} <br/>
    	<c:if test="${meet.meetType=='0'}">2�θ���</c:if><c:if test="${meet.meetType=='1'}">�ټ��θ���</c:if> <br/>
    	<c:choose>
		<c:when test="${meet.category eq 0}">����</c:when>
		<c:when test="${meet.category eq 1}">����</c:when>
		<c:when test="${meet.category eq 2}">����</c:when>
		<c:when test="${meet.category eq 3}">��ȭ</c:when>
		<c:when test="${meet.category eq 4}">����</c:when>
		<c:when test="${meet.category eq 5}">����</c:when>
		<c:when test="${meet.category eq 6}">���/�ڱ���</c:when>
		<c:when test="${meet.category eq 7}">��Ƽ��Ƽ</c:when>
		<c:when test="${meet.category eq 8}">����/��ȭ</c:when>
		<c:when test="${meet.category eq 9}">��</c:when>
		<c:when test="${meet.category eq 10}">����</c:when>
		<c:when test="${meet.category eq 11}">�ݷ�����</c:when>
		<c:when test="${meet.category eq 12}">�丮</c:when>
		<c:when test="${meet.category eq 13}">��</c:when>
		<c:when test="${meet.category eq 14}">������</c:when>
		<c:when test="${meet.category eq 15}">����</c:when>
		<c:when test="${meet.category eq 16}">��Ÿ</c:when>
	</c:choose> <br/>
		${meet.lIntro} <br/>
		<strong>���� �ڱ�Ұ�</strong> <input type="text" id="intro" name="intro" class="form__field" placeholder="�ڱ�Ұ� �Է�" value=""/>
</div>
<div class="modal-footer">
<button class="btn btn-default" data-dismiss="modal">���</button>
            <button class="btn btn-primary" id="inputIntro">����</button>
</div>
</div>
</div>
</div>


</section>

</form>

</body>
</html>