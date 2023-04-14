package com.example.bookstore;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.bookstore.entity.Book;
import com.example.bookstore.entity.User;
import com.example.bookstore.repository.BookRepository;
import com.example.bookstore.service.BookService;
import com.example.bookstore.service.UserService;

import jakarta.annotation.PostConstruct;

@SpringBootApplication
public class SpringbootBookStoreApplication {
	
	@Autowired
	private UserService userService ;
	
	@Autowired 
	private BookRepository bookRepository;

	public static void main(String[] args) {
		SpringApplication.run(SpringbootBookStoreApplication.class, args);
	}
	
	
	@PostConstruct
	public void addAdmin() {
		try {
			User user = new User("Admin", "Admin", "Admin@gmail.com", "Admin18@", "Admin");
			userService.addUser(user);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		List<Book> books = List.of(
				new Book("The Great Gatsby", "A novel by F. Scott Fitzgerald set in the roaring 20s, exploring the decadence and excess of the era.", "Scribner", "F. Scott Fitzgerald",  964.95f ),
				new Book( "1984", "A dystopian novel by George Orwell about a society ruled by a totalitarian government that controls every aspect of citizens' lives.", "Signet Classics", "George Orwell", 759.35f),
				 new Book("To Kill a Mockingbird", "A Pulitzer Prize-winning novel by Harper Lee about racial injustice and loss of innocence in a small Alabama town during the Great Depression.", "Harper Perennial Modern Classics", "Harper Lee", 1138.35f ),
				 new Book("The Catcher in the Rye", "A novel by J.D. Salinger about a teenage boy's experiences in New York City after being expelled from prep school.", "Little, Brown and Company", "J.D. Salinger",  859.05f  ),
				 new Book("The Hobbit", "A fantasy novel by J.R.R. Tolkien about the adventures of hobbit Bilbo Baggins as he journeys to reclaim a treasure stolen by the dragon Smaug.", "Houghton Mifflin Harcourt", "J.R.R. Tolkien", 713.45f) 
		);
		
		try {
			bookRepository.saveAll(books);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
