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
		<input id="aid" type="number"
		value="${audience.aid}"
		>
	
	<input id="aname" type="text" value="${audience.aname}">
	
	
	<input id="adate" type="date" value="${audience.date}">
	
	<select id="certificate" name="cerificates">
		<option value="">Select one</option>
		<option value="A" ${audience.certificates == 'A' ? 'selected' :''}>A</option>
		<option value="U" ${audience.certificates == 'U' ? 'selected' :''}>U</option>
		<option value="S" ${audience.certificates == 'S' ? 'selected' :''}>S</option>
	</select>
	<select id="Movies">
		<option value="" >Select movie first</option>
	</select>
	<br>
	 <input type="checkbox" name="beveragesnacks" value="Popcorn"
	 	${audience.beveragesnacks.contains('Popcorn') ? 'checked' : ''}
	 >Popcorn<br>
    <input type="checkbox" name="beveragesnacks" value="Burger"
    ${audience.beveragesnacks.contains('Burger') ? 'checked' : ''}
    > Burger <br>
    <input type="checkbox" name="beveragesnacks" value="Puffs"
    ${audience.beveragesnacks.contains('Puffs') ? 'checked' : ''}
    > Puffs <br>
    <input type="checkbox" name="beveragesnacks" value="Coke"
    ${audience.beveragesnacks.contains('Coke') ? 'checked' : ''}
    > Coke <br><br>
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
		function selectmovies(){
			let movie = "${audience.movies}";
			let certificate = "${audience.certificates}"
			loadselectedmovies(certificate,movie);
		}
		
		function loadselectedmovies(certificate,movie){
			if(certificate===''){
				$('#Movies').empty().append('<option value="">Select movie first</option>')
				return;
			}
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/gettherespectivemovies/'+certificate,
				dataType:"json",
				success(data){	
					console.log(data)
					$('#Movies').empty().append('<option value="">Select movie first</option>')
					$.each(data.listofmovies,function(i,ele){
						let selected = ele === movie ? "selected" : "";
						$('#Movies').append("<option value='" + ele + "' " +
								selected + ">" +
								ele +
								"</option>")	
					})
				}
			})
		}
		$(document).ready(function(){
		    selectmovies();
		});
	</script>
</body>
</html>
