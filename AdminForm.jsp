<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .login-container {
            width: 380px;
            padding: 40px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #333;
            font-size: 28px;
        }

        .login-container p {
            text-align: center;
            margin-bottom: 30px;
            color: #777;
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 7px;
            color: #444;
            font-size: 14px;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            font-size: 15px;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }

        .error {
            display: block;
            margin-top: 5px;
            color: red;
            font-size: 13px;
        }

        .login-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 15px rgba(102, 126, 234, 0.3);
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            color: #888;
            font-size: 13px;
        }
		        .register-btn {
		    width: 100%;
		    padding: 13px;
		    margin-top: 10px;
		    border: 1px solid #667eea;
		    border-radius: 8px;
		    background: white;
		    color: #667eea;
		    font-size: 16px;
		    font-weight: bold;
		    cursor: pointer;
		    transition: 0.3s;
		}
		
		.register-btn:hover {
		    background: #667eea;
		    color: white;
		}
    </style>
</head>

<body>

    <div class="login-container">

        <form action="success" id="myform">
        <h2>Admin Login</h2>
        <p>Enter your credentials to continue</p>

        <div class="input-group">
            <label for="adminid">Admin ID</label>
            <input type="number" id="adminid" placeholder="Enter your ID">
            <span id="iderror" class="error"></span>
        </div>

        <div class="input-group">
            <label for="adminname">Admin Name</label>
            <input type="text" id="adminname" placeholder="Enter your name">
            <span id="nameerror" class="error"></span>
        </div>

        <button type="button" id="sbtn" class="login-btn">
            Login
        </button>
	     <button type="button" id="registerbtn" class="register-btn">
	    Register
		</button>
        </form>
        <div class="footer-text">
            Secure Admin Portal
        </div>

    </div>
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
		
		function checkuserexistence(){
			$('#iderror').text('');
			$('#nameerror').text('');
			let id = $('#adminid').val();
			let name = $('#adminname').val();
			$.ajax({
				type:'GET',
				url:"${pageContext.request.contextPath}/checkifadminexists/"+id+'/'+name,
				dataType:"json",
				success(data){
					 if(data.success == true){
						window.location.href = "${pageContext.request.contextPath}/audiencetable";
					}else{
						$('#iderror').text("user doesnt exist");
						return;
					}
				},
				error:function(error){
					console.error(error)
					}
			})
		}
	
		$('#sbtn').on('click',function(e){
			e.preventDefault();
			$('#iderror').text('');
			$('#nameerror').text('');
			let checkid = checkId();
			let nameValid = checkname();
			console.log(checkid)
			console.log(nameValid)
			if(!checkid || !nameValid){
				return;
			}
			checkuserexistence();
			
		})
		$('#registerbtn').on('click',function(){
			window.location.href = "${pageContext.request.contextPath}/registerpage";
		})
	</script>
</body>
</html>
