<!DOCTYPE html>
<html>
  <head>
    <title>Profile Details</title>
    <link rel="stylesheet" href="/login.css">
    <link rel="stylesheet" type="text/css" href="/navbar.css">
    <style>
    	h3{
    	 	color: red;
    		text-align: center; 
    		padding-top: 50px;
    	}
    </style>
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
  	
  	<h3> Liked Books </h3>
    <table id="liked_books"> 
		<tr>
			<th> Title</th>
			<th> Description </th> 
		</tr>
	</table>
	
	<h3> Watch later Books </h3>
	<table id="watchlater_books"> 
		<tr>
			<th> Title</th>
			<th> Description </th> 
		</tr>
	</table>
	<script src="/navbar.js"> </script>
	<script src="/displayBookTable.js"> </script>
    <script>
    	
    	const likedBooks = ${likedBooks}
    	const watchlaterBooks = ${watchLaterBooks}
    	const username="${username}"
    	const isAdmin="${isAdmin}"
    	
    	
    	showNavbar("${username}")
    	displayBookTable("liked_books", likedBooks);
    	displayBookTable("watchlater_books", watchlaterBooks);
    	
  	
  	</script>
  </body>
  
  
</html>
