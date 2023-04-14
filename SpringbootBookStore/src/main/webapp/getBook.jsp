<!DOCTYPE html>
<html>
  <head>
    <title>Book Details</title>
    <link rel="stylesheet" href="/login.css">
    <link rel="stylesheet" type="text/css" href="/navbar.css">
  </head>
  <body>
  
  <nav>
  <ul>
    <li><a href="/home">Home</a></li>
    <li id = "register" class="nav-button"><a href="/register">Register</a></li>
    <li id= "login" class="nav-button"><a href="/login">Login</a></li>
    <li id= "profile" class="nav-button"><a href="/profile" id= "username"></a></li>
    <li id="logout"><a href="/logout">Logout</a></li>
  </ul>
</nav>
  	
    <form action="/books/edit/${book.bookId}" method="get" >
      <button type="button" onclick="manageFav()"><img id="like"  width="20px" height="20px" /></button>
      <button type="button" onclick="manageWatchLater()"><img id="Watch_Later"  width="20px" height="20px" /></button>
      
      
      <h2>Book</h2>
      
      <label for="title">Book Id:</label>
      <input type="text" id="bookId" name="bookId" value=${book.bookId} class="inputField" readonly>
      
      <label for="title">Book Title:</label>
      <input type="text" id="title" name="title" value="${book.title}" class="inputField" readonly>
      <label for="description">Description:</label>
      <textarea id="description" name="description" class="inputField" style="height: 100px" readonly> ${book.description} </textarea>
     
      <label for="author">Description:</label>
      <input type="text" id="author" name="author" value="${book.author}" class="inputField" readonly>
      
      <label for="publisher">Publisher:</label>
      <input type="text" id="publisher" name="publisher" value="${book.publisher}" class="inputField" readonly>
      
      <label for="price">Price:</label>
      <input type="text" id="price" name="price" value="${book.price}" class="inputField" readonly >
      
      <input type="submit" id="submit_edit_book" value="Edit Book" class="submitForm">
      <input type="button" value="Back" class="submitForm" onclick="history.go(-1)" >
    </form>
    <script src="/navbar.js" ></script>
    <script>
    
    	const username = "${username}";
    	showNavbar(username);
    	
    	const isAdmin = "${isAdmin}"
    	
    	if(isAdmin === "false")
    		document.getElementById("submit_edit_book").style.display = "none";
    
    	const isLiked=${isLiked} 
    	const isWatchLater=${isWatchLater} 
    	const notFav = "https://cdn-icons-png.flaticon.com/512/2550/2550224.png", fav="https://cdn-icons-png.flaticon.com/512/2107/2107774.png"
    	const notWatchlist = "https://cdn-icons-png.flaticon.com/512/5662/5662990.png", watchlist="https://cdn-icons-png.flaticon.com/512/5667/5667029.png"
    	
    	console.log(isLiked, isWatchLater);
    	document.getElementById("like").src = isLiked ? fav : notFav;
    	document.getElementById("Watch_Later").src = isWatchLater ? watchlist : notWatchlist
    	
    	function manageFav(){
    		let uri="/books/"+"${book.bookId}"+"/fav/";
    		uri = uri + ( isLiked ? "remove" : "add") ;
    		console.log(uri);
    		
    		fetch("http://localhost:8080"+uri , {method : "get"})
    			.then(res => res)
    			.then(res => {
    				console.log(res.status)
    				if( res.status == 200)
    					window.location.reload();
    			})
    	}
    	
    	function manageWatchLater(){
    	
    		let uri="/books/"+"${book.bookId}"+"/watchlater/";
    		
    		uri = uri + (isWatchLater ? "remove" : "add") ;
    		console.log(uri);
    		
    		fetch("http://localhost:8080"+uri , {method : "get"})
    			.then(res => res)
    			.then(res => {
    				console.log(res.status)
    				if( res.status == 200)
    					window.location.reload();
    			})
    	}
  	
  	</script>
  </body>
  
  
</html>
