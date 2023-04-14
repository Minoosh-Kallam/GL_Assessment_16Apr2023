<!DOCTYPE html>
<html>
  <head>
    <title>Edit Book Details</title>
    <link rel="stylesheet" href="/login.css">
  </head>
  <body>
    <form action="/books/${book.bookId}" method="post">
      <h2>Edit Book</h2>
      <label for="title">Book Id:</label>
      <input type="text" id="bookId" name="bookId" value=${book.bookId} class="inputField" readonly>
      <label for="title">Book Title:</label>
      <input type="text" id="title" name="title" value='${book.title}' class="inputField" >
      <label for="description">Description:</label>
      <textarea id="description" name="description" class="inputField" style="height: 100px"> ${book.description} </textarea>
      <label for="author">Author:</label>
      <input type="text" id="author" name="author" value='${book.author}' class="inputField" >
      
      <label for="publisher">Publisher:</label>
      <input type="text" id="publisher" name="publisher" value="${book.publisher}" class="inputField" >
      
      <label for="price">Price:</label>
      <input type="text" id="price" name="price" value=${book.price} class="inputField" >
      
      <input type="submit" value="Edit Book" class="submitForm">
      <a href="/home" class="cancelForm"  > Cancel </a>
    </form>
  </body>
</html>