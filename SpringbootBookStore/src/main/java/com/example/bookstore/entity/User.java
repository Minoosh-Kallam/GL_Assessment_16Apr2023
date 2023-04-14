package com.example.bookstore.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor @NoArgsConstructor 
@Getter @Setter
@Table(name = "User_details")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int UserId;
	@Column(nullable = true, unique = true)
	private String userName;
	private  String name;
	@Column(nullable = true, unique = true)
	private  String email;
	private  String password;
	
	private String role;
	
	@ManyToMany
	private List<Book> likedBooks;
	
	@ManyToMany
	private List<Book> wishList;
	
	
	public User(String UserName, String name, String email, String password, String role) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.userName = UserName;
		this.role = role;
		likedBooks = new ArrayList<>();
		wishList = new ArrayList<>();
	}
	
	public User(String UserName, String password) {
		this.password = password;
		this.userName = UserName;
		likedBooks = new ArrayList<>();
		wishList = new ArrayList<>();
	}
	

	public String toString() {	
		String toString = """
				{
					UserId : "#UserId#",
					name: "#name#",
					email: "#email#",
					password: "#password#",
					UserName: "#UserName#",
					likedUsers: "#likedUsers#",
					wishList: "#wishList#"
				}
				""".replace("#UserId#", ""+UserId)
				.replace("#name#", name != null ? name : "")
				.replace("#email#", email != null ? email : "")
				.replace("#UserName#", userName != null ? userName : "")
				.replace("#password#", password != null ? password : "")
				.replace("#likedUsers#", likedBooks != null ? likedBooks.toString() : "[]")
				.replace("#wishList#", wishList != null ? wishList.toString() : "[]")
				;
		
		return toString;
	}
	
	public void addBookToFav(Book book) {
		this.getLikedBooks().add(book);
		book.getLikedUsers().add(this);
	}
	
	public void removeBookFromFav(Book book) {
		this.getLikedBooks().remove(book);
		book.getLikedUsers().remove(this);
	}

	
}
