function displayBookTable(tableId, books){
    	
    		const bookTableHeader = `<tr> <th onclick=sortBooks('bookId') id='bookId'> Book Id </th>
				<th onclick=sortBooks('title') id='title' > Title</th>
				<th onclick=sortBooks('publisher') id='publisher' > Publisher </th> 
				<th onclick=sortBooks('price') id='price' > Price </th>
			</tr>`
    	
    		const bookTable = document.getElementById(tableId);
    		bookTable.innerHTML = bookTableHeader
    		
    		if(!bookTable || !books)
    			return;
    			
    		
    		
    		for( var i =0;i< books.length;i++){
				var cellValues = books[i] , currIndex = 0;
				let row = bookTable.insertRow(i+1);
				
				cell = row.insertCell(currIndex++);
				cell.innerHTML = cellValues.id ; 
				
				cell = row.insertCell(currIndex++);
				cell.innerHTML = cellValues.title ; 
				
				cell = row.insertCell(currIndex++);
				cell.innerHTML = cellValues.publisher ;
				
				cell = row.insertCell(currIndex++);
				cell.innerHTML = cellValues.price ;
				
				if(username != null && username != ""){
					cell = row.insertCell(currIndex++);
					cell.title = "view book";
					cell.onclick = function(){
					 	bookId = books[row.rowIndex-1].id;
						window.location.assign("http://localhost:8080/books/"+bookId);
					};
					cell.style.width = "0%";
					cell.innerHTML = " <img src=\"https://cdn-icons-png.flaticon.com/512/159/159604.png\" width='20px' height='20px' />" ;
					
					if(isAdmin === "true"){
						cell = row.insertCell(currIndex++);
						cell.title = "edit book"
						cell.onclick = function(){
					 		bookId = books[row.rowIndex-1].id;
							window.location.assign("http://localhost:8080/books/edit/"+bookId);
						};
						cell.style.width = "0%";
						cell.innerHTML = " <img src=\"https://cdn-icons-png.flaticon.com/512/1827/1827933.png\" width='20px' height='20px' />" ;
					
						cell = row.insertCell(currIndex++);
						cell.title = "delete book";
						cell.onclick = function(){
							bookId = books[row.rowIndex-1].id;
							fetch("http://localhost:8080/books/"+bookId , {method:"DELETE"})
								.then(res => res)
								.then(res => {
									alert(res);
									if(res.status == 200)
										window.location.reload();
								})
								.catch(console.err);
						}
						
						cell.style.width = "0%";
						cell.innerHTML = " <img src=\"https://cdn-icons-png.flaticon.com/512/3096/3096687.png\" width='20px' height='20px' />" ;

					
					}
				}
				else{
					cell = row.insertCell(currIndex++);
					cell.innerHTML = "<a href=\"login\"> Login to view </a>" ;
				}
			}
    	}