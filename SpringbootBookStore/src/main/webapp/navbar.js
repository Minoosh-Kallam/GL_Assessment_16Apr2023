const showNavbar = (username) => {
	console.log("show navbar "+username);
	if(username !== ""){
		document.getElementById("register").style.display = "none";
		document.getElementById("login").style.display = "none";
		document.getElementById("username").innerHTML = username;
				
	}
	else{
		document.getElementById("profile").style.display = "none";
		document.getElementById("logout").style.display = "none";
		
		if(isAdmin === "false")
			document.getElementById("addBook").style.display = "none";
	}
}