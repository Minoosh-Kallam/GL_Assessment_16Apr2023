package com.example.bookstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.bookstore.entity.Book;
import com.example.bookstore.entity.User;
import com.example.bookstore.entity.Book;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.UserService;
import com.example.bookstore.service.BookService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	@GetMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "redirect:login";
	}
	
	@PostMapping("register")
	public String doRegister(User user, HttpSession session) {
		
		userService.addUser(user);
		session.setAttribute("username" , user.getUserName());
		session.setAttribute("isAdmin" , user.getRole().equals("Admin"));
		return "redirect:login";
	}
	
	@RequestMapping(value = "doLogin")
	public String doLogin(User user, HttpSession session) {
		User newUser = userService.areCredentialsValid(user.getUserName(), user.getPassword());
		if(newUser != null) {
			session.setAttribute("username", newUser.getUserName());
			session.setAttribute("userId", newUser.getUserId());
			session.setAttribute("isAdmin", newUser.getRole().equals("Admin"));
			return "redirect:home";
		}
		session.setAttribute("error", "Invalid credentials: Incorrect username or password");
		return "redirect:login" ;
		
	}
	
	@GetMapping("login")
	public String getLoginPage(HttpSession session, Model model) {
		String username = (String)session.getAttribute("username" );
		String error = (String)session.getAttribute("error" );
		if(username != null) {
			model.addAttribute("username", username);
//			model.addAttribute("isAdmin", session.getAttribute("isAdmin"));
		}
		if(error != null) {
			model.addAttribute("error", error);
			session.removeAttribute("error");
		}
		return "login";
	}
	
	@GetMapping("register")
	public String getRegisterPage() {
		return "register";
	}
	
	@GetMapping("home")
	public String getHomePage(HttpSession session, Model model) {
		String username = (String)session.getAttribute("username") ;
		if(username != null)
			model.addAttribute("username", username);
		
		List<Book> books = bookService.getAllBooks();
		model.addAttribute("books", books);
		return "home";
	}
	
	@GetMapping("/profile")
	public String getProfile(HttpSession session, Model model) {
		
		
		String username = (String)session.getAttribute("username"); 
		if(username == null)
			return "redirect:/login";
		
		int userId = (Integer)session.getAttribute("userId");
		User user = userService.getUser(userId);
		boolean isAdmin = user.getRole().equals("Admin") ;
		List<Book> likedBooks = userService.getLikedBooks(userId);
		List<Book> watchLaterBooks = userService.getWatchLaterBook(userId);
		
		model.addAttribute("watchLaterBooks" , watchLaterBooks);
		model.addAttribute("likedBooks", likedBooks);
		model.addAttribute("username", username);
		model.addAttribute("isAdmin", isAdmin);
		
		
		
		return "profile";
	}

}
