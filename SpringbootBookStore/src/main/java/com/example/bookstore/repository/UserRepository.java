package com.example.bookstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.bookstore.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query(value = "select User from User user where user.userName = ?1 and user.password = ?2")
	public User areCredentailsValid(String username, String password);
	
	public User findByUserName(String userName);
}
