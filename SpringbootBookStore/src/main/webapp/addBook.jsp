<!DOCTYPE html>
<html>
  <head>
    <title>Add Book Page</title>
    <link rel="stylesheet" type="text/css" href="../login.css">
  </head>
  <body>
    <form action="/admin/addBook" method="post">
      <h2>Enter Book details</h2>
      <label for="title">Book Title:</label>
      <input type="text" id="title" name="title" class="inputField" required>
      
      <label for="description">Description:</label>
      <input type="text" id="description" name="description" class="inputField" required>
      
      <label for="author">Author:</label>
      <input type="text" id="author" name="author" class="inputField" >
      
      <label for="publisher">Publisher:</label>
      <input type="text" id="publisher" name="publisher" class="inputField" >
      
      <label for="price">Price:</label>
      <input type="text" id="price" name="price" class="inputField" >
      
      <input type="submit" value="Login" class="submitForm">
      <a href="/home" class="cancelForm" >Cancel</a>
    </form>
  </body>
  
  
</html>