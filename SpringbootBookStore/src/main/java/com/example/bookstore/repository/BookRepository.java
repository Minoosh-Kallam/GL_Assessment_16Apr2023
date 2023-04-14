package com.example.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.bookstore.entity.Book;

import jakarta.transaction.Transactional;

@Repository
public interface BookRepository extends JpaRepository<Book, Integer>{

	@Query(value = "delete from user_details_liked_books where liked_books_book_id = ?1", nativeQuery = true)
	@Transactional @Modifying
	public void deleteLikedBook(int bookId) ;
	
	@Query(value = "delete from user_details_wish_list where wish_list_book_id = ?1", nativeQuery = true)
	@Transactional @Modifying
	public void deleteWatchLaterBook(int bookId) ;

}
