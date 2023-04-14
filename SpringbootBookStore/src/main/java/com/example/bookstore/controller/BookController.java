package com.example.bookstore.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.bookstore.entity.Book;
import com.example.bookstore.entity.Book;
import com.example.bookstore.repository.BookRepository;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.UserService;
import com.example.bookstore.service.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired 
	private UserService userService;
	
	
	@GetMapping("/admin/addBook")
	public String getBookForm(HttpSession session) {
		
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		return "addBook";
	}
	
	@GetMapping("/books/{id}")
	public String getBook(@PathVariable int id, Model model, HttpSession session) {
		String username = (String)session.getAttribute("username");
		boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
		if(username == null)
			return "redirect:/login";
		
		Book book = bookService.getBook(id);
		int userId = (Integer)session.getAttribute("userId") ;
		
		model.addAttribute("book", book);
		model.addAttribute("isAdmin", isAdmin);
		model.addAttribute("username", username);
		model.addAttribute("isLiked", userService.isFav(userId, id ));
		model.addAttribute("isWatchLater", userService.isWatchLater(userId, id));
		
		return "getBook";
	}
	
	@PostMapping("/admin/addBook")
	public String addBook(Book book, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		Book book1 = bookService.addBook(book);
		return "redirect:/books/"+book1.getBookId();
	}
	
	@GetMapping("/books/edit/{id}")
	public String getEditBookForm(@PathVariable int id, Model model, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		Book book = bookService.getBook(id);
		model.addAttribute("book",book);
		return "editBook";
	}
	
	@PostMapping("books/{id}")
	public String editBook(@PathVariable int id, Book book, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		book.setBookId(id);
		bookService.updateBook(book);
		
		return "redirect:/home";
	}
	
	@DeleteMapping("/books/{id}")
	@ResponseBody
	public String deleteBook(@PathVariable int id, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "Unable to delete as you are not authenticated";
		
		bookService.deleteBook(id);
		return "Book successfully deleted";
	}
	
	@GetMapping("/books/{id}/fav/{action}")
	@ResponseBody
	public String bookFavHandler(@PathVariable int id,@PathVariable String action, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		
		int userId = (Integer)session.getAttribute("userId") ;
		if(action.equalsIgnoreCase("add")) {
			userService.addToFav(userId, id);
			return "success";
		}else {
			userService.removeFromFav(userId, id);
			return "success";
		}
	}
	
	@GetMapping("/books/{id}/watchlater/{action}")
	@ResponseBody
	public String bookWishListHandler(@PathVariable int id,@PathVariable String action, HttpSession session) {
		String username = (String)session.getAttribute("username");
		if(username == null)
			return "redirect:/login";
		
		int userId = (Integer)session.getAttribute("userId") ;
		if(action.equalsIgnoreCase("add")) {
			userService.addToWatchLater(userId, id);
			return "success";
		}else {
			userService.removeFromWatchLater(userId, id);
			return "success";
		}
	}
	
	@GetMapping("/books")
	@ResponseBody
	public String getFilteredBooks(@RequestParam String searchBy, @RequestParam String searchValue){
		return bookService.getFilteredBooks(searchBy, searchValue);
	}
	
}
