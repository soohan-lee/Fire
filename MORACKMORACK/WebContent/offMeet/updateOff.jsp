<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>�������� ���� ����</title>


<jsp:include page="/common/listCdn.jsp" />



<style>
 body > div.container{
           padding-top : 50px;
 }
</style> 

<script type="text/javascript">


function fncUpdateOff(){

	
	
	var name = $("input[name='offName']").val();
	
	if(name == null || name.length<1){
		alert("�������θ��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	
	$("form").attr("method", "POST").attr("action", "/offmeet/updateOff").submit();
	
	//document.detailForm.submit();
}

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button.btn.btn-primary" ).on("click" , function() {
		fncUpdateOff();
	});
});	

	

$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	


</script>
</head>

<body>

<div class="container">	


<form class="form-horizontal">

 <div class="form-group">
 <label for="offName" class="col-sm-offset-1 col-sm-3 control-label">�������� ���Ӹ�</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offName" name="offName" placeholder="�������� ���Ӹ� �Է��ϼ���">
   </div>
  </div>



 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
	<div class="col-sm-4">
	   <input type="text" class="form-control" id="offLoc" name="offLoc">
   </div>
  </div>
  
  	
 <div class="form-group">
 <label for="offDate" class="col-sm-offset-1 col-sm-3 control-label">���ӳ�¥</label>
	<div class="col-sm-4">${offMeet.offTime }</div>
  </div>
		
 <div class="form-group">
 <label for="offTime" class="col-sm-offset-1 col-sm-3 control-label">���ӽð�</label>
 <div class="col-sm-4">${offMeet.offTime }</div> 
   </div>
  
  <div class="form-group">
 <label for="offMax" class="col-sm-offset-1 col-sm-3 control-label">�ִ������ο���</label>
	<div class="col-sm-4">${offMeet.offMax}</div> 
   </div>
  </div>
  
<div class="form-group">
 <label for="offFee" class="col-sm-offset-1 col-sm-3 control-label">������</label>
	<div class="col-sm-4">${offMeet.amount}</div> 
  </div>
    	
 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
</div>

</body>
</html>