<!DOCTYPE html>
<html>
  <head>
    <title>Registration Page</title>
    <link rel="stylesheet" type="text/css" href="login.css">
  </head>
  <body>
    <form method="post">
      <h2>Register</h2>
      <label for="name">Full Name:</label>
      <input type="text" id="name" name="name" class="inputField" required>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" class="inputField" required>
      <label for="username">username:</label>
      <input type="text" id="userName" name="userName" class="inputField" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" class="inputField" required>
      <input type="text" id="role" name="role" value="role" style="display:none;">
      <input type="submit" value="Register" class="submitForm">
      <input type="button" value="Cancel" class="cancelForm" />
    </form>
    <p> Already a User? <a href="/login"> Login here</a> </p>
    <p> click here to signin as <a href="/home"> guest</a> </p>
  </body>
</html>
