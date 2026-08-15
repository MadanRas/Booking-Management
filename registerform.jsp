<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="success" id="myform">
		<div class="input-group">
			<label for="adminid">Admin ID</label> <input type="number"
				id="adminid" placeholder="Enter your ID"> <span id="iderror"
				class="error"></span>
		</div>

		<div class="input-group">
			<label for="adminname">Admin Name</label> <input type="text"
				id="adminname" placeholder="Enter your name"> <span
				id="nameerror" class="error"></span>
		</div>
		<span id="successspan"></span>
		<button type="submit" id="sbtn" class="submit-btn">submit</button>
	</form>
	<script>
		function checkId(){
			let id = $('#adminid').val();
			if(id.length === 0){
				$('#iderror').text('enter the id');
				return false;
			}else if(!$.isNumeric(id)){
				$('#iderror').text('enter only numbers');
				return false;
			}
			return true;
		}
		function checkname(){
			let name = $('#adminname').val();
			if(name.length === 0){
				$('#nameerror').text('enter the name');
				return false;
			}
			var textOnlyRegex = /^[a-zA-Z\s]+$/;

			if (textOnlyRegex.test(name)) {
				$('#nameerror').text('Valid');
				return true;
			} else {
				$('#nameerror').text('InValid');		
				return false;
			}
			return true;
		}

		function checkifadminexists(){
			let id = $('#adminid').val();
			let name = $('#adminname').val();
			$.ajax({
				type:'GET',
				url:"${pageContext.request.contextPath}/checkifadminexists/"+id+'/'+name,
				dataType:"json",
				success(data){
					if(data.success === true){
						$('#iderror').text('exists');
					}else if(data.registered == true){
						window.location.href = "${pageContext.request.contextPath}/";
					}
				},
				error:function(error){
					console.error(error)
					}
			})
		}
		
		$('#myform').submit(function(e){
			e.preventDefault()
			$('#iderror').text('');
			$('#nameerror').text('');
			let checkid = checkId();
			let nameValid = checkname();
			if(!checkid || !nameValid ){
				e.preventDefault();
				return false;
			}else{
				checkifadminexists()
			}
			
		})
		</script>
</body>
</html>
