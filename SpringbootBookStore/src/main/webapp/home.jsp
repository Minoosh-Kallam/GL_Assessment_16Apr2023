<html>
	<head>
    	<link rel="stylesheet" type="text/css" href="login.css">
    	<link rel="stylesheet" type="text/css" href="navbar.css">
    	<style>
    	h3{
    	 	color: red;
    		text-align: center; 
    		padding-top: 50px;
    	}
    	.flexbox{
    		display: flex;
    		padding: 5px;
    		margin-top: 10px
    	}
    	.searchBar{
    		display: flex;
    		margin-right: auto;
    		margin-left: auto;
    		padding-right: 5px;
    		
    	}
    	.sortBy{
    		color: blue;
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

	<div class="flexbox">
		<a href="/admin/addBook" id="addBook"> Add Book </a>
		
		<div class="searchBar">
			<label style="margin-bottom: 0px" for="searchBy">Search by: </label>
			<select style="height: fit-content" id="searchBy" name="searchBy">
				<option value="bookId">Book Id</option>
				<option selected="true" value="title">Book name</option>
				<option value="publisher">Publisher</option>
				<option value="price">price range</option>
			</select>
			<input type="text" style="border-radius: 5px; border: 1px solid black" id="searchValue" name="searchValue">
			<button style="margin-left: 5px" onclick="filterBooks()">Search</button>
		</div>
	</div>
		
	<div>
		
		<h3> All Books </h3>
		<table id="book_table">
			<tr>
				<th onclick="sort('bookId')" id="bookId"> Book Id </th>
				<th onclick="sort('title')" id="title" > Title</th>
				<th onclick="sort('publisher')" id="publisher" > Publisher </th> 
				<th onclick="sort('price')" id="price" > Price </th>
			</tr>
		</table>
		
		
		<script src="/displayBookTable.js"> </script>
		
		<script > 
			const bookTableHeader = `<tr> <th onclick=sortBooks('bookId') id='bookId'> Book Id </th>
				<th onclick=sortBooks('title') id='title' > Title</th>
				<th onclick=sortBooks('publisher') id='publisher' > Publisher </th> 
				<th onclick=sortBooks('price') id='price' > Price </th>
			</tr>`

			const username = "${username}";
			const isAdmin = "${isAdmin}";
			if(username !== ""){
				document.getElementById("register").style.display = "none";
				document.getElementById("login").style.display = "none";
				document.getElementById("username").innerHTML = username;
				
			}
			else{
				document.getElementById("profile").style.display = "none";
				document.getElementById("logout").style.display = "none";
			}
			
			if(username === "" || isAdmin === "false"){
				document.getElementById("addBook").style.display = "none";
			}
			
			let books = ${books} ;
			document.getElementById("book_table").innerHTML = bookTableHeader ;
			displayBookTable("book_table", books);
			
			function filterBooks(){
				const searchBy = document.getElementById("searchBy").value;
				const searchValue = document.getElementById("searchValue").value;
				
				
				let url = new URL("http://localhost:8080/books")
				url.searchParams.append("searchBy", searchBy)
				url.searchParams.append("searchValue", searchValue)
				url = url.toString();
				console.log(url);
				fetch(url)
					.then(res => res.json())
					.then(res => {
						books = res;
						console.log(books)
						//document.getElementById("book_table").innerHTML = bookTableHeader ;
						displayBookTable("book_table", books);
					})
					.catch(err => {console.log(err);alert("An error occurred, Please try again later" ) });
			}
			
			function sortBooks(sortByColumn){
				const bookTable = document.getElementById("book_table");
				
				if(sortByColumn === "bookId"){
					books.sort((a, b) => a.id - b.id);
				}
				else if(sortByColumn === "title"){
					books.sort((a, b) => a.title.localeCompare(b.title));
				}
				else if(sortByColumn === "publisher"){
					books.sort((a, b) => a.publisher.localeCompare(b.publisher));
				}
				else if(sortByColumn === "price"){
					books.sort((a, b) => a.price - b.price);
				}
				
				displayBookTable("book_table", books);
				//document.getElementById("book_table").innerHTML = bookTableHeader ;
				document.getElementById(sortByColumn).style.color = "blue";

			}
			
	</script>
	</body>
	
</html>