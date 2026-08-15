<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<form action="createaudience">
		<input id="aid" type="number">
	
	<input id="aname" type="text">
	
	
	<input id="adate" type="date">
	
	<select id="certificate" name="cerificates">
		<option value="">Select one</option>
		<option value="A">A</option>
		<option value="U">U</option>
		<option value="S">S</option>
	</select>
	<select id="Movies">
		<option value="" >Select movie first</option>
	</select>
	<br>
	 <input type="checkbox" name="beveragesnacks" value="Popcorn">Popcorn<br>
    <input type="checkbox" name="beveragesnacks" value="Burger"> Burger <br>
    <input type="checkbox" name="beveragesnacks" value="Puffs"> Puffs <br>
    <input type="checkbox" name="beveragesnacks" value="Coke"> Coke <br><br>
	<input type="radio" name="feedback" value="excellent">
	<label>Excellent</label>
	<input type="radio" name="feedback" value="nice">
	<label>Nice</label>
	<input type="radio" name="feedback" value="ok">
	<label>Ok</label>
	<br>
	<textarea rows="5" cols="40" id="mytextarea"></textarea>
	</form>
	<button type="submit" id="sbtn">submit</button>
	<script>
		function exedropdown(){
			let certificateofmovie = $('#certificate').val();
			if(certificateofmovie===''){
				$('#Movies').empty().append('<option value="">Select movie first</option>')
				return;
			}
			$.ajax({
				type:'GET',
				url:'gettherespectivemovies/'+certificateofmovie,
				dataType:"json",
				success(data){	
					console.log(data)
					$('#Movies').empty().append('<option value="">Select movie first</option>')
					$.each(data.listofmovies,function(i,ele){
						$('#Movies').append($('<option></option>').attr('id',i).val(ele).text(ele));	
					})
				}
			})
		}
		$('#certificate').on('change',function(){
			exedropdown()
		})
		$('#sbtn').on('click',function(){
			let snacks = [];

			$('input[name="beveragesnacks"]:checked').each(function() {
			    snacks.push($(this).val());
			});
			$.ajax({
			    type: "GET",
			    url: "createaudience/"
			        + $('#aid').val() + "/"
			        + $('#aname').val() + "/"
			        + $('#adate').val() + "/"
			        + $('#certificate').val() + "/"
			        + $('#Movies').val()+ "/"
			        + snacks.join(",")+ "/"
	                + $('input[name="feedback"]:checked').val() + "/"
					+ $('#mytextarea').val(),


			    success: function(data) {
			        console.log(data.insertion);
			    }
			});
		})
	</script>
</body>
</html>
