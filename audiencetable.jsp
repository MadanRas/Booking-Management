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
	<input type="text" placeholder="enter the name">
	<button type="button" id="rbtn">refresh</button>
	<table border=1 padding=1>
		<thead>
			<th>id</th>
			<th>name</th>
			<th>date</th>
			<th>certificates</th>
			<th>movies</th>
			<th>beveragesnacks</th>
			<th>feedback</th>
			<th>improvement</th>
		</thead>
		<tbody id="tablebody">
			
		</tbody>
	</table>
	<script>
	$(document).ready(function(){
		$.ajax({
			type:"GET",
			url:"getallusers",
			dataType:"json",
			success(data){
				$('#tablebody').empty();
				$.each(data.list,function(i,ele){
					console.log(data.list)
					$('#tablebody').append(
							"<tr>"+
						"<td>" + ele.aid +"</td>"+
						"<td>" + ele.aname +"</td>"+
						"<td>" + ele.date +"</td>"+
						"<td>" + ele.certificates +"</td>"+
						"<td>" + ele.movies +"</td>"+
						"<td>" + ele.beveragesnacks +"</td>"+
						"<td>" + ele.feedback +"</td>"+
						"<td>" + ele.improvement +"</td>"+
						"<td>" + "<button type='button' class='edit-btn' data-id='"+ele.aid +"'>Edit</button>"+
						"<td>" + "<button type='button' class='dlt-btn' data-id='"+ele.aid +"'>Delete</button>"+
						"</tr>"
					)
				})
			}
		})
	})
		$('#rbtn').on('click',function(){
			$.ajax({
				type:"GET",
				url:"getallusers",
				dataType:"json",
				success(data){
					$('#tablebody').empty();
					$.each(data.list,function(i,ele){
						console.log(data.list)
						$('#tablebody').append(
								"<tr>"+
							"<td>" + ele.aid +"</td>"+
							"<td>" + ele.aname +"</td>"+
							"<td>" + ele.date +"</td>"+
							"<td>" + ele.certificates +"</td>"+
							"<td>" + ele.movies +"</td>"+
							"<td>" + ele.beveragesnacks +"</td>"+
							"<td>" + ele.feedback +"</td>"+
							"<td>" + ele.improvement +"</td>"+
							"<td>" + "<button type='button' class='edit-btn' data-id='"+ele.aid +"'>Edit</button>"+
							"<td>" + "<button type='button' class='dlt-btn' data-id='"+ele.aid +"'>Delete</button>"+
							"</tr>"
						)
					})
				}
			})
		})
		
		$(document).on('click','.edit-btn',function(){
			let id = $(this).data('id')
			window.location.href = '${pageContext.request.contextPath}/selectspecificuser/'+id;

		})
	</script>
</body>
</html>
