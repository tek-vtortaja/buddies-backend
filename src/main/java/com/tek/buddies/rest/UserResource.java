package com.tek.buddies.rest;

import com.tek.buddies.entity.User;
import com.tek.buddies.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by vtortaja on 2017-03-20.
 */
@RestController
public class UserResource {

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/api/user")
    public List<User> getUsers(){
        return userRepository.findAll();
    }

    @PostMapping("/api/user")
    public User createUser(User user){
        return userRepository.save(user);
    }

    @PutMapping("/api/user")
    public User updateUser(User user){
        return userRepository.save(user);
    }

    @GetMapping("/api/user/{userId}")
    public User findById(@PathVariable Long userId){
        return userRepository.findOne(userId);
    }

    @DeleteMapping("/api/user/{userId}")
    public void delete(@PathVariable Long userId){
        userRepository.delete(userId);
    }
}
