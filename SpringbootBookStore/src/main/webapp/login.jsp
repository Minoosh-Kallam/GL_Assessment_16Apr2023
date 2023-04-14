<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="login.css">
  </head>
  <body>
  	<div id="error" style="background-color: red; width: 50%; position: absolute; top: 10px" >
  		${error}
  		<span style="cursor: pointer; position: absolute; right: 10px" onclick="document.getElementById('error').style.display='none' ">X</span>
  	</div>
    <form action="/doLogin" method="post">
      <h2>Login</h2>
      <label for="username">username:</label>
      <input type="text" id="userName" name="userName" class="inputField" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" class="inputField" required>
      <input type="text" id="role" name="name" value="role" style="display: none" >
      <input type="submit" value="Login" class="submitForm">
      <input type="button" value="Cancel" class="cancelForm" />
    </form>
    <p> New user? <a href="/register"> Register here</a> </p>
    <p> click here to signin as <a href="/home"> guest</a> </p>
  </body>
  
  <script>
  	const username = "${username}";
  	const error = "${error}";
  	console.log(error);
  	if(error !== "")
  		document.getElementById("error").style.display = 'visible';
  	else
  		document.getElementById("error").style.display = 'none';
  	if(username !== "")
  		document.getElementById("username").value = username;
  	
  </script>
</html>
